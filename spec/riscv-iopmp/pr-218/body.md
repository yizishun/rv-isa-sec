According to the spec, when granularity G>=2 and the mode is NAPOT, entry address bits [G-2:0] are read as all ones. Apply this rule when generating start address and end address during transaction checking.

Fix https://github.com/riscv-non-isa/iopmp-spec/issues/215.
