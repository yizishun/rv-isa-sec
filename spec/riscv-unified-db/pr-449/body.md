I integrated @BrianAnakPintar with normal UDB directory for this. I also added the generation of riscv-opcodes outputs, such as encodings.out.h that is what @ayosher was looking for if I am not in error. I added a README.md for detailed instructions.

@ayosher Until next meeting I won't have enough bandwidth to test this with SPIKE and Qualcomm new extensions, but to do so, you should just go to the folder `/ext/opcodes_maker` and run `make YAML_DIR=../../cfgs/qc_iu/arch_overlay/inst/` and look for `output/encoding.out.h` as an input for SPIKE.
