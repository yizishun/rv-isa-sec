Closes #1217

## Problem

The `Svadu.yaml` and `Svade.yaml` extension files incorrectly listed each other as conflicting extensions using a `not` requirement. This prevented valid configurations where both extensions coexist.

## Why This Is Wrong

1. **The RISC-V spec does not indicate incompatibility** - There's no mention of these extensions being mutually exclusive.

2. **RVB23S64 profile requires both** - Looking at `spec/std/isa/profile/RVB23S64.yaml`:
   - `Svade` is **mandatory**
   - `Svadu` is **optional**
   
   This wouldn't be possible if they conflict.

3. **Linux kernel handles all combinations** - From the kernel device tree docs:
   > Both Svade and Svadu extensions control the hardware behavior when the PTE A/D bits need to be set. The default behavior for the four possible combinations...
   
   All four combinations (neither, Svade only, Svadu only, both) are valid.

## The Fix

Removed the `not` constraint from both extension files, changing from:
```yaml
requirements:
  allOf:
    - extension: {name: Sm, version: ">= 1.13"}
    - not: {extension: {name: Svade/Svadu}}
```

To:
```yaml
requirements:
  extension:
    name: Sm
    version: ">= 1.13"
```

## Testing

- Pre-commit hooks pass (including YAML validation)
- Type checking passes
