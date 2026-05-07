This proposal outlines a new variant of the calling convention specifically designed for fixed-length vectors. The primary aim of this variant is to facilitate the passing of fixed-length vectors through vector registers. This approach is derived from the standard vector calling convention, it uses the same register conventions and argument passing and return value rules.

A key aspect of this variant is the introduction of ABI_VLEN, which denotes the width of a vector register within this convention. The ABI_VLEN is constrained to be no wider than the ISA's VLEN (Vector Length), ensuring compatibility while allowing for flexibility in different implementations. This parameter can be configured via compiler command line options or through function attributes in source code.

The document recommends setting the default ABI_VLEN to 128 bits, acknowledging it as a common minimal requirement while allowing the flexibility for lower VLEN (32 or 64 bits) as permitted by the ISA. This flexibility is crucial for optimizing the utilization of longer VLENs in various cores.

The proposal specifies how fixed-length vector arguments are passed based on their size relative to ABI_VLEN. Vectors smaller than ABI_VLEN are passed in a single vector argument register, while larger vectors are passed in multiple registers, following the LMUL (Length Multiplier) pattern of 2, 4, or 8, depending on their size.

Additionally, the proposal addresses the handling of structs and unions containing fixed-length vectors. Structs with members that are all fixed-length vectors follow the vector tuple type rules if they conform to size constraints. In contrast, unions with fixed-length vectors adhere to the integer calling convention.
