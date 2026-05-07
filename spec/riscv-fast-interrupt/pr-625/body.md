Each of the 6 commits in the PR corresponds to one of the issues that I've recently opened to make the ACLIC spec more readable. 

#615 ACLIC is introduced as a 3rd AIA external interrupt controller option, with a hart local interface like an IMSIC but implementing APLIC like source configuration and interrupt prioritization. 

#617 An IMSIC like eidelivery register can be used without changes -  since eidelivery = 1 means delivery from the interrupt files inside a hart-local interrupt controller. Once the ACLIC is presented as an aliternative to IMSIC, rather than a heavily modified APLIC, the lengthly description of mapping between APLIC and IMSIC type registers is no longer required. 

#618 Indirect source and priority configuration is described as a way to merge the wired-interrupt configuration capabilities of APLIC, into a hart-local interrupt controller as an extension to the set of ei-prefixed indirect CSRs in an interrupt file. Register naming and addressing are changed to align with existing ei-regs BUT I have not checked that the suggested part of CSRind space is in fact available. Since ACLIC contains interrupt files rather than APLIC like domains, the more limited sourcecfg use model is explained in detail. 

#618 State enables - attempted to update this to match the renaming in the previous commit; however I'm not familiar with state enables and have probably got it wrong. 

#619 "APLIC configured for ACLIC operation" section is deleted, because it seems to be based on an early iteration of the spec in which ACLIC was more like a specialized APLIC. I found this section especially confusing because it was not clear whether the referenced APLIC was an actual APLIC, or a set of APLIC like registers inside ACLIC that are not described elsewhere. 

#622 Smaiae is removed as an extension in its own right; we found that AIA provides guidance on a minimal implementation of S-mode mvip and mvien that does not have an excessive area penalty. The AIA recommendations are noted in the Smaclic/Ssaclic extension description.    
