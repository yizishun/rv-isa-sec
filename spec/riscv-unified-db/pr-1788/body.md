…th alternate link register

This commit introduces the Xqccmt extension, a Qualcomm custom variant of the Zcmt (Table Jump) extension. Xqccmt provides compressed (16-bit) jump table instructions with an alternate link register mechanism.

Key changes:
- Added extension definition in spec/custom/isa/qc_iu/ext/Xqccmt.yaml with comprehensive documentation
- Implemented qc.cm.jt (jump only) and qc.cm.jalt (jump with link) instructions
- Updated cfgs/qc_iu.yaml to include Xqccmt v0.1.0 in implemented_extensions
- Modified jvt CSR to support Xqccmt via anyOf in definedBy
- Ensured mutual exclusivity with Zcmt through identical encoding space

The extension reuses the always-zero bit 0 of call table entries (index ≥ 32) as metadata to select between ra (x1) and t0 (x5) as the return address register, while maintaining standard jump target calculation.
