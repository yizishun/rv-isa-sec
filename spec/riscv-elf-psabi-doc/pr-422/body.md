Add extra name mangling rule for standard vector calling convention on C++ ABI, fortunately the Itanium C++ ABI already defined mangling rule for ABI tag, so we just need to define the ABI tag name.

Example for the mangling rule:
```c
__attribute__((riscv_vector_cc)) void foo();
// _Z3fooB15riscv_vector_ccv with this mangling rule
// _Z3foov without this mangling rule
```
