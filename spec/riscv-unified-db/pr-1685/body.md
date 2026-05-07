## Summary

Fixes several bugs in the Zicbom/Zicboz cache block operation instruction specifications:

- **cbo.clean and cbo.flush** (`access_detail`): The descriptive text incorrectly references `menvcfg.CBZE`/`senvcfg.CBZE`/`henvcfg.CBZE` — the correct field for clean/flush operations is `CBCFE` (Cache Block Clean and Flush Enable). The table headers within the same files already correctly reference `CBCFE`.
- **cbo.zero** (`description`): Copy-paste error says "Clean operations" instead of "Zero operations".
- **cbo.zero** (`operation()`): The access check logic had multiple bugs:
  - M-mode incorrectly trapped when `menvcfg.CBZE=0` (M-mode always has access per the spec and the `access: m: always` field)
  - S-mode check was missing entirely (S should trap with `IllegalInstruction` when `menvcfg.CBZE=0`)
  - VU-mode used `(henvcfg.CBZE | senvcfg.CBZE) == 0` which only triggers when both fields are zero, but VU should trap when either is zero
  - No `misa.S`/`misa.H` guards to ensure referenced CSRs exist (following the established pattern from WFI and other privileged instructions)

Fixes #1684

## Test plan

- [x] Verified cbo.clean and cbo.flush access_detail text now consistently references CBCFE
- [x] Verified cbo.zero description now says "Zero operations"
- [x] Verified cbo.zero operation() matches the access_detail table for all combinations of menvcfg/senvcfg/henvcfg CBZE bits across all privilege modes (M, S, U, VS, VU)
- [x] All pre-commit checks pass (YAML validation, JSON schema validation, reuse lint)
