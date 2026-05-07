As handed down on a stone tablet by the guardians of the spirit and intent of the specification, rename all computational subextensions to the new scheme: Zvv + input-types + output-types (omitted if same as input) + mm.

Type tokens: i4/i8/i16/i32/i64 for integer; ofp4/ofp8/fp16/bf16/fp32/fp64 for floating-point; x<type>mm for microscaling BS=32, xn<type>mm for BS=16.

Examples: Zvvmmb → Zvvi8mm, Zvvfmmhf → Zvvfp16fp32mm,
          Zvvfmmmxfp8h → Zvvxofp8fp16mm, Zvvfmmnxi8f → Zvvxni8fp32mm.

Add a "Naming conventions" subsection to the Subextensions of Zvvm section documenting the two-level naming scheme (family-level vs. individual subextensions) and all type tokens. Zvvmtls and Zvvmttls are unchanged.
