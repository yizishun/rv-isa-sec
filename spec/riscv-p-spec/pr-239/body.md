Work done following a discussion on a previous PR: https://github.com/riscv/riscv-p-spec/pull/237#discussion_r2972370616.

When x0 is used to index a pair of registers, the specification specifies that both the low and the high XLEN-bit should be interpreted as zero-values.

This patch is an attempts at cleaning this in the P extension specification. It introduces a very verbose prolog for a lot of instructions, there should be a cleaner / less verbose way.

cc @topperc 


One way to summarize the behavior would be

```
s1_lo = X[rs1_p * 2]
s1_hi = X[rs1_p * 2 + (rs1_p == 0 ? 0 : 1)]
```
(which would rely on X[0] "read" to materialize a zero-value register pair rather than explicitly having `s1_lo = 0` and `s1_hi = 0`).
