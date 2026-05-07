Add a C-Language Intrinsics subsection under "Software considerations" specifying the naming convention, type system, and representative prototypes for all IME instruction families (Zvvmtls, Zvvmm, Zvvfmm).

Naming convention:
- Type-suffix encodes the accumulator C register-group multiplier (CMUL = VLENE / λ²), independent of LMUL.
- `_lm{N}` qualifier selects LMUL when CMUL ≠ LMUL; `_lm1` may be omitted (LMUL=1 is the default).
- Non-ISO input types (BFloat16, OFP8, OFP4, Int4) always carry an explicit input-type suffix; standard IEEE types do not.
- Mixed altfmt_A ≠ altfmt_B uses dual suffixes: _{inputA}_{inputB}.
- Canonical suffix order: {type}[_{inputA}[_{inputB}]][_su|_us][_lm{N}][_L{N}]
- Overloaded short forms: GCC uses resolve_overloaded_builtin, Clang uses __attribute__((overloadable)), C++ uses standard overloading.

Tile load/store (Zvvmtls):
- Prototypes for vmtl, vmts, vmttl, vmtts across all SEW variants.
- Lambda override via compile-time `_L{N}` suffix (no runtime arg), covering all four instructions.

Integer multiply-accumulate (Zvvmm):
- vmmacc.vv (W=1), vwmmacc.vv (W=2), vqwmmacc.vv (W=4) prototypes.
- Int4 vector types (vint4m{N}_t, vuint4m{N}_t) and prototypes for Zvvmmi4b (Int4→Int8) and Zvvmmi4h (Int4→Int16).
- Mixed-sign _su/_us variants for independent altfmt_A/altfmt_B.
- Note: W=8 gap for Zvvmmi4w (Int4→Int32) and Zvvmmbd (Int8→Int64).

Floating-point multiply-accumulate (Zvvfmm):
- OFP8 types (E4M3, E5M2), OFP4 types (E2M1, E3M0) with non-ISO scalar type names (_Float8E4M3, etc.).
- vfmmacc.vv prototypes including BF16→BF16 (Zvvfmmbf16).
- vfwmmacc.vv covering OFP4→OFP8, OFP8→FP16/BF16, FP16→FP32, BF16→FP32, FP32→FP64.
- vfqwmmacc.vv covering OFP4→FP16/BF16, OFP8→FP32, BF16→FP64, FP16→FP64.
- Consolidated altfmt=1 examples (BF16, E5M2, E3M0 inputs).

Portability:
- VLEN-portable code guidance: write for the largest CMUL the code targets, select code paths at runtime (mirroring RVV practice).
