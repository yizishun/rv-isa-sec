Svadu, roughly, preempts Svade:
> If the Svadu extension is implemented, the ADUE bit controls whether hardware updating of PTE A/D bits
> is enabled for S-mode and G-stage address translations. When ADUE=1, hardware updating of PTE A/D
> bits is enabled during S-mode address translation, and the implementation behaves as though the Svade
> extension were not implemented for S-mode address translation. When the hypervisor extension is
> implemented, if ADUE=1, hardware updating of PTE A/D bits is enabled during G-stage address
> translation, and the implementation behaves as though the Svade extension were not implemented for G-
> stage address translation. When ADUE=0, the implementation behaves as though Svade were implemented
> for S-mode and G-stage address translation.

Fixes #1217
