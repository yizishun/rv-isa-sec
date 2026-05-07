Specification of a new **vector** ISA extension for constant size (4D) vector dot product of integers (for now limited to 8-bit values).


This PR imports changes made by @kdockser and others in https://github.com/riscv/riscv-dot-product from the standalone repo to **riscv-isa-manual**. It also implements ARC's feedback.

- Tracking ticket: https://riscv.atlassian.net/browse/RVS-1971
- **riscv-opcodes** associated change: https://github.com/riscv/riscv-opcodes/pull/402
- **riscv-isa-sim** (spike) associated change: https://github.com/riscv-software-src/riscv-isa-sim/pull/2212
- **sail-riscv** (formal model) associated change: https://github.com/riscv/sail-riscv/pull/1495
- **rvv-intrinsic-doc** Intrinsics associated change: https://github.com/riscv-non-isa/rvv-intrinsic-doc/pull/418
