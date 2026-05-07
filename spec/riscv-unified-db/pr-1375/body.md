## Summary

This PR addresses the question raised in issue #1319 about the relationship between the Ssstrict extension and the TRAP_ON_UNIMPLEMENTED_* parameters.

## Analysis

The Ssstrict extension description clearly states:
> "Attempts to execute unimplemented opcodes or access unimplemented CSRs in the standard or reserved encoding spaces raises an illegal instruction exception"

This behavior is governed by two existing parameters:
- `TRAP_ON_UNIMPLEMENTED_INSTRUCTION`: Controls whether unimplemented opcodes trap
- `TRAP_ON_UNIMPLEMENTED_CSR`: Controls whether unimplemented CSR accesses trap

For Ssstrict to be properly implemented, both parameters **must** be `true`.

## Changes

Added a `requirements` section to `Ssstrict.yaml` that enforces:
- `TRAP_ON_UNIMPLEMENTED_INSTRUCTION` = true
- `TRAP_ON_UNIMPLEMENTED_CSR` = true

This ensures that any configuration claiming Ssstrict compliance will automatically require proper trapping behavior, and tools can validate this relationship.

## Test plan

- [x] Pre-commit hooks pass
- [x] YAML schema validation passes
- [x] Requirements follow the same pattern as other extensions (e.g., Zic64b, Zvl* extensions)

Closes #1319
