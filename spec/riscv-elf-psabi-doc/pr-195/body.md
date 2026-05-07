## Motivation
Tag_RISCV_reserved_register used for record reserved register information,
desiged for resolve checking compatibility between ABI subvariants like
overlay ABI.

## Meaning
This attribute is a bit-vector of reserved register, but it can also
representation as a register list, syntax below:

```
RESERVED_REGS := '{' REG_LIST '}'

REG_LIST      := REG_LIST ',' REG_LIST
               | REG_RANGE
               | REG

REG_RANGE     := REG '-' REG

REG           := <register-name> | <abi-register-name> # e.g. x10, t3, f10 or fa2
```

For example: `x6`, `x7`, `x8` and `f10` are reserved, then the value of
Tag_RISCV_reserved_register is `0x400000001c1`, and it also could be represent
as `{x6, x7, x8, f10}` or `{x6-x8, f10}`.

## Merge Rule
It will report errors if link object files with different
Tag_RISCV_reserved_register values, but allowed link with object with and
without Tag_RISCV_reserved_register value, the final value will take from the
object which has set Tag_RISCV_reserved_register.
