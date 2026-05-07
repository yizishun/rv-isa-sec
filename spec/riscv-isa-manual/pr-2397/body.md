Clarify PMP rule regarding M-mode access to unlocked regions.

This topic has been the source of a lot of confusion, such as 

https://github.com/riscv-non-isa/riscv-arch-test/issues/740#issuecomment-3534216177

In particular, it is unclear from the spec whether the paragraph above takes priority over the earlier paragraph that states application to M-mode is optional.  I think it is helpful to be explicit.

```
PMP checks are applied to all accesses whose effective privilege mode is S or U, including instruction
fetches and data accesses in S and U mode, and data accesses in M-mode when the MPRV bit in
mstatus is set and the MPP field in mstatus contains S or U. PMP checks are also applied to page-table
accesses for virtual-address translation, for which the effective privilege mode is S. Optionally, PMP
checks may additionally apply to M-mode accesses, in which case the PMP registers themselves are
locked, so that even M-mode software cannot change them until the hart is reset. 
```
