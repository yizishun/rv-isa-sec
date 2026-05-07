Update the `operation()` methods for all Zaamo and Zabha instructions to check when the A extension is disabled at runtime.

- Add a `reserved_instruction` function in `globals.isa` that either traps with `IllegalInstruction` or enters an unpredictable state, depending on the `TRAP_ON_UNIMPLEMENTED_INSTRUCTION` parameter.
- Update Zaamo and Zabha layout templates to call `reserved_instruction()` when A extension is disabled at runtime.
- Regenerate all affected instruction YAML files (72 Zaamo + 72 Zabha)
