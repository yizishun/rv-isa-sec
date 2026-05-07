when hen any hart in a halt group halts, dcsr.cause for Other harts in the halt group should be set to only 6. If dcsr.cause set to 3, can not reflect that the harts is in debug state passively and make a confuse when SMP group is in an inconsistent state. 
relate PR: https://github.com/riscv-collab/riscv-openocd/pull/1171
