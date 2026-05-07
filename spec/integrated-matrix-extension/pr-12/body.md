Allow the A and B input tiles to use different floating-point formats (altfmt_A ≠ altfmt_B) for widening multiply-accumulate instructions (vfwmmacc.vv, vfqwmmacc.vv).  For non-widening vfmmacc.vv, altfmt_A must still equal altfmt_B.

The restriction is based on exact-product representability: mixed-format inputs are permitted only when p_A + p_B ≤ p_C (the product significand fits in the accumulator format without rounding).  This condition holds for all widening combinations but fails for every non-widening mixed case.

Changes:
- Add a new "Mixed-format inputs" section defining the restriction, IEEE 754 multiplication semantics, significand-width analysis, and subextension gating rules.
- For sub-word inputs (OFP4, OFP8), all format combinations within a width class are covered by the existing subextension.
- For 16-bit mixed inputs (FP16 × BF16), both the IEEE binary16 and BFloat16 subextensions must be present (widening only).
- Update the subextensions table to clarify that OFP4 and OFP8 entries cover all format combinations (E2M1 or E3M0, E4M3 or E5M2).
- Add mixed-format intrinsic examples (E4M3 × E5M2, FP16 × BF16).
- Add IEEE 754 mixed-format note to fp_mul_to documentation.
- Update vfmmacc.vv description to require altfmt_A == altfmt_B; vfwmmacc.vv and vfqwmmacc.vv descriptions allow independent selection.

The SAIL pseudocode already decodes fmt_A and fmt_B independently and passes them separately to fp_mul_to, so no pseudocode changes are needed.
