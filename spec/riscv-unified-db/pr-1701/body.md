**Description:**

This PR implements the VNSRA (Vector Narrow Shift Right Arithmetic) instruction. The implementation is complete with:

-  Vector masking logic.
- Tail-agnostic handling scheme.
- Implemented vector register grouping logic supporting all LMUL values as per the RISC-V V-extension specification (1, 2, 4, 8, 1/2, 1/4, 1/8).
