Update integrated-matrix.adoc
Revised the arithmetic considerations section for floating-point. Semantics is defined based on two implementation-defined parameters: G and psm. Those parameters must be defined (off-band) by the architecture as a table of (lambda, SEW, W) -> (G, psm) mappings.

This is a compromise between implementation freedom and complete architectural specification.

Please also check the "Specialized Extensions" section.
