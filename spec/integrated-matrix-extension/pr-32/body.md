…minology

Widening applies to the arithmetic (multiply-accumulate with a wider accumulator than inputs); packing applies to the data representation (multiple narrow elements packed into one SEW-wide register slot). The spec had several places where these two distinct concepts were conflated or where the wrong term was used to name the instructions.

Changes:

- Overview / Matrix tile multiplication geometry: the instruction variants are now named "non-widening / double-widening / quad-widening / octo-widening" (arithmetic), with a separate sentence noting that the narrow input elements are packed W per SEW-wide register slot (data layout).

- ime-geometry-fig caption: clarified (a) as "Non-widening case (W=1)" and (b) as "Double-widening case (W=2) with A and B at half the SEW of C, packed two per SEW-wide slot", separating the widening classification from the packing consequence.

- ime-tile-widening-fig caption: replaced "Packing/widening by W" with "Widening by a factor W (with the corresponding packing of W narrow elements per SEW-wide slot)".

Also fix several outdated W-range references that listed only W=2 and W=4 after the W=8 instructions were added:

- Element packing section: "W=2 or W=4" -> "W=2, W=4, or W=8"
- Sub-dot-products definition: "W = 2 or W = 4" -> "W = 2, W = 4, or W = 8"
- GEMM example key observations: updated to list all widening variants including v8wmmacc.vv / vf8wmmacc.vv
- Zvvfmm overview: FP mnemonic list now includes vf8wmmacc.vv (W=8)

The remaining uses of "packing" in the document are all data-layout contexts (element packing section, scale packing, memory repacking) and are unaffected.
