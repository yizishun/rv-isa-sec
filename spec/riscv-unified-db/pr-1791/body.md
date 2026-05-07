## Summary

- Add `extract.py` — automated LLM extraction pipeline for identifying architectural parameters in the RISC-V specification
- Features token-aware rate limiting, exponential backoff for API throttling, source file skipping for non-parameter content (19 files), and pilot/run/merge/status CLI modes
- Includes v1 extraction results from Anthropic Claude across 59 spec chunks (208 unique parameters, ~$3.60 API cost)

### Key capabilities
- **Pilot mode**: Test extraction on `machine.adoc` chunks only (prompt validation)
- **Run mode**: Full extraction across all spec chunks with configurable delay and retry
- **Rate limiter**: Token-bucket algorithm tracking usage over 60s windows with 0.75 safety factor (stays within Anthropic's 30K input tokens/min tier)
- **Skip list**: 19 boilerplate `.adoc` files (bibliography, index, rationale, etc.) automatically excluded

### Results structure
- Per-chunk JSON results in `results/claude-sonnet-4/chunk_NNN.json`
- Merged `all_results_claude-sonnet-4.json` with all extracted parameters
- Each result includes: parameters found, confidence scores, classifications, token usage, and latency

## Test plan
- [x] Pilot run on `machine.adoc` chunks validates prompt quality
- [x] Full extraction completes all 59 chunks without errors
- [x] Rate limiter prevents 429 errors during sustained extraction
- [x] Merge produces valid combined results file
- [x] Status command reports accurate progress
- [x] Pre-commit hooks pass (ruff, SPDX headers)
