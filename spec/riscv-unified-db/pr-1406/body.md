## Summary

Refactor the vsetvli IDL `operation()` code to flatten the nested if-else structure for better readability.

## Problem

The previous implementation used nested if blocks which increased indentation depth unnecessarily:

```idl
if (xs1 == 0) {
  if (xd != 0) {
    # case 1
  } else {
    # case 2
  }
} else {
  if (avl <= vlmax) {
    # case 3
  } else if (...) {
    # more nesting...
  }
}
```

## Solution

Flatten into a single `if/else if/else` chain:

```idl
if (xs1 == 0 && xd != 0) {
  # rs1 == x0, rd != x0: set vl to VLMAX
} else if (xs1 == 0) {
  # rs1 == x0, rd == x0: keep existing vl
} else if (avl <= vlmax) {
  # Normal stripmining: AVL <= VLMAX
} else if (avl < 2 * vlmax) {
  # VLMAX < AVL < 2*VLMAX
} else {
  # AVL >= 2*VLMAX
}
```

## Changes

- Flatten nested `if (xs1 == 0) { if (xd != 0) ... }` into `if (xs1 == 0 && xd != 0) ... else if (xs1 == 0) ...`
- Add descriptive comments for each case explaining the behavior
- Add space around `*` operator for consistency (`2 * vlmax` instead of `2*vlmax`)
- No functional changes - only code structure improvements

## Test plan

- [x] YAML validation passes
- [x] Logic is unchanged - same behavior as before

Closes #1270

