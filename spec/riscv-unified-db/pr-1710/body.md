## Summary

The `vmv.x.s` instruction didn't have an IDL `operation()` implementation, so the ISS was producing incorrect results whenever it executed this instruction. This caused the `vmv_v_i` test to fail — the test uses `vmv.x.s` to read vector elements into integer registers for comparison.

This PR adds the missing operation:
- Reads element 0 of the source vector register `vs2`
- Sign-extends it to XLEN bits
- Writes the result to integer register `xd`
- Resets `vstart` to 0

The implementation follows the Sail reference that was already in the spec file, and matches the RISC-V V spec (Section 16.1).

Also filled in the `long_name` and `description` fields that were previously placeholders.

Fixes #1692

## Test plan

- The existing `vmv_v_i` test (`tests/isa/rv64uv/vmv_v_i.S`) already exercises `vmv.x.s` in every test case — it's the instruction that was broken and causing the test failures reported in #1692
- The Sail reference implementation in the same file provides a cross-check for correctness
