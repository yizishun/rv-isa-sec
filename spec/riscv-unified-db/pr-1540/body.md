### Motivation
The detailed description of privilege mode access controls (via `mcounteren`, `scounteren`, etc.) was originally placed in the Unprivileged HPM counter definitions (`hpmcounterN`). Since these controls are fundamentally about access *to* the counter (which is an alias of the M-mode counter) and involve M-mode CSRs (`mcounteren`), this information is better placed in the Machine-mode HPM counter definitions (`mhpmcounterN`) to avoid describing higher-privilege behavior in unprivileged CSRs.

### Changes
*   Moved the detailed access control tables and descriptions from:
    *   `spec/std/isa/csr/Zihpm/hpmcounterN.layout`
    *   `spec/std/isa/csr/Zihpm/hpmcounterNh.layout`
*   To:
    *   `spec/std/isa/csr/Zihpm/mhpmcounterN.layout`
    *   `spec/std/isa/csr/Zihpm/mhpmcounterNh.layout`
*   Updated unprivileged HPM counter descriptions to reference their M-mode counterparts for access control details.

### Related Issues
Closes #1533
