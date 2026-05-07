This matches the opinion on this thread https://lists.riscv.org/g/tech-p-ext/message/927

Version bump is so I can implement this in LLVM and note it as a backwards incompatible change.

I've update the descriptions for (P)SATI/(P)USATI to use 'width' in place of 'n'. 'width' is defined as 'uimm'+1 for (P)SATI and 'uimm' for (P)USATI. I'm open to further suggestions on how to make this as clear as possible.
