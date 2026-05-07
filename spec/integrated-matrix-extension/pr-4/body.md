Specify when intermediate rounding is permitted during the K_eff-deep accumulation of a matrix multiply-accumulate instruction.

For widening instructions (W=2, W=4), define the sub-dot-product as the W products of (SEW/W)-bit elements within one SEW-wide slot and note that each individual product is exact at SEW precision.

For floating-point: the implementation partitions the λ×LMUL sub-dot-products into groups of G (power-of-two, 1 ≤ G ≤ λ), accumulates each group at ≥ 2×SEW internal precision, then rounds once and adds to C.  G is implementation-defined, allowing both systolic (G=1) and outer-product (G ≈ λ) datapaths.  Bit-exact reproducibility across implementations is explicitly not guaranteed.

For integer: modular (wrapping) arithmetic makes the result uniquely defined regardless of accumulation order.
