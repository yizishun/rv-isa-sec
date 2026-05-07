Following the ARC review on https://github.com/riscv/riscv-isa-manual/pull/1306, I am opening this pull-request to integrate the specifications following the ARC recommendations.

Eventually this PR will represent the frozen specifications for both Zvbc32e and Zvkgs.

### RVIA tracking

This pull requests draft the changes associated with two fast track extensions for vector crypto.

Fast track is tracked in https://riscv.atlassian.net/browse/RVS-1915

### New features:
- Zvbc32e: Extending vclmul[h].v[vh] instruction to support SEW=32-bit, 16-bit and 8-bit values. Zvbc32e is available standalone (ELEN >= 32) or in addition to Zvbc (ELEN >= 64). no new encoding
- Zvkgs: Adding .vs variants to vghsh and vgmul; should depend on Zvkg; new encodings


## Related changes:

- [x] `spike-isa-sim` modifications
    - [x] add support for `Zvbc32e` and `Zvkgs`: https://github.com/riscv-software-src/riscv-isa-sim/pull/1748
- [x] encoding proposal in riscv-opcodes repo: https://github.com/riscv/riscv-opcodes/pull/270
- [ ] adapt vector crypto code samples for `Zvbce32` https://github.com/riscv/riscv-crypto/blob/main/doc/vector/code-samples/zvbc-test.c
- [ ] adapt vector crypto code samples for `Zvkgs` https://github.com/riscv/riscv-crypto/blob/main/doc/vector/code-samples/zvkg-test.c
- [x] Sail models
  - [x] `Zvkgs`: https://github.com/riscv/sail-riscv/pull/1017
  - [x] `Zvbc32e`: https://github.com/riscv/sail-riscv/pull/931
- [ ] Compiler support
  - [x] LLVM: https://github.com/llvm/llvm-project/pull/128243
  - [ ] GCC: TBD  
- [ ] **rvv-intrinsics** support: https://github.com/riscv-non-isa/rvv-intrinsic-doc/pull/420

### History 


During the specification process for vector crypto 1.0.0 a few items had to be discarded because they appeared too late in the process. This fast track extension tries to address some of them.

The official demand that will be discussed in the Task Group and submitted to the Unpriv Committee is being drafter here: https://docs.google.com/document/d/1zpYhnZi2NxhjfcBGvPOy0oDhx6lTXchscG17Qcl6wv8/edit?usp=sharing


This pull request follows a previous PR against **riscv-isa-manual**, https://github.com/riscv/riscv-isa-manual/pull/1306, which itself was the follow-up to a pull request started on the **riscv-crypto** repo: https://github.com/riscv/riscv-crypto/pull/362.
