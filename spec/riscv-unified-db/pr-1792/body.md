## Summary

- Add `analyze.py` — comprehensive analysis pipeline for evaluating LLM extraction results against UDB ground truth
- Implements deduplication (handling cross-chunk duplicates with confidence-based selection), multi-strategy alignment (exact match, one-to-many mappings, concept groups, fuzzy name matching), and detailed metrics computation
- Generates discrepancy reports categorizing differences as naming mismatches, class disagreements, recall misses, new discoveries, and hallucination suspects

### V1 Evaluation Results
| Metric | Value |
|--------|-------|
| UDB parameters | 185 |
| LLM params (deduped) | 202 |
| Adjusted recall | 58.8% |
| Classification accuracy | 77.8% |
| New params discovered | 115 |

### Key analysis capabilities
- **Deduplication**: Cross-chunk parameter deduplication preferring in-content-region matches over overlap-region duplicates
- **One-to-many mappings**: Handles cases where UDB has fine-grained per-extension parameters (e.g., `MUTABLE_MISA_A/B/C/...`) while LLM identifies a single conceptual parameter
- **Concept groups**: Groups related UDB parameters (e.g., `REPORT_VA_IN_*TVAL_ON_*`) under shared concepts for recall calculation
- **Per-class recall**: Breakdown of recall by parameter classification (NORM_DIRECT, NORM_CSR_WARL, etc.)
- **Confusion matrix**: Classification accuracy analysis across all parameter classes

## Test plan
- [x] Deduplication correctly resolves cross-chunk duplicates
- [x] Alignment matches UDB parameters via exact, fuzzy, and concept-group strategies
- [x] Metrics computation produces valid recall and accuracy figures
- [x] Discrepancy CSV categorizes all differences correctly
- [x] Pre-commit hooks pass (ruff, SPDX headers)
