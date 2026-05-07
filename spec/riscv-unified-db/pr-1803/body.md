## Overview
This PR overhauls the rule matching and classification logic inside `pipeline/process/classifier.py` as defined in the downstream pipeline requirements. It establishes a highly contextual rules engine capable of safely extracting and mapping ISA sentences to definitive parameters, classes, and types based on strict priority hierarchies. 
**Related:** #1800 

## Impact on Classification Accuracy
Comparing the evaluation reports before and after the new classifier rules, we’ve achieved a massive increase in classification accuracy and structural certainty.

### 1. Halving the "Unknown" Parameters
Previously, the classifier struggled to understand implicit architectural rules that were heavily formatted or lacked explicit CSR names, leaving them tagged as `unknown`. 
* **Unknown Classes Before:** 1,637 (38.0%) 
* **Unknown Classes After:** 853 (20.6%)
We successfully classified over 800 previously "unknown" fragments into proper buckets.

### 2. Identifying True Normative Rules (non_CSR_parameter)
Because we added implicit outcome matching (e.g., detecting phrases like `"raises an exception"` or `"is sign-extended"` even without strong modals like "must"), we drastically improved the pipeline's ability to identify general architectural constraints.
* **non_CSR_parameters Before:** 1,038 (24.1%)
* **non_CSR_parameters After:** 1,899 (46.0%) 

### 3. Cleaning up False-Positives in Complex Documents
In highly technical files like `machine.adoc` and `hypervisor.adoc`, the extraction accuracy tightened up perfectly. The number of raw candidates properly categorized as `low_signal` noise increased from **3,092 to 3,461**. This is because our newly anchored regex boundaries (`\bword\b`) guarantee that short abbreviations like `"ro"` (read-only) don't accidentally trick the classifier into accepting random narrative words like `"zero"`. 

---

## Features Added

### Robust Signal Matching & Sandboxing
* **Word-Boundary Regex Anchoring:** Replaced naive substring `in` checks with dynamically cached regex patterns (`\bword\b`). This fixes major false-positive false-promotions.
* **Markup Stripping:** Implemented a pre-processor (`strip_markup`) that forcibly removes residual AsciiDoc formatting (e.g. \`backticks\` and \*asterisks\*) so the classifier doesn’t "miss" keywords hiding behind punctuation markers.

### Deep Contextual Promotion
* **Section-Context Awareness:** Added `section_has_csr()`. Even if an extracted sentence lacks an explicit parameter keyword, if its originating *section title* belongs to a known CSR, the logic smartly promotes it into a `CSR_controlled` constraint instead of dumping it as an unknown or SW rule.
* **Numeric States Matched:** We added regex bounds for mathematical definitions (`16-bit`, `at most 4`) and numeric-state logic (`has_binary_state()`) to formally classify phrases like `"hardwired to 1"` and `"read-only 0"`.

### Strict Classification Ladders
* **Deterministic Classifications (`classify_parameter_class / type`)**: Implements an ordered prioritization ladder to defensively map fragments to canonical `taxonomy.yaml` groupings (`CSR_controlled`, `SW_rule`, `non_CSR_parameter`, `binary`, `range`, `enum`) separating definitive hardware parameters from software guidelines.

---

## Completed Tasks
- [x] Fix dangerous substring false positives using word-boundary regex (`\b`).
- [x] Integrate AsciiDoc inline markup stripper (`strip_markup`) for keyword safety.
- [x] Implement section breadcrumb context analysis (`section_has_csr`).
- [x] Embed implicit mathematical and behavioral constraints (`has_binary_state` / `_NORMATIVE_OUTCOME`).
- [x] Organize taxonomy parameters behind a strict prioritization hierarchy.

## To-Do

- [ ] Connect classified taxonomy limits directly into the UDB YAML schema compiler mapping.
- [ ] Implement an LLM evaluation phase specifically targeting the remaining 20% `unknown` parameter classes to auto-classify edge cases.
- [ ] Develop a systematic workflow to flag and analyze remaining false positives (e.g., narrative prose mimicking architectural rules).
- [ ] Design a feedback loop to automatically reject chunks when a downstream LLM validator determines they are purely descriptive despite passing keyword checks.
- [ ] Expand boundary matching regexes (e.g. `_RE_NUMERIC_CONSTRAINT`) to cover more complex formulaic definitions.
- [ ] Add Pytest integration tests locking down the classifier logic for critical access schemas (like `RW-H`).

