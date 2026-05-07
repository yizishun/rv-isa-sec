Explicitly note that the vendor relocation scheme is only aimed at static relocations at the moment.

This resolves details such as `STB_LOCAL` symbols not usually appearing in dynamic symbol tables and `R_RISCV_VENDOR` being defined as a static relocation.

In future, we could extend this scheme to Dynamic Relocations, but that requires further consideration.

Co-authored-by: Jessica Clarke <jrtc27@jrtc27.com>
