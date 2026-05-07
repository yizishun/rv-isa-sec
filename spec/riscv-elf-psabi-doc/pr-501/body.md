This is motivated by RVY where the frame layout uses YLEN (2*XLEN) values to store the return address/frame pointer.

It is also technically a change for the RV64ILP32 ABI, but my understanding is that this change is actually a bug fix, since we are storing pointers.

Split out from https://github.com/riscv-non-isa/riscv-elf-psabi-doc/pull/499
