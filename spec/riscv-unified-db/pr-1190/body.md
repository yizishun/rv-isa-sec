Fixed mismatch between definitions in vec.idl and usages in vset*.yaml of SEW and AVL fields. 

Please see [commit message](https://github.com/riscv-software-src/riscv-unified-db/commit/e9698e2b99f2fb0681cb929b57e52c20e669de3e) for more details. 

Testing steps: 

1. Build the ISS with `./do build:cpp_hart CONFIG=rv32`
2. Added `rv32uv` and `rv64uv` folders to `ext/riscv-tests/isa` after updating the submodule. 
3. Replaced `x3` with other registers in `rv64uv/vset*.S` since it's used as `TESTNUM` register by the `riscv-tests` framework.
4. Run  `./do build_riscv_tests` to compile all tests.
5. Run a single test with ~/bin/run-rvtest shell script:
```bash 
run-rvtest rv32 RelWithDebInfo rv32-vector rv32uv-p vsetvl | sed -n '/mret/,$p'     # Skip over initialization
```

> Note: The changes to `ext/riscv-tests` from Step 2 above are not committed.
