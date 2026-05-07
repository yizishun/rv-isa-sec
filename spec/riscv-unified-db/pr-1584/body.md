Introduce memory-mapped registers (MMRs), accessed via physical addresses
rather than the CSR address space. MMRs reuse CSR field definitions but
have a physical_address instead of a 12-bit CSR address, and no privilege
mode or IDL integration.

Extract shared field management into a HasFields module included by both
Csr and Mmr, eliminating code duplication for field access, wavedrom
rendering, and config filtering.

