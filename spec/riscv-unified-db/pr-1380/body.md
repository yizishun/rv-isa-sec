## Summary

Add the Smepmp (PMP Enhancements for memory access and execution prevention on Machine mode) extension definition.

## What is Smepmp?

Smepmp enhances the Physical Memory Protection (PMP) mechanism by adding the `mseccfg` CSR with three key fields:

- **MML (Machine Mode Lockdown)**: Changes PMP rule semantics so that `pmpcfg.L` marks rules as M-mode-only rather than locked, enabling shared regions accessible across multiple privilege levels.

- **MMWP (Machine Mode Whitelist Policy)**: Provides a default-deny policy for M-mode - memory regions without matching PMP rules are denied instead of being accessible.

- **RLB (Rule Locking Bypass)**: Allows modification of locked PMP rules as a debug mechanism or temporary boot-time workaround.

## Why is this needed?

These enhancements enable more secure system configurations by allowing software to restrict M-mode's access to memory, which is essential for implementing:
- Trusted execution environments (TEE)
- Secure boot processes
- Stronger isolation between privilege levels

## Reference

- [Smepmp Specification](https://github.com/riscv/riscv-tee/blob/main/Smepmp/Smepmp.pdf)
- Ratified: December 2021

## Test plan

- [x] YAML schema validation passes
- [x] Pre-commit hooks pass

Closes #219
