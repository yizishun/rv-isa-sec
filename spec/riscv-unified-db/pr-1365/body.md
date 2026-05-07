## Summary

Add YAML definition for the Ssube (Big-endian User Mode) extension.

The Ssube extension indicates that the implementation supports big-endian user mode, meaning `sstatus.UBE` can be set to 1. When enabled, data accesses in U-mode use big-endian byte ordering. Instructions are always fetched as little-endian regardless of this setting.

This extension requires the `U_MODE_ENDIANNESS` parameter to be either `big` or `dynamic`.

## Test plan

- [x] YAML syntax valid
- [x] Validates against `ext_schema.json`
- [x] Pre-commit hooks pass

Closes #1203
