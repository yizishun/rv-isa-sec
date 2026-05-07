This PR builds on https://github.com/riscv/riscv-isa-manual/pull/2618

RVBNA was initially descrbed with the same format for both left hand side and right hand side products. This is not a requirement and RISC-V specifications (e.g. VME) actually require the support of non-uniform formats.

This patch generalizes the definition to different formats for left hand side and right hand side.
The RVBNA pseudo-code has also been generalized to this case, and the value of the exponent biasing for the result was clarified.
