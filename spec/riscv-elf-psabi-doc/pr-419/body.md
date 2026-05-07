`_BitInt (N)` is the type defined in C23, allow user to define an arbitrary-sized integer type, where N is a postive integer larger than zero.

This proposal defined the size and alignment of _BitInt, and define the unused bits as unspecified which is same as x86-64 and AArch64.

For the calling convention part, we keep unused bits as unspecified.

Ref:

- ISO/IEC WG14 N2763: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2763.pdf

- [AArch64] Rationale Document for ABI related to the C23 _BitInt type. https://github.com/ARM-software/abi-aa/tree/main/design-documents/bit-precise-types.rst

- AAPCS64 for _BitInt(N) https://github.com/ARM-software/abi-aa/commit/d6214175f73b02d546dcd29cbade6dd2d7c5a42c

- x86-64 ABI for _BitInt(N) https://gitlab.com/x86-psABIs/x86-64-ABI/-/commit/8ca45392570e96920f8a15d903d6122f6d263cd0

Fix #300
