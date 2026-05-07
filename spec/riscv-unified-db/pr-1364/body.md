## Summary

Add YAML definition for the Ztso (Total Store Ordering) extension.

The Ztso extension provides Total Store Ordering (TSO) memory consistency semantics for RISC-V systems. It was ratified in January 2023 as version 1.0.0. This is an optional extension that complements the baseline RISC-V Weak Memory Ordering (RVWMO) model by providing stricter memory ordering guarantees.

## Test plan

- [x] YAML syntax valid
- [x] Validates against `ext_schema.json`
- [x] Pre-commit hooks pass

Closes #1204
