Resolve a contradiction between the prose and the encoding map for mixed same-width FP input formats on vfmmacc.vv:

- An editorial NOTE in "Sub-word inputs (OFP4, OFP8)" claimed that mixed E4M3 x E5M2 inputs were permitted only with widening instructions (vfwmmacc.vv, vfqwmmacc.vv), not with vfmmacc.vv, and justified this by arguing that "the exact product (up to 7 significand bits) exceeds the OFP8 output precision (p <= 4)".

- The "16-bit inputs" paragraph said that mixed FP16 x BF16 inputs were permitted only with widening instructions, with an analogous "up to 19 significand bits" argument.

- The normative encoding map (tbl-fp-encoding-map), however, permits all four mixed-format combinations of vfmmacc.vv at both SEW=8 (Zvvofp8mm) and SEW=16 (Zvvfp16mm AND Zvvbf16mm).

The prose rationale is also incorrect on its own terms: the same-format E4M3 x E4M3 case produces a wider (7-bit) exact product than the mixed E4M3 x E5M2 case (6-bit), and same-format E4M3 x E4M3 is permitted.  The "exceeds output precision" argument applies equally to same-format and mixed-format at a given element width; it cannot justify restricting only the mixed case.

Resolution: take the permissive interpretation.  Mixed-format inputs are now permitted on all three floating-point multiply-accumulate instructions (vfmmacc.vv, vfwmmacc.vv, vfqwmmacc.vv) whenever the two input formats share the same element width -- E4M3 x E5M2 for 8-bit inputs and FP16 x BF16 for 16-bit inputs.  This matches both the encoding map and the general statement at the top of the "Mixed-format inputs" subsection ("permitted for all floating-point multiply-accumulate instructions").

Changes:

- Sub-word inputs subsection: delete the incorrect NOTE; rewrite the 8-bit paragraph to state that all four E4M3/E5M2 combinations are permitted on all three FP instructions, covered by the single OFP8 subextension for the given output format.

- 16-bit inputs subsection: rewrite the mixed FP16/BF16 paragraph to permit vfmmacc.vv alongside the widening variants.  Keep the requirement that both Zvvfp16mm* and Zvvbf16mm* must be present for the mixed case.

- Subextension requirements table: add two rows for vfmmacc.vv with FP16 and BF16 outputs (both require Zvvfp16mm AND Zvvbf16mm).

The SAIL code is unchanged: the existing fp_gemm / fp_block_dot path uses fp_mul_to(a, fmt_A, b, fmt_B, ...) and correctly handles mixed formats with a single rounding to fmt_C.  The encoding map is also unchanged (it was already consistent with the permissive rule).
