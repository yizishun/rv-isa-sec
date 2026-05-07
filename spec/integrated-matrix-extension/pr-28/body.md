Philipp, Erich, and Bing: Please take a look at the changes I am proposing. They are meant to allow (but not mandate) compatibility of floating-point results with Zvt (https://github.com/aswaterman/riscv-misc/blob/main/isa/zvt/zvt.adoc#matrix-arithmetic-instructions).

I am just looking for feedback at this point. I suspect we will need some discussions before we are all OK with any of these changes. When we get there, I can update the SAIL.

I have not found a good way to have G as a WARL field that one can discover. It is not something that can be set in vtype, because it depends on non-vtype parameters, such as W.
