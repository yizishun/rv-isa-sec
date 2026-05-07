## Summary

Add YAML definition for the Ssu32xl (32-bit UXLEN) extension.

The Ssu32xl extension indicates that the implementation supports 32-bit user mode, meaning `sstatus.UXL` can be set to 1 (UXLEN=32). This allows U-mode to run 32-bit code on a 64-bit machine.

This is the complementary extension to Ssu64xl (which requires UXLEN=64 support).

## Test plan

- [x] YAML syntax valid
- [x] Validates against `ext_schema.json`
- [x] Pre-commit hooks pass

Closes #1202
