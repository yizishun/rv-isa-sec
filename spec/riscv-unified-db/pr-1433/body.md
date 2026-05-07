## Summary

Fix a bug in `vsetvl.yaml` and `vsetivli.yaml` where the first AVL comparison uses `<` instead of `<=`.

## Problem

The Sail reference model correctly uses `<=` for the first comparison:

```sail
vl = if AVL <= VLMAX then to_bits(sizeof(xlen), AVL)
     else if AVL < 2 * VLMAX then to_bits(sizeof(xlen), (AVL + 1) / 2)
     else to_bits(sizeof(xlen), VLMAX);
```

However, the IDL `operation()` was incorrectly using `<`:

```idl
if (avl < vlmax) {        // Bug: should be <=
  CSR[vl].VALUE = avl;
} else if (avl < 2*vlmax) {
  ...
}
```

## Impact

When AVL exactly equals VLMAX, the incorrect code would:
- Skip the first branch (`avl < vlmax` is false when avl == vlmax)
- Enter the second branch (`avl < 2*vlmax` is true)
- Set vl to either `ceil(AVL/2)` or VLMAX depending on configuration

The correct behavior is to set `vl = AVL` when `AVL <= VLMAX`.

Note: `vsetvli.yaml` already had the correct `<=` operator.

## Changes

- `vsetvl.yaml`: Change `avl < vlmax` to `avl <= vlmax`
- `vsetivli.yaml`: Change `AVL < vlmax` to `AVL <= vlmax`
- Also added consistent spacing around `*` operator

## Test plan

- [x] IDL now matches Sail reference model
- [x] Consistent with vsetvli.yaml which already used `<=`
