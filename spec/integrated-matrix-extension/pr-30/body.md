Resolve the inconsistency flagged by Likun Zhao: the normative tile geometry text said N_tile = VL / (λ × LMUL), but the SAIL helper and per-instruction exception lists used different divisors — integer widening used just λ (missing the LMUL factor), FP widening used K_eff = λ × W × LMUL, and these three conventions could only all agree when W = 1 and LMUL = 1.

Unify on λ × LMUL across all sources — the mathematically correct value given the spec's convention that vtype.SEW is the C (accumulator) element width. Programmers set vsetvli at vtype.SEW = C width, so VL_max = LMUL × VLEN / SEW. The invariant N_tile_max = M_tile (so the C accumulator is exactly filled) gives:

  divisor = VL_max / M_tile
          = (LMUL × VLEN / SEW) / (VLEN / (SEW × λ))
          = λ × LMUL

Using K_eff = λ × W × LMUL as the divisor would produce N_tile_max = M_tile / W for widening instructions, leaving most of the C accumulator unused.

Changes:

- SAIL decode_gemm_geometry: remove the vl_divisor_is_lambda parameter; always compute N = unsigned(vl) / (lambda × LMUL) with a comment noting the vtype.SEW = C width assumption.  All 11 GEMM instruction call sites simplified to decode_gemm_geometry(W).

- Normative tile geometry: "VL must be a multiple of λ × LMUL" with the vsetvli context made explicit.

- All 11 GEMM instruction descriptions and exception lists: phrasing unified to "VL must be / is not a multiple of λ × LMUL".

- GEMM example observations: VL expressions use λ × LMUL consistently.

- Tile load/store geometry: secondary fix — VL parameter description corrected from "must be a multiple of λ" to "must be a multiple of λ × LMUL, the line size".

K_eff is still defined and used elsewhere: the microscaling block-count formula S = ⌈K_eff / block_size⌉, the per-output-element product count, and the inner-product loops in the SAIL operation functions all reference K_eff correctly.  Only the N_tile divisor has been corrected.
