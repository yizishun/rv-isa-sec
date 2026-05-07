## Summary

Replace TBD placeholder descriptions with accurate documentation for the embedded vector extensions and vector register length extensions. These 11 extension files previously had `description: | TBD - See GitHub issue 616`.

## Changes

### Zvl*b Extensions (6 files)
Specify minimum vector register length (VLEN) requirements:

| Extension | Min VLEN | VLMAX (SEW=8, LMUL=1) |
|-----------|----------|------------------------|
| Zvl32b    | 32 bits  | 4 elements            |
| Zvl64b    | 64 bits  | 8 elements            |
| Zvl128b   | 128 bits | 16 elements           |
| Zvl256b   | 256 bits | 32 elements           |
| Zvl512b   | 512 bits | 64 elements           |
| Zvl1024b  | 1024 bits| 128 elements          |

### Zve* Extensions (5 files)
Document the embedded vector extension hierarchy:

| Extension | ELEN | Floating-Point | Requires |
|-----------|------|----------------|----------|
| Zve32x    | 32   | None           | Zicsr, Zvl32b |
| Zve32f    | 32   | Single (F)     | F, Zve32x |
| Zve64x    | 64   | None           | Zicsr, Zvl64b |
| Zve64f    | 64   | Single (F)     | F, Zve64x |
| Zve64d    | 64   | Double (D)     | D, Zve64f |

## References

All descriptions are based on the [RISC-V Vector Extension specification v1.0](https://github.com/riscv/riscv-v-spec).

Closes #616


