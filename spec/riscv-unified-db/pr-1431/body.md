## Summary

Add the RISC-V Semihosting specification as the first standard non-ISA specification in `spec/std/non_isa/`.

## Changes

- Created `spec/std/non_isa/Semihosting.yaml` following the `non_isa_schema.json` format
- Uses structured prose with tagged statements (id, normative, text) as per the schema requirements

## Specification Details

The RISC-V Semihosting specification defines a binary interface that allows applications running in debug/simulation environments to access host system resources through a special instruction sequence:

```
slli x0, x0, 0x1f   # Entry NOP
ebreak              # Break to debugger  
srai x0, x0, 7      # Exit NOP
```

The specification includes:
- **Description**: Overview of semihosting concept and its design rationale
- **Breakpoint Instruction Sequence** (normative): Requirements for the 3-instruction sequence
- **Semihosting Parameters** (normative): Parameter passing via a0/a1 registers
- **Semihosting Services** (informative): Overview of available operations
- **References**: Links to official RISC-V and ARM semihosting specifications

## Notes

This is the first non-ISA specification being added to `spec/std/non_isa/`. Happy to iterate on the format based on feedback.

Closes #1393
