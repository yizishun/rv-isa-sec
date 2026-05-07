This PR introduces initial support for the Smaia (Machine-Level Advanced Interrupt Architecture) extension, addressing [Issue #566](https://github.com/riscv-software-src/riscv-unified-db/issues/566).

New Machine-Level CSRs Added:
- mvien
- mvienh
- mviph
- miph
- mieh
- midelegh
- mtopoi
- mtopei
- mvip

These CSRs represent Phase 1 of the implementation, covering machine-level functionality. Supervisor- and VS-level CSRs will be added in a follow-up phase.
