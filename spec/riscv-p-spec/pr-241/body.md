Many of the GPR pair instructions had their pseudocode written as to separate blocks of code for the even register and the odd register.

Rewrite them to concatenate their sources, loop over the elements in both registers, and then write out their results to two registers. Add the rs1_p/rs2_p checks for the source data and a rd_p check for the writes.

This is an alternative to #239.

Rewrite was done with AI. I did a review myself and fixed some issues, but I might have missed some.
