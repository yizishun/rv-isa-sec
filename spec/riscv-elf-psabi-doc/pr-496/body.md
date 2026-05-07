This clarifies that the TLSDESC func is no longer responsible for save-restore the vector registers and vector CSRS, so it will be known to clobber them by default in the compiler.

### Background
Here is some background of TLSDESC: (maybe not written for most of the folks here :) )

TLSDESC is an alternative implementation of the traditional TLS global dynamic model. The key idea is leaving a call with an undetermined function pointer at link time. Then at the runtime, the dynamic loader looks at which category the symbol belongs to and choose the best suitable handling function for it. There are 4 cases:
1. `dl_tlsdesc_undefweak` [extremely simple]: when the symbol is undefweak, just return 0. (usually not happen)
2. `dl_tlsdesc_return` [simple]: when the variable is in the static TLS block, just return the offset to TP (almost the same as LE+IE, covers most of the cases in the practice, maybe ~90%)
3. `dl_tlsdesc_dynamic` fast path [little bit complex]: when the module generation count is not changes, which happens between `dlopen`s occur. Need to lookup the DTV. (most of the cases for the modules loaded by `dlopen`, maybe 7%)
4. **`dl_tlsdesc_dynamic` slow path** [complex]: usually when new `dlopen` happens. Fall back to calling `__tls_get_addr` (rare, maybe 3%)

### The issue
There is an issue with the dynamic slow path above. Currently we define that the TLSDESC call is using a custom calling convention: 

> Any other registers are callee-saved. This includes any vector registers when the vector extension is supported.

That means `dl_tlsdesc_dynamic` itself is responsible to save-restore all the registers it modifies. The problem is that it uses `call __tls_get_addr` who is with a standard calling convention. It pessimistically assuming that `__tls_get_addr` may clobber all non-preserved registers, including vector registers. And actually it does since it uses `malloc`! So **we have to manually save/restore all the vector registers in `dl_tlsdesc_dynamic`**, which causes wasting a lot of time on the things that may not be actually used (even if it uses v-regs, it does not use much). 

This issue is the main blocker that preventing [the GLIBC patch](https://inbox.sourceware.org/libc-alpha/09A14C77-9EEA-4707-9E36-D3AAF8A98B24@gmail.com/T/#u) from being checked-in. We cannot get that ready until we resolved this issue.

### The proposals
There are two possible solutions:
1. As Jessica described here: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/issues/488, AArch64 changes SVE as clobbered and we can also adopt this behavior, let the compiler deal with v-regs. **I vote for it and created this pull request**. The regression should be tiny IMO.
2. Adhemerval mentioned about "multiple ifunc variants" in the GLIBC discussion, which my understanding is creating different function versions on different extensions and let the dynamic loader decide which one to use. I think this does not resolve the whole issue though.
