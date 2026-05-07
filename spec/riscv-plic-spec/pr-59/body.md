The current text says that the PLIC writes to the claim/complete register on completion but that doesn't really make sense. It should be the target that writes to it.
    
There's also a paragraph in the *Interrupt Claim Process* section that is mostly redundant and contains the same PLIC/target mixup, so I removed it.

Fixes #53 
