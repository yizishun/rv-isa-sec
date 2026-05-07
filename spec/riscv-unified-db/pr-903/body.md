Fixes #325

This PR removes extension version numbers from certificate model YAML files since they specify the version of the related standards.

## Changes Made

- Removed `version` fields from extensions in `MC100-32.yaml` and `MockProcessor.yaml`
- Extension versions are now implied by the spec versions (`unpriv_isa_manual_revision`, `priv_isa_manual_revision`)
- The system automatically uses minimum extension versions when no version is specified
- This aligns with the goal that certificate model version numbers should determine spec versions

## Background

As mentioned in issue #325, the plan is to change the major version number when newer spec versions are required. So, MC100v1 would use these old 2019 specs and then v2 would use the next ratified versions of the specs and so on.

## Testing

- Verified that YAML files are still valid
- The Ruby code gracefully handles missing version information by falling back to minimum extension versions
- No breaking changes to existing functionality

## Files Changed

- `spec/std/isa/proc_cert_model/MC100-32.yaml`
- `spec/std/isa/proc_cert_model/MockProcessor.yaml`

---
Pull Request opened by [Augment Code](https://www.augmentcode.com/) with guidance from the PR author
