This pull request is the `riscv-isa-manual` version of a pull request started on `riscv-crypto`: https://github.com/riscv/riscv-crypto/pull/362.

⚠️  This pull request is a draft for the fast track extension projects.

Fast track is tracked in https://riscv.atlassian.net/browse/RVS-1915


This pull requests draft the changes associated with two fast track extensions for vector crypto.

During the specification process for vector crypto 1.0.0 a few items had to be discarded because they appeared too late in the process. This fast track extension tries to address some of them.

The official demand that will be discussed in the Task Group and submitted to the Unpriv Committee is being drafter here: https://docs.google.com/document/d/1zpYhnZi2NxhjfcBGvPOy0oDhx6lTXchscG17Qcl6wv8/edit?usp=sharing

## New features:

- `Zvbc32e`: Extending `vclmul[h].v[vh]` instruction to support `SEW=32-bit` value
  - should be available standalone (`ELEN >= 32`) or in addition to `Zvbc` (`ELEN >= 64`)
  - no new encoding
- `Zvkgs`: Adding `.vs` variants to `vghsh` and `vgmul`
  - should depend on `Zvkg`
  - new encodings


## Open questions:

- [X] Should `Zvbc32e` be allowed when `ELEN >= 32` without depending on `Zvbc` ? (Answer: **YES**) 
- [x] Should `Zvbc32e` support SEW=16 ? (SEW=8 ?)
- [x] Find encodings
- [x] ~~How to name the two new extensions~~ 
- [x] Do we need to define a `Zvkt(bc/bc32e)` to extend `Zvkt` to the extension of `vclmul[h/]` defined in `Zvbc32e` ?

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


## Draft versions:

| Version | pdf |
|--------|--------| 
| v0.0.1 (August 31st 2023) | https://github.com/riscv/riscv-crypto/files/12487628/riscv-crypto-spec-vector-extra.pdf |
| v0.0.2 (January 17th 2024) | https://github.com/riscv/riscv-crypto/files/13970691/riscv-crypto-spec-vector-extra.pdf |
| v0.0.3 (February 1st 2024) | https://github.com/riscv/riscv-crypto/files/14146438/riscv-crypto-spec-vector-extra_v0.0.3.pdf |
| v0.0.4 (February 6th 2024) | [riscv-crypto-spec-vector-extra_v0.0.4.pdf](https://github.com/riscv/riscv-crypto/files/14189035/riscv-crypto-spec-vector-extra_v0.0.4.pdf) |
| v0.0.5 (March 7th 2024) | [riscv-crypto-spec-vector-extra_v0.0.5.pdf](https://github.com/riscv/riscv-crypto/files/14533214/riscv-crypto-spec-vector-extra_v0.0.5.pdf)|
| v0.0.6 (June 19th 2024) | [riscv-crypto-spec-vector-extra_v0.0.6.pdf](https://github.com/user-attachments/files/15908757/riscv-crypto-spec-vector-extra_v0.0.6.pdf)
| v0.0.7 (July 31st 2024) | [riscv-crypto-spec-vector-extra_v0.0.7.pdf](https://github.com/user-attachments/files/16450464/riscv-crypto-spec-vector-extra_v0.0.7.pdf)
| v0.0.9 (September 23rd 2024) | [riscv-crypto-spec-vector-extra_v0.0.9.pdf](https://github.com/user-attachments/files/17093403/riscv-crypto-spec-vector-extra_v0.0.9.pdf)
| v0.0.10 (October 19th 2024) | [riscv-crypto-spec-vector-extra_v0.0.10.pdf](https://github.com/user-attachments/files/17446988/riscv-crypto-spec-vector-extra_v0.0.10.pdf)
| v0.0.11 (December 5th 2024) | [riscv-crypto-spec-vector-extra_v0.0.11.pdf](https://github.com/user-attachments/files/18028912/riscv-crypto-spec-vector-extra_v0.0.11.pdf)
| v0.0.12 (February 17th 2025) | [riscv-crypto-spec-vector-extra_v0.0.12.pdf](https://github.com/user-attachments/files/18831355/riscv-crypto-spec-vector-extra_v0.0.12.pdf)
| v0.0.13 (September 27th 2025) | [riscv-crypto-spec-vector-extra_v0.0.13.pdf](https://github.com/user-attachments/files/22576258/riscv-crypto-spec-vector-extra_v0.0.13.pdf)




### Changelogs

- from **v0.0.5** to **v0.0.6**:
    - adding `vs2` / `vd` overlap as reserved encoding for new `vghsh.vs` / `vgmul.vs` instructions (review feedback from @QJtaibai ) 
- from **v0.0.8** to **v0.0.9**:
    - change name OP-P to OP-VE
    - adding justification for Zvbc32e and Zvkgs
- from **v0.0.9** to **v0.0.10**:
    - Changing `Zvbc32e` specification to incorporate 8 and 16-bit carry-less multiplication
    - Fixing typos (including unifying to "carry-less" (1)) 
- from **v0.0.10** to **v0.0.11**:
    - implementing ARC feedback:
        - explicit mention of "reserved" behavior for vl / vstart not multiple of EGS
        - split into two chapters (one per extension)
    - multiple typo fixes + switch to in "development" state
- from **v0.0.11** to **v0.0.12** (Feb 17th 2025):
    - review feedback removing some repetitions with regard to Zvkt mandate
- from **v0.0.12** to **v0.0.13** (Sep 27th 2025):
    - fixing missing links (including to `vgmul.vs` spec)
    - unifying "carry less" to "carryless"  

## Original Plan for the fast track schedule

![image](https://github.com/riscv/riscv-crypto/assets/82109999/52876c80-7a28-4bd5-a63d-428b2fb7eaa7)


## References

- project announcement  on the unpriv mailing list (https://lists.riscv.org/g/tech-unprivileged/message/568) and the crypto TG mailing list (https://lists.riscv.org/g/tech-crypto-ext/message/944) 

