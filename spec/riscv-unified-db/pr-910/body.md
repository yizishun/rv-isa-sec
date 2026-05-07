## Summary

This PR implements support for the RISC-V Advanced Interrupt Architecture (AIA) extensions Smaia and Ssaia as requested in issue #216.

## Changes Made

### New CSR Definitions

**Smaia (Machine-level AIA):**
- `mvien` (0x308) - Machine Virtual Interrupt Enable
- `mvip` (0x309) - Machine Virtual Interrupt Pending
- `mtopei` (0x35C) - Machine Top External Interrupt

**Ssaia (Supervisor-level AIA):**
- `sieh` (0x114) - Supervisor Interrupt Enable High
- `siph` (0x154) - Supervisor Interrupt Pending High
- `stopei` (0x15C) - Supervisor Top External Interrupt
- `stopi` (0x15B) - Supervisor Top Interrupt

### IDL Hart-side Logic

- Extended `interrupts.idl` with IMSIC (Incoming Message-Signaled Interrupt Controller) support
- Added interrupt file management for machine, supervisor, and virtual supervisor levels
- Implemented TOPEI register update logic
- Added functions for setting/clearing IMSIC interrupts
- Integrated AIA virtual interrupts into the main interrupt handling flow

### Key Features

- **IMSIC Support**: Full interrupt file management with 2048 entries per privilege level
- **Priority-based Interrupt Handling**: Automatic TOPEI register updates with highest priority pending interrupts
- **Virtual Interrupt Support**: Integration with existing interrupt enable/pending mechanisms
- **CSR Access Functions**: Proper sw_read/sw_write implementations for TOPEI registers with claim-and-clear semantics

## Testing

The implementation follows the existing UDB patterns and schemas. All new CSR files conform to the `csr_schema.json` specification.

## Related Issues

Fixes #216
Contributes to #508 (Add YAML files for all missing extensions)
 
--- 
