## Summary

- Adds scripts and data that catalog all 185 UDB architectural parameters with schema analysis, CSR cross-references, heuristic classifications, and candidate spec text locations
- This is the foundation for LLM-based parameter extraction from the RISC-V privileged and unprivileged specifications (see #1747)
- Part of the LFX project to systematically identify and tag architectural parameters in the spec

## What's included

### Scripts (`param_extraction/scripts/`)

| Script | Purpose |
|---|---|
| `export_udb_params.py` | Reads all 185 `spec/std/isa/param/*.yaml` files (excluding 22 MOCK fixtures), analyzes JSON Schema structure, cross-references CSR IDL code for `sw_write()`/`type()`/`reset_value()` references, and classifies each parameter |
| `map_params_to_spec.py` | Searches all 74 spec `.adoc` files (52,602 lines) for text related to each parameter using multi-strategy keyword matching (exact name, CSR backtick refs, description keywords, WARL proximity patterns) |
| `generate_report.py` | Produces the CSV catalog, text report, and flat parameter name list |

### Data outputs (`param_extraction/data/`)

| File | Description |
|---|---|
| `ground_truth.json` | Full structured data for all 185 parameters: name, description, value type, definedBy, CSR cross-references, classification with confidence and reasoning |
| `spec_mappings.json` | Top candidate spec text locations per parameter with relevance scores, line numbers, and context |
| `parameters_catalog.csv` | 19-column spreadsheet-ready catalog |
| `phase1_report.txt` | Human-readable report with statistics and per-parameter breakdown |
| `udb_param_names.txt` | Flat list of 185 parameter names (for inclusion in LLM prompts in later phases) |

## Key results

| Metric | Value |
|---|---|
| Parameters cataloged | 185 (22 MOCK fixtures excluded) |
| Classification: NORM_DIRECT | 102 (55%) — directly configurable, not CSR-controlled |
| Classification: NORM_CSR_RW | 55 (30%) — controls RO/RW behavior of CSR fields |
| Classification: NORM_CSR_WARL | 26 (14%) — legal values of WARL CSR fields |
| Classification: SW_RULE | 2 (1%) — software-deterministic with correct fencing |
| High-confidence classifications | 150 (81%) |
| Value type: binary | 111 (60%), enum: 36 (19%), range: 12 (6%) |
| Parameters with CSR cross-references | 94 (51%) |
| Parameters mapped to spec text | 183/185 (98%) |
| Strong spec matches (score >= 5) | 161 (87%) |

## How to run

```bash
# Requires PyYAML (pip install pyyaml)
# Requires ext/riscv-isa-manual submodule to be initialized

python3 param_extraction/scripts/export_udb_params.py
python3 param_extraction/scripts/map_params_to_spec.py
python3 param_extraction/scripts/generate_report.py
```

## Test plan

- [x] All 185 non-MOCK parameters exported with complete metadata
- [x] Value types verified against actual YAML schemas (100% match)
- [x] CSR cross-references verified against actual CSR YAML files
- [x] 98% of parameters have at least one spec text candidate match
- [x] 81% high-confidence classifications (target was >= 75%)
- [x] CSV catalog and JSON outputs are consistent (all 185 rows match)
- [x] No duplicate parameter names
- [x] All source YAML files exist on disk
- [x] Scripts run cleanly end-to-end with no errors

Closes #1747
