## Summary

Add the IDL `operation()` implementation for the `vmv.v.i` (Vector Move Immediate) instruction.

## Changes

- Added proper `long_name`: "Vector move immediate to vector register"
- Added complete `description` explaining the instruction behavior
- Implemented `operation()` in IDL that:
  - Gets the current vector state (LMUL, SEW)
  - Calculates VLMAX based on LMUL type (multiply or divide)
  - Sign-extends the 5-bit immediate to XLEN bits
  - Iterates through elements from `vstart` to `vl`
  - Writes the sign-extended immediate (truncated to SEW bits) to each element
  - Resets `vstart` to 0

## Instruction Behavior

`vmv.v.i` copies a sign-extended 5-bit immediate value to all active elements of the destination vector register group. This is an unmasked instruction (vm=1), so all body elements are written with the immediate value.

## Test plan

- [x] YAML validation passes
- [x] Pre-commit hooks pass (excluding infrastructure issue with renovate)

Closes #1393
