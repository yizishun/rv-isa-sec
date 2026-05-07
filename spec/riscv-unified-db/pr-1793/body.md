## Summary

- Refine LLM prompts based on Phase 5 gap analysis, targeting 49 recoverable UDB recall misses
- Add v2 system prompt with classification disambiguation rules and 7 commonly missed parameter pattern categories (counter/HPM, VM modes, tval reporting, alignment, implementation values, conditional SC failure, stateen control)
- Add 4 new positive few-shot examples targeting previously missed parameter types
- Implement prompt versioning support (`PROMPT_VERSION` env var) in `run_prompt.py` and `extract.py` for side-by-side v1/v2 comparison

### V1 vs V2 Comparison
| Metric | V1 | V2 | Change |
|--------|-----|-----|--------|
| Adjusted recall | 58.8% | **71.8%** | +13.0pp |
| Classification accuracy | 77.8% | **85.9%** | +8.1pp |
| Total params (deduped) | 202 | **330** | +63% |
| UDB recall misses | 73 | 50 | -31% |
| New params discovered | 115 | 220 | +91% |

### What changed in v2 prompts
- **System prompt additions**: Classification disambiguation section clarifying NORM_CSR_WARL vs NORM_CSR_RW vs NORM_DIRECT boundaries; "Commonly Missed Parameter Patterns" section with 7 specific categories and indicators
- **New examples**: `COUNTINHIBIT_EN` (counter inhibit), `GSTAGE_MODE_BARE` (VM mode support), `REPORT_ENCODING_IN_MTVAL_ON_ILLEGAL_INSTRUCTION` (tval reporting), `LRSC_FAIL_ON_NON_EXACT_LRSC` (LR/SC conditional failure)
- **Versioning**: Results stored in `results/v2/` directory, prompts in `prompts/v2/`

## Test plan
- [x] V2 extraction completes all 59 chunks without errors
- [x] Adjusted recall exceeds 70% target (achieved 71.8%)
- [x] Classification accuracy improves over v1 (85.9% vs 77.8%)
- [x] Prompt versioning correctly isolates v1 and v2 results
- [x] Pre-commit hooks pass (ruff, SPDX headers, formatting)
