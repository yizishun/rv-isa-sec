## Summary

- Add custom Xaifoundry extension definitions for ET-SoC-1 ET-Minion cores (AMO, cache, mask, PI, PS, tensor, FLB, IPI, FCC)
- Add memory-mapped register (MMR) support to UDB tooling, including schema, loading, and AsciiDoc rendering
- Add MCP server integration with CPU-specific configuration support
- Extract shared `HasFields` module from CSR and MMR to eliminate ~112 lines of duplication across field access, wavedrom rendering, and config filtering
- Fix `CsrField.dynamic_location?` to handle MMR parents via `respond_to?` guard

## Test plan

- [x] UDB unit tests pass (19 runs, 0 failures, 0 errors)
- [x] Sorbet type check error count unchanged (11 pre-existing errors)
- [ ] Full smoke test suite (blocked by pre-existing Sorbet errors, not introduced by this PR)
