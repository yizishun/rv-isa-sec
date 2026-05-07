We are considering three use cases here.

1. A true large code model needs to support more than 2 GiB of text; data accesses are out of scope for this change but jumps and calls across a range of more than 2 GiB are needed.  Most users of a large model will have more than 2 GiB of data but small text, or text with a highly local call pattern, so we want most calls to be able to use the auipc+jalr sequence.  This would normally call for relaxation, but relaxation requires object files to contain the longest possible sequence, of which several are possible.  Instead, keep the sequences the same and allow thunk insertion.

2. For executables and shared objects in a Unix environment, most of the code size benefits of relaxation come from call->jal relaxation, not data or TLS relaxation.  If the compiler is modified to generate jal instructions instead of call instructions, the code size benefits can be achieved without relaxation at all, but this requires JAL_THUNK to avoid relocation errors at a 1 MiB limit.

3. If a function has many static call sites in a large binary but is known to be dynamically cold, due to a function attribute or PGO, the call sites can be replaced with jal instructions, sharing a single thunk between all call sites within a 2 MiB text region.  This saves code size at small runtime cost.

Restricting the register usage of the thunks is an intentional feature copied from the Go 1.15 toolchain, where every non-leaf function requires a conditional call to runtime.morestack in the prologue; since ra cannot be saved before the stack frame is allocated, the call is performed using t0 as the return register.

---

There's an argument to be made that we can use thunks for JAL, CALL, and CALL_PLT because linking would fail otherwise.  I'd rather not accept the risk of breakage with that.  There's also an argument that CALL_PLT is always allowed to use a PLT, and PLT stubs clobber t1 and t2 even with STO_RISCV_VARIANT_CC, so substituting CALL_THUNK for CALL_PLT is always fine.  I'm more sympathetic to that, but we need JAL_PLT for 2/3 use cases so why not add both.

I don't have a working PoC or a schedule for preparing a working PoC.  As this is my first time on this side of the current process, what level of functional completeness are we looking for?  Do I need to cover all three use cases or would it be enough to have a working `clang -mshort-calls` and `lld` combination and results showing a binary size decrease?

Recommend using CALL_THUNK for #388, FDPIC, and any other new code models or sub-ABIs.
