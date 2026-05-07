## Summary

- Add IDL `operation()` body for `vmv.v.v`: copies elements from vector register `vs1` into `vd`
- Add IDL `operation()` body for `vmv.v.x`: broadcasts scalar integer register `xs1` into all elements of `vd`

Both implementations follow the standard vector loop pattern: read vector state, compute `vlmax`, iterate from `vstart` to `vl`, write elements using bit-slice operations, and reset `vstart` to 0.

## Test plan

- [ ] Verify generated IDL compiles with `idlc`
- [ ] Check element loop bounds match spec (vstart to vl)
- [ ] Confirm scalar truncation to SEW bits in `vmv.v.x`
- [ ] Confirm `vstart` is reset to 0 after the loop in both instructions

🤖 Generated with [Claude Code](https://claude.com/claude-code)
