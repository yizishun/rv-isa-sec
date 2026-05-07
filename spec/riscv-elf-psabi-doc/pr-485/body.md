This proposal serves as an alternative to PR #393, introducing Relax Feature String to specify constraints on linker relaxation for individual instructions.

When both `.option arch, +c` and `.option arch, -c` code regions exist in the same object file, the linker cannot properly handle this mixed situation because `EF_RISCV_RVC` is an object-level flag.

The Zcmt extension attempts to relax `call`/`tail`/`jal` instructions into `cm.jalt`/`cm.jt`. In baremetal toolchain multilib scenarios, using ISA strings leads to only two choices:

1. Add a Zcmt-specific multilib (increases toolchain release size, and the multilib is identical to non-Zcmt version except ISA string)
2. Violate the arch string semantics

When Zicfilp is enabled, LPAD instructions must be 4-byte aligned. Linker relaxation may convert call to `c.jal` or `cm.jalt`, causing LPAD misalignment. The current `.option exact` solution completely disables relaxation, which is overly conservative.

1. **Long strings**: ISA strings like RVA23 profile can be considerable
2. **Poor extensibility**: Cannot express "allow RVC but prohibit Zcmt"
3. **Zcmt semantic issues**: Cannot elegantly handle Zcmt opt-out
4. **Linker performance**: Complex ISA string parsing

Extend `R_RISCV_RELAX` to optionally reference a dummy symbol with prefix `$r` containing comma-separated feature flags.

- **Name**: starts with `$r` prefix (e.g., `$rnorvc`)
- **Binding**: `STB_LOCAL`
- **Type**: `STT_NOTYPE`
- **Size**: 0

Features MUST be sorted in lexicographical order. This simplifies linker parsing overhead.

| Feature | Description |
|---------|-------------|
| `norvc` | Prohibit relaxation into compressed instructions (C/Zc*). Implies `nozcmt` since `cm.jt`/`cm.jalt` are also compressed. | | `nozcmt` | Prohibit relaxation into Zcmt table jump instructions. Useful for performance-critical regions since Zcmt requires table lookup. |

Old linkers ignore the symbol referenced by `R_RISCV_RELAX`, so they use default relaxation behavior.
