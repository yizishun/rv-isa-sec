  This PR clarifies element-status and tail-policy semantics for the Integrated Matrix Extension, bringing them into alignment with the base RISC-V V specification.                                       
                                                                                                                                                                                                         
  ### Define C tile tail policy                                                                                                                                                                            
                                                                                                                                                                                                         
  When VL selects fewer than the maximum number of columns (N_tile < N_tile_max), the inactive columns of the C accumulator tile are tail elements. Unlike ordinary vector instructions — where
  tail-undisturbed requires a read-merge — IME multiply-accumulate instructions achieve undisturbed behaviour by write-skip: tail element positions are simply never written, so no read of the tail
  portion of the C register group is required in either the `vta`=0 or `vta`=1 case. This removes a significant burden from outer-product engines and register-renaming implementations. The tile geometry
  table gains an explicit `N_tile_max = M_tile` definition to anchor the tail boundary.

  ### Align tile load/store masking and tail policy with base V

  The tile load/store instruction descriptions (`vmtl.v`, `vmts.v`, `vmttl.v`, `vmtts.v`) previously described only the `vm`=0 "not written" case and used imprecise terminology. This commit rewrites the
  relevant prose and pseudocode to match the four-category element-status model from the base V spec: active elements access memory normally; inactive elements (body, mask disabled) follow the `vma`
  policy; tail elements (index ≥ VL) follow the `vta` policy; prestart elements are untouched. The `init_masked_source` call — which had no equivalent in regular vector stores and could spuriously raise
  an illegal-instruction exception — is removed from the store pseudocode, replaced with the same `read_vmask` + direct mask-bit check used by the loads.

