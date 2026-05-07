Matrix multiply-accumulate instructions operate on a 2D tile with a nested (j, i) iteration structure — there is no single linear "element index" that captures progress, the C accumulator spans MUL_C registers, and the natural hardware implementations (systolic arrays and outer-product engines) have no reasonable way to resume mid-computation. Declare the 11 GEMM instructions vstart-constrained: if vstart != 0 when such an instruction begins execution, an illegal-instruction exception is raised.

Changes:

- Append a statement to the "Vector masking is not supported" paragraph in both the Zvvmm and Zvvfmm overview sections, establishing the rule uniformly.

- Add a leading "* `vstart` ≠ 0." bullet to the Exceptions list of each of the 11 matrix multiply-accumulate instructions: vmmacc.vv, vwmmacc.vv, vqwmmacc.vv, v8wmmacc.vv, vfmmacc.vv, vfwmmacc.vv, vfqwmmacc.vv, vf8wmmacc.vv, vfwimmacc.vv, vfqwimmacc.vv, vf8wimmacc.vv.

- Add "if vstart != 0 then return Illegal_Instruction();" as the first line of each instruction's SAIL Operation block, before any geometry decoding or other legality checks, ensuring no side effects occur when the instruction is illegal.

Tile load/store instructions (vmtl.v, vmts.v, vmttl.v, vmtts.v) already honor vstart through their body loops and are unaffected by this change.
