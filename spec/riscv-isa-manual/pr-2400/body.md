The ADUE bits in the menvcfg and henvcfg CSRs likely won't change once translation is set up and enabled.  So, we shouldn't need to add hardware to synchronize (invalidate) TLBs when changing them, but can instead require software to do the synchronization and invalidation.  The PBMTE bits are a similar and already specified example.

For comparison, other architectures also require software TLB invalidation when changing these bits.  In their parlance, these are "permitted to be cached in a TLB".
