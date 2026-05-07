Relocation Type Includes: R_RISCV_REGREL_ADD/R_RISCV_REGREL_LO12_I/R_RISCV_REGREL_LO12_S

The RISC-V architecture addresses non-constant subscript elements using lui + addi + add + ld/st. The low-address calculation process of addi instruction is offloaded th the ld/st, thereby eliminating low-address calculation and reducing addressing instructions.

The scenario is as follows: same as sh1add/sh2add/sh3add
```
lui     vr1, %hi(sym)
addi    vr1, vr1, %lo(sym)
add     vr2, vrx, vr1
lbu     vr3, off(vr2)
```
 After Compiler Transformation
```
lui     vr1, %hi(sym+off)
add     vr2, vrx, vr1, %regrel_add(sym+off)
lbu     vr3, %regrel_lo(sym+off)(vr2)
```
After Linker Relaxation:
```
add vr2, vrx, gp
lbu vr3, <gp-relative-offset>(vr2)
```
Need update the ld/st's offset and add/sh1add/sh2add/sh3add's src2 be replace by gp, so need add new relocation deal with this scenario.
