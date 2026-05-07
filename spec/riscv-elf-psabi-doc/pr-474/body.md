Various RISC-V extensions reuse existing instruction encoding spaces
for specialized behaviors. CFI extensions use NOP or MOP (Maybe Operation)
instructions to ensure correct program execution even when hardware 
doesn't implement CFI. Similarly, hint extensions redefine specific
encodings for performance optimization purposes.

However, this design conflicts with current toolchain conventions,
where X extension instructions are only usable when the X extension
is enabled: assemblers accept corresponding mnemonics and disassemblers
decode instructions only when the extension is active.

The affected use cases require different behavior:
- Zicfiss instructions should be available when Zimop extension is present
- Zicfilp instructions should be usable even without explicit enabling
  (since auipc is in baseline ISA)
- Hint extensions should reinterpret specific encodings regardless of
  extension enablement

Following conventional toolchain behavior would force compilers to
generate generic instructions ('mop', 'fence w,0', 'auipc x0, <value>')
instead of extension-specific mnemonics ('sspush/sspop', 'pause', 
'lpad <value>'), causing user confusion and reducing code clarity.

While this could be addressed at the ISA specification level, such
changes involve complex and time-consuming procedures. Therefore,
this psABI defines Tag_RISCV_mop_and_hint_encoding to provide toolchain
implementations with clear guidance.

This tag uses a bitmap format where each bit indicates whether specific
instruction encodings should be reinterpreted:
- Bit 0: auipc x0, <value> as lpad <value> (Zicfilp)
- Bit 1: Zimop encodings as Zicfiss instructions
- Bit 2: fence w,0 as pause hints (Zihintpause)
- Bit 3: specific encodings as non-temporal locality hints (Zihintntl)

The tag uses bitwise OR merge policy to allow combining multiple
reinterpretation requirements, with toolchain warnings recommended
when encoding space conflicts occur.
