## Problem

`ParameterTerm#<=>` in `lib/udb/logic.rb` can raise a `TypeError` during config validation:

```
T.cast: Expected type T::Boolean, got type Array with value [true, true, ...] (TypeError)
Caller: lib/udb/logic.rb:1064
```

This occurs when two `ParameterTerm` instances share the same `comparison_type` but have different `comparison_value` types (e.g., one is a `T::Boolean` scalar and the other is an `Array` of booleans). The method dispatches on `self`'s type but unconditionally `T.cast`s the other operand to the same type.

The bug is intermittent because it depends on Hash iteration order, which in Ruby is insertion-order but can vary across runs depending on how configs are loaded.

## Fix

- Cache `other_param.comparison_value` in a local (`ocv`) to avoid redundant method calls.
- Add a type-mismatch guard (`cv.class != ocv.class`) before the type-specific branches, falling back to comparing class names for a stable ordering.
- Use the cached locals (`cv`, `ocv`) consistently throughout.

## Reproduction

Run `udb validate cfg` against a config with parameters whose terms can produce mixed-type comparison values. The failure manifests most reliably on a fresh Ruby/gem install.

