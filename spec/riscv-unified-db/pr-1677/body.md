## Summary

- Fixes the ISS assertion failure (`Assertion failed: (msb >= lsb)`) in `vmv.v.i` by adding boundary guards to the concatenation-based element update.
- The original code produced invalid bit-slice ranges when the element touched bit 0 (`v[vd][start_bit_pos-1:0]` with `start_bit_pos=0`) or bit `VLEN-1` (`v[vd][VLEN-1:end_bit_pos+1]` with `end_bit_pos=VLEN-1`).
- The direct LHS bit-slice assignment (`v[vd][msb:lsb] = val`) suggested by @ThinkOpenly in #1639 cannot be used because the IDL parser does not support nested array access on the LHS, and the C++ backend's `bit_insert` fails with runtime-unknown `VLEN`.

Fixes #1618

## Test plan

- [x] `gen:arch` passes — IDL compiles successfully
- [x] `test:instruction_appendix` passes — golden output matches
- [x] All pre-commit checks pass
- [ ] CI `regress-riscv-tests-32` and `regress-riscv-tests-64` should now pass
