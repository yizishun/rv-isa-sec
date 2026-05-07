This attempts to write down how exception handling using DWARF CFI extensions works with RISC-V. It's based on my understanding from trying to match the GCC behavior in LLVM.

I'm not sure whether this is appropriate for this document as I don't think the implementation details of exception handling are actually relevant to the ABI at all. Nonetheless, this doesn't seem to be written down anywhere.
