The Zawrs spec already says that the WRS instructions follow WFI's rules for resumption upon interrupts, but the surrounding language suggests something different (that they need only be pending, not locally enabled).  Resolve this contradiction by changing the language to match that of WFI.

Note that implementations that resolve this contradiction in the opposite direction are technically still correct, since it is valid to break out of the WRS stall for any reason.
