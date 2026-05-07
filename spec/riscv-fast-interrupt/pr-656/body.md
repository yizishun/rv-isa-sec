This PR is a "what-if" - what if an ACLIC interrupt priority is encoded in the minor interrupt identity, so that ACLIC can be viewed as an IMSIC in which the high-priority identities can be optionally connected to external interrupt sources. 

This appears to increase AIA alignment and permit scenarios in which a small number of time-critical interrupt sources are closely coupled to a specific core.  
On the face of it this seems to be useful in:
* a multi-core complex where shared peripheral interrupts are handled by an APLIC instance, or 
* a single core with hardware support for PCIe (IMSIC functionality without APLIC). 

The main worry is the "large microcontroller" use case where there may be significant area bloat vs. explicitly configured priorities. 

If we do think this is worth looking into I should be able to look into the area impact. 

Since I made the mistake of not updating my local respository, the baseline of this PR is detached from the main repo - please look at the most recent commit 2ef57ad6ebd52d1d25cc61e1812a4877a78bf662 for changes. 

If this is worth taking further I'll happily re-do based on head of riscv-fast-interrupt. 


