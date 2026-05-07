The PR only moves instruction fetch permission to baseline specification based on the discussions of IOPMP TG mailing list (https://lists.riscv.org/g/tech-iopmp/topic/v0_8_1_has_been_released/116403670).

So the PR also adds `SRCMD_X` and `SRCMD_XH` registers in SPS extension for instruction fetch permission checking.

Other updates for the discussions will be created in other PRs.

Some inconsistencies are also applied to the PR.

