## Summary

- Fix incorrect `vtypei` immediates in `vmv_v_i.S` that encoded `vlmul=011` (LMUL=8) instead of `vlmul=000` (LMUL=1)
- This caused register group alignment failures on both Sail and the UDB-ISS, as reported in #1599
- The test comments and expected values were already correct for LMUL=1; only the hex immediates were wrong

## Changes

| Test | SEW | Before (LMUL=8) | After (LMUL=1) |
|------|-----|------------------|-----------------|
| 1, 2 | 64 | `0x1b` | `0x18` |
| 3 | 32 | `0x13` | `0x10` |
| 4 | 8 | `0x03` | `0x00` |
| 5 | 16 | `0x0b` | `0x08` |

Closes #1599
