The following comments refer to "the way we test" and may not be relevant to the PR itself.
- Added vsetvli_rs1_eq_zero test to verify that vl is set to vlmax when rs1 is x0 for cases of SEW=8,32,64 and LMUL=8.
- Also renamed the old vsetvli test to vsetvli_vl_lt_vlmax to reflect the intent better.
