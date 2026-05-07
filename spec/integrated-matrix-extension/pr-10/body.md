Define vm=0 on floating-point multiply-accumulate instructions to source per-tile-row and per-tile-column E8M0 scaling factors from v0, enabling OCP Microscaling (MX) format support.

Assembly syntax: vf[q]wmmacc.vv vd, vs1, vs2, v0.scale

Semantics: C[m,n] += scale_A[m] * scale_B[n] * sum_k(A[m,k]*B[k,n]) where scale_A and scale_B are E8M0 power-of-two values read from v0.

The new "Microscaling support (v0.scale)" subsection under Zvvfmm specifies the encoding, scale layout in v0, E8M0 format, NaN handling, and proves that 2M scales always fit within a single VLEN-bit register for all legal (SEW, lambda) combinations.

The three FP instruction pages (vfmmacc, vfqwmmacc, vfwmmacc) are updated with the v0.scale mnemonic variant, vm encoding bit, and SAIL pseudocode for scale application.  Integer multiply-accumulate instructions remain unchanged (vm=0 reserved).
