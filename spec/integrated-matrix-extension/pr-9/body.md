Reserve vm=0 on all six matrix multiply-accumulate instructions (vfmmacc, vfqwmmacc, vfwmmacc, vmmacc, vqwmmacc, vwmmacc):

- Set the vm bit to 1 (hardwired) in the encoding diagrams.
- Add vm=0 as an illegal-instruction condition in the Exceptions sections and SAIL pseudocode.
- Add a forward-looking note that a future extension may redefine vm=0 to source per-element scaling factors from v0 for microscaling floating-point formats.

Tile load/store instructions are unaffected and continue to support vector masking.
