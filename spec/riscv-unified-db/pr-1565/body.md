This PR addresses Issue #1186 by explicitly defining all reserved/WPRI fields in `mnstatus.yaml` as per the RISC-V Smrnmi specification.

**Changes:**
- Explicitly defined `Reserved_High` (Bits 63-13).
- Added `MNPELP` (Bit 9) from Zicfilp extension.
- Added `Reserved` fields for all gaps (Bits 0-2, 4-6, 8, 10).
- Fixed `Reserved` field locations to use valid `rv32`/`rv64` ranges.


**Note:** This is a pilot implementation to establish the correct pattern. Once approved, I will apply this pattern to the remaining CSR files in subsequent PRs.
Closes #1186

