## Summary

Split the 52,602-line RISC-V specification into 78 semantically coherent chunks that preserve CSR section integrity for LLM-based parameter extraction. Builds on Phase 1 (#1765) and Phase 2 (#1766).

- **`chunker.py`**: AsciiDoc-aware chunking script with `run`, `info`, and `verify` CLI commands
- **`chunks/`**: 78 numbered chunk files with metadata headers + `manifest.json`

## Chunking Rules

1. **CSR section atomicity**: Never splits within a `====` section — each CSR description (heading, bytefield, behavioral paragraphs) stays together
2. **Section boundaries**: Splits at `===` or `====` AsciiDoc heading boundaries
3. **Target size**: 2,500–3,500 lines (~35K–45K tokens), leaving room for prompt layers within 128K context
4. **Overlap**: 30 lines of overlap context at chunk boundaries
5. **Small files**: Files under 2,000 lines are processed as single chunks

## Results

| Metric | Value |
|---|---|
| Total chunks | 78 |
| Total files | 74 |
| Multi-chunk files | 4 (machine.adoc, scalar-crypto.adoc, v-st-ext.adoc, vector-crypto.adoc) |
| CSR section splits | 0 |
| Line coverage | 100% on all multi-chunk files |
| Chunk size range | 2–3,448 lines |

### Multi-Chunk File Details

| File | Chunks | Sizes |
|---|---|---|
| machine.adoc (3,629 lines) | 2 | 3,334 + 325 |
| scalar-crypto.adoc (5,590 lines) | 2 | 3,448 + 2,172 |
| v-st-ext.adoc (5,396 lines) | 2 | 3,393 + 2,011 |
| vector-crypto.adoc (4,966 lines) | 2 | 3,340 + 1,656 |

## How to Run

```bash
# Chunk all spec files
python3 param_extraction/scripts/chunker.py run

# Show chunking for a specific file
python3 param_extraction/scripts/chunker.py info ext/riscv-isa-manual/src/machine.adoc

# Verify chunking output
python3 param_extraction/scripts/chunker.py verify
```

## Test Plan

- [x] `chunker.py verify` passes: 74/74 files, 0 CSR splits, 0 gaps
- [x] All 78 chunk files exist with correct metadata headers
- [x] manifest.json is consistent with chunk files
- [x] 100% line coverage on all 4 multi-chunk files
- [x] Overlap regions present in all non-first chunks of multi-chunk files
- [x] content_start_line correctly distinguishes overlap from new content
- [x] No debug artifacts or unused imports

Closes #1749
