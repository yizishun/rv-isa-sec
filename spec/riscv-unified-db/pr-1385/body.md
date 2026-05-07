## Summary

This PR fixes issue #1299 where many instructions that use `$signed(imm)` in their operation were missing the `sign_extend: true` property in their encoding section.

## Problem

Many instruction YAML files define variables for immediates that are sign-extended when used in the operation (indicated by `$signed(imm)`), but the encoding section does not include the `sign_extend: true` property. This creates an inconsistency between the encoding metadata and the actual operation semantics.

## Solution

Added `sign_extend: true` to 35 instruction YAML files across multiple extensions:

### I extension (22 files)
- Arithmetic: `addi`, `addiw`, `slti`, `sltiu`
- Logical: `andi`, `ori`, `xori`
- Upper immediate: `lui`, `auipc`
- Branch: `bgeu`, `bltu`
- Jump: `jalr`
- Load: `lb`, `lbu`, `lh`, `lhu`, `lw`, `lwu`, `ld`
- Store: `sb`, `sh`, `sw`, `sd` (RV32 section)

### C extension (5 files)
- `c.addi`, `c.addi16sp`, `c.andi`, `c.li`, `c.lui`

### F extension (2 files)
- `flw`, `fsw`

### Zfh extension (2 files)
- `flh`, `fsh`

### Zicbop extension (3 files)
- `prefetch.i`, `prefetch.r`, `prefetch.w`

## Testing

The changes are metadata-only additions that do not affect runtime behavior. They align the encoding metadata with the already-implemented sign extension behavior in the operation section.

Fixes #1299
