Vector+CHERI was being held back because of indexed loads where the base address is zero, and the whole address is in XLEN elements meaning that the capability needs to cover all of memory.
However, because if the base register is x0 the encoding is reserved, then the mode is illegal anyway.
So it's ok to include now, as discussed with @aswaterman 



