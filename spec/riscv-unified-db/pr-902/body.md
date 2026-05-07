## Summary

This PR implements the Zvqdotq (Vector quad widening 4D Dot Product 8-bit Integer) extension as requested in issue #505.

## Changes Made

### Extension Definition
- Added `spec/std/isa/ext/Zvqdotq.yaml` with proper metadata
- Defined extension as unprivileged type
- Includes proper versioning and contributor information
- References the official specification repository

### Instruction Implementations
Implemented all 7 dot product instructions in `spec/std/isa/inst/Zvqdotq/`:

1. **vqdot.vv** - Vector-vector signed dot product
2. **vqdot.vx** - Vector-scalar signed dot product  
3. **vqdotu.vv** - Vector-vector unsigned dot product
4. **vqdotu.vx** - Vector-scalar unsigned dot product
5. **vqdotsu.vv** - Vector-vector signed-unsigned dot product
6. **vqdotsu.vx** - Vector-scalar signed-unsigned dot product
7. **vqdotus.vx** - Vector-scalar unsigned-signed dot product

### Technical Details
- All instructions work with SEW=32 only
- Operate on 4-element vectors of 8-bit integers
- Accumulate results into 32-bit accumulators
- Include proper instruction encoding and assembly format
- Support masking operations
- Follow UDB YAML schema requirements

## Testing
- All YAML files pass syntax validation
- Extension and instruction definitions follow existing patterns
- Encoding matches the specification from the dot-product repository

## References
- Addresses issue #505
- Based on specification: https://github.com/riscv/riscv-dot-product
- Co-authored with Kenneth Dockser (@kdockser)

## Checklist
-  Extension YAML file created with proper metadata
-  All 7 instruction YAML files implemented
- YAML syntax validation passed
- Follows existing UDB patterns and conventions
-  Proper encoding and assembly format
-  Documentation includes operation descriptions

Ready for review! 

---
