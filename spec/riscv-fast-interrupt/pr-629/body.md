This PR proposes a memory-mapped ACLIC interface based on a subset of the AIA Advanced Platform-Level Interrupt Controller (APLIC).

Advantages of the proposed interface
- APLIC compatibility
  - the interface maximize compatibility with APLIC
  - ACLIC can be part of full-sized APLIC in the system
  - ACLIC can be trivially replaced by a full-sized APLIC if needed
- ACLIC interface in MMIO is cost-efficient
  - the CSR/iCSR implementations are more costly as they must provide atomic operations, which are not required for ACLIC interface
  - AIA requests simple MMIO implementation: only 32-bit accesses, no unaligned accesses
  - we don't need to implement iCSR extension, unless required by other extensions
  - system have to implement other MMIO devices anyway (e.g., `mtime`, `mtimecmp` registers for timer)
- Incoming MSI port
  - the setipnum register can be used as an incoming port for MSIs, similar to APLIC
- Software convenience
  - the interface is optimized for access by interrupt identity number (IID), reducing field position calculations
  - register access is performed with a single instruction, unlike iCSRs which require two accesses (xiselect + xireg) and require locking in OS environment

Note: if required for specific use cases, the interface can alternatively be implemented via iCSRs through a separate extension.
