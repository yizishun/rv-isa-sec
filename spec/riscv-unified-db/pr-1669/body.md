## Summary

- Add the missing `operation()` IDL implementations for both Zawrs wait-on-reservation-set instructions
- Add `wrs_nto` and `wrs_sto` builtin functions in `builtin_functions.idl`, following the same pattern as the existing `wfi` builtin

### `wrs.nto` (Wait-on-Reservation-Set with No Timeout)
- Implements TW/VTW trap checks similar to WFI, with the key spec difference: **does NOT trap in U-mode when TW=0** (unlike WFI which always traps in U-mode)
- When `mstatus.TW=1`, any mode other than M traps with `IllegalInstruction`
- When H extension is present, `mstatus.TW=0`, and `hstatus.VTW=1`, VS/VU mode traps with `VirtualInstruction`
- Delegates actual stall behavior to `wrs_nto()` builtin

### `wrs.sto` (Wait-on-Reservation-Set with Short Timeout)
- No TW/VTW checks needed — the built-in implementation-defined short timeout guarantees forward progress
- Delegates stall behavior to `wrs_sto()` builtin

## References

- [Zawrs Spec v1.01](https://docs.riscv.org/reference/isa/unpriv/zawrs.html)

## Test plan

- [x] All YAML files pass JSON schema validation (pre-commit `check-jsonschema`)
- [x] IDL compiles successfully (`./do chore:update_golden_appendix` completes without error)
- [x] All pre-commit checks pass
