This replaces #863 with the following intent:

- Add sstatus.CRGE that allows to enable/disable the Svucrg extension.
    - This solves the problem of the CD polarity when software is unaware of Svucrg and assumes that PTE.CRW behaves the same. This is no longer true as the PTE.CRW=1 CD=0 CRG=0 will either cause traps on capability writes or the PTE changes to CD=1 "unexpectedly" due to hardware dirty tracking.
    - The alternative is to change the CD bit polarity and leave Svucrg always enabled. This seems less palatable also because of possible interactions between further extensions and reserved PTE.{CRW, CD, CRG} bit patterns. The disable switch may also be used to selectively disable revocation under certain privileged conditions, but this seems like a bad idea.
- Add text to clarify that the PTE.CRW changes semantic when Svucrg is enabled. In particular:
    - CRW=0 no longer implies that the page is in the "no capabiltiy" state, instead we need CRW=0 CD=0 CRG=0.
    - CRW=1 is a sufficient condition for having a page in the "capability state",  because all 4 CRW=1 bit patterns are used in that way, but it is not a necessary condition, because further extensions can define a reserved CRW=0 CD=X CRG=X state to allow load store of capabilities under certain conditions.
    
There are some questions that we may want to ensure are addressed:
   - Do we need to specify the reset value of sstatus.CRGE?
   - Is sstatus the right place ofr CRGE or is it senvcfg?
   - I stated that if CRGE=0 (i.e. Svucrg disabled) the CD, CRG and sstatus.UCRG bits remain reserved and further extensions can reuse them. I'm not sure this is exactly what we want.
   
