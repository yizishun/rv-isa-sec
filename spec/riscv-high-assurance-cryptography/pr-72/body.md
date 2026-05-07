We want a higher granularity tracking of CR state, but we can keep the existing status.ACES design, just make it work per-CR.  To align with the s/vs status.ACES design, there are two CSRs, s/vs acecrstatus.

We can add m acecrstatus if we want to optimize supervisor domain context switches as well, but I don't think it makes sense to remove vs, because there isn't much diffrence between U-mode and VS-mode context switches in frequency nor implementation.

I have omitted the hardware change to Initial, since it's currently missing from status.ACES as well.
Currently, hardware only changes to Dirty, so software can decide what both Initial and Clean denote.

Due to presence of ace.reset and ace.clean, I think it makes sense to specify Initial to be the state that ace.reset and ace.clean provide.
