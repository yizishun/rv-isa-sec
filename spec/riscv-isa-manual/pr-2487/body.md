In the Sail pseudocode for vaeskf2.vi, the definition of RoundKeyB appears to have an incorrect bit-width specification.
The code currently uses:
`let RoundKeyB[3:0] : bits(32) = get_velem(vd, EGW=128, i); // Previous round key`
However, get_velem(vd, EGW=128, i) returns a 128-bit element group. It should instead be:
`let RoundKeyB[3:0] : bits(128) = get_velem(vd, EGW=128, i); `

Suggestion to address [riscv/riscv-crypto#403](https://github.com/riscv/riscv-crypto/issues/403#issuecomment-3637250308)
