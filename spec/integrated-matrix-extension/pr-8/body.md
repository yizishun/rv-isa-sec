Add an "Element packing in input tiles" subsection under "Storage formats" that defines the ordering of narrow elements within each SEW-wide slot for widening multiply-accumulate instructions (W=2, W=4):

- For byte-sized and wider elements (EEW >= 8): standard RISC-V V element ordering applies.
- For sub-byte elements (EEW = 4): little-endian nibble packing with element k at bits [4k+3 : 4k].

Also remove a stale empty "Arithmetic considerations" section header left over from a previous merge.
