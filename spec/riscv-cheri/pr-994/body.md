Simplify RV64Y by putting YTOPR into the base.

Also put YSENTRY and YBLD into the base.
Put some more generic sealing/unsealing/ambient statements into ifdef's so they can be enabled when we include CHERIoT architectures - but the basic text is much easier to read

The objective is to radically simplify the RV64Y text to get it through ARC review.

