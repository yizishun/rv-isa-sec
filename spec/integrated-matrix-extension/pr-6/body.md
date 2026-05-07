Disallow fractional LMUL (LMUL < 1) for all Integrated Matrix instructions.  Only LMUL ∈ {1, 2, 4, 8} is supported; fractional settings are reserved and shall raise an illegal-instruction exception.

Remove mf2/mf4/mf8 from the tile load/store intrinsic prototypes to reflect this restriction.
