This patch documents alignment requirements for atomic types. This issue came up in https://reviews.llvm.org/D57450

Using a small test program, I have deduced the rules for atomic type size and alignment in GCC. There are more details about how I did this in a comment on that review, which I quote below (`MaxAtomicPromoteWidth` is a target-specific configuration option in Clang, which controls changing the alignment of atomic types based on their size):

> I've been looking at how GCC and Clang differ in how they deal with issues around size and alignment of atomic objects.
> 
> All types of size less than or equal to `MaxAtomicPromoteWidth`, when they are turned into their atomic variant, will: a) have their size rounded up to a power of two, and b) have their alignment changed to that same power of two.
> 
> The following Gist contains:
> - a C program which will print the size and alignment of a variety of strangely sized and aligned objects, and their atomic variants.
> - the output of this program when run through gcc and clang, specifying `rv(32,64)ima(,fd)` and `(ilp32,lp64)(,f)` (matching ABIs to architectures). I used `riscv64-unknown-linux-gnu-gcc` for the avoidance of doubt (this compiler allows you to compile for rv32 by specifying a 32-bit -march value).
> - the diffs in those outputs for an single ABI, between the two different compilers.
> The gist is here: https://gist.github.com/lenary/2e977a8af33876ba8e0605e98c4e1b0d
> 
> There are some differences between GCC and Clang, that seem not to be risc-v specific (I saw them when running the C program on my mac)
> - Clang ensures zero-sized objects become char-sized when they become atomic. GCC leaves them zero-sized. This is documented in ASTContext.cpp line 2130, to ensure the atomic operation is generated.
> - GCC seems not to round up the size and alignment of non-power-of-two-sized structures.
> 
> I think this patch needs to be updated to ensure there are no differences in objects of power-of-two size. To do this, both riscv64 and riscv32, should have a `MaxAtomicPromoteWidth` of 128.
