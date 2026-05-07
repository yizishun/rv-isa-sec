## Summary

This fix addresses the incorrect handling of the `rs1 == x0, rd == x0` case in the vsetvli instruction's IDL implementation.

According to the RISC-V Vector specification, vsetvli has three distinct cases:

1. **rs1 != x0**: Normal stripmining - AVL from X[rs1], write vl to rd
2. **rs1 == x0, rd != x0**: Set vl to VLMAX, write VLMAX to rd  
3. **rs1 == x0, rd == x0**: Keep existing vl unchanged (used to change vtype without disturbing vl)

The previous implementation only handled cases 1 and 2, incorrectly setting vl to VLMAX whenever `xs1 == 0` regardless of the value of `xd`.

## Changes

- Save the old vector state (LMUL/SEW ratio) before modifying vtype
- Add proper condition check for `xd != 0` vs `xd == 0` when `xs1 == 0`
- Implement the "keep vl" behavior for case 3, including the ratio change check that sets vill=1 and vl=0 if the LMUL/SEW ratio changes

## Alignment with Sail model

The fix aligns the IDL `operation()` implementation with the Sail reference model's `sail()` section (lines 137-161), which already correctly implements all three cases.

## Test plan

- [x] Pre-commit hooks pass
- [x] IDL implementation now matches Sail reference model behavior
- [ ] Vector instruction tests exercise all three vsetvli cases

Closes #1269
