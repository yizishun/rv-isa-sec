Fixes #1287

## The Problem

The user-mode HPM counter high-half CSRs (`hpmcounter3h` through `hpmcounter31h`) were incorrectly marked as being defined by the `Sscofpmf` extension. 

Looking at Table 20 in the RISC-V spec (Counter Delegation chapter, section 9.1), these CSRs are associated with footnote 2 which says they "Depend on Zihpm support" - just like their 64-bit counterparts.

## The Distinction

- **Zihpm**: Provides the user-mode HPM counter CSRs (both 64-bit and 32-bit high-half versions)
- **Sscofpmf**: Provides counter overflow and privilege mode filtering features

The base counters were already correctly using `Zihpm`, but the high-half (`*h`) versions were mistakenly using `Sscofpmf`.

## The Fix

Updated the `hpmcounterNh.layout` template file and regenerated all 29 affected YAML files. The change is straightforward - just swapping `Sscofpmf` for `Zihpm` in the `definedBy` field while keeping the `xlen: 32` requirement.

## Testing

- Pre-commit hooks pass (including YAML validation)
- Type checking passes (`./do test:sorbet`)
