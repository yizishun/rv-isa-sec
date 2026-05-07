Fix https://github.com/riscv/riscv-cheri/issues/840
Fix https://github.com/riscv/riscv-cheri/issues/832
Fix https://github.com/riscv/riscv-cheri/issues/791

I've taken #839 as a start and integrated the encoding appendix into the base chapter.

This should hopefully clarify that all `RVY<XLEN>_L<params>` ISA strings are instantiations of the RVY base ISA. _L<params> was suggested  as a way to define properties that change the observable behaviour of the RISC-V system, so something like _Libigendian, or the capability encoding.

This is a draft, I may have made some mistakes while moving text around.
