The privileged spec defines the hgatp mode Sv32x4 as 1. The MODE field of hgatp is 1 bit wide when HSXLEN=32 but 4 bits wide when HSXLEN=64.

In IOMMU, however, the MODE field of iohgatp is always 4 bits wide. As such, the value of Sv32x4 is defined as 8, which is what is obtained when zero-extending the value 1 three bits to the right. The interpretation of the MODE field is determined by fctl.GXL. When GXL is 0, a MODE of 8 indicates Sv39x4; when GXL is 1, it indicates Sv32x4.

Relevant comment:
https://github.com/riscv-non-isa/riscv-iommu/issues/77#issuecomment-1275084928
