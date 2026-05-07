## Summary                                                                                                                                                                                                    
                                                                                                                                                                                                                
  - **Decouple `v0.scale` from the E8M0 scale format.** The `v0.scale`                                                                                                                                          
    mechanism now specifies only that paired block-scale factors are
    present in `v0`; the scale format is an inherent property of the                                                                                                                                            
    input data type (e.g., MXFP8 = OFP8 + E8M0 scales), not of the                                                                                                                                              
    encoding. A new "Scale formats" subsection defines E8M0 explicitly
    and leaves room for future formats. All generic microscaling prose,                                                                                                                                         
    the `v0` layout description, and per-instruction descriptions are
    now format-agnostic.                                                                                                                                                                                        
                  
  - **Refactor SAIL into four top-level dispatch functions.** The main
    loop bodies from all 11 GEMM instruction SAIL blocks are extracted
    into `int_gemm`, `fp_gemm`, `fp_scaled_gemm`, and                                                                                                                                                           
    `int_scaled_gemm`. Each instruction's Operation block is now a thin
    wrapper: legality checks → `decode_gemm_geometry` → format setup →                                                                                                                                          
    single dispatch call. For FP widening instructions, the dispatch is                                                                                                                                         
    conditional on `vm`, directly mirroring the hardware decode.
                                                                                                                                                                                                                
  - **Generalize scale width for future formats.** Introduce
    `scale_width_of(scale_fmt)` to derive the per-scale bit width and
    pair width from the scale format, replacing hardcoded 16-bit                                                                                                                                                
    assumptions in the stride computation (`R = λ × SEW / pw`), the
    `v0` capacity proof, and the legality constraint                                                                                                                                                            
    (`SEW × λ ≥ pw`). The SAIL helper `read_block_scales` reads                                                                                                                                                 
    `pw`-bit elements and extracts `sw`-bit halves generically. All
    call sites pass `E8M0` explicitly; existing behavior is unchanged.                      
