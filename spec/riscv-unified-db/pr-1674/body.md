When extracting a contiguous string of bits from a `_Bits` object of N bits, we need to ensure 4 conditions for the (presumably unsigned) start and end bit positions (also presuming bit indexes are numbered in decreasing order (N-1)..0):
1. start >= end    # negative range
2. end < N         # end out of range
3. start < N       # start out of range
4. start - end < N # range is too large

The asserts in _Bits::extract are currently:
- start >= end
- end <= N

Of note:
- The second is an incorrect version of (2): off by 1.
- (3) is missing.
- (4) can be derived from (1) and (3), so does not need to be explicitly expressed.

Fix the incorrect condition (2) and add the missing one (3).
