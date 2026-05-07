## Summary

Add the Sstvecv (Vectored exception handling) extension definition.

## What is Sstvecv?

Sstvecv indicates that the `stvec.MODE` field is capable of holding the value 1 (Vectored), enabling vectored interrupt handling.

When `stvec.MODE` = Vectored:
- Interrupts set `pc` to `stvec.BASE + 4 * cause`
- Each interrupt source has its own dedicated entry point
- Synchronous exceptions still use the base address regardless of mode

## Relationship to Sstvecd

This extension is the companion to the existing Sstvecd extension:
- **Sstvecd**: Indicates support for Direct mode (`MODE=0`)
- **Sstvecv**: Indicates support for Vectored mode (`MODE=1`)

## Requirements

The extension requires the `STVEC_MODE_VECTORED` parameter to be `true`.

## Reference

Based on the same ratification as Sstvecd from the RISC-V Profiles specification (ratified March 2023).

## Test plan

- [x] YAML schema validation passes
- [x] Pre-commit hooks pass

Closes #1201
