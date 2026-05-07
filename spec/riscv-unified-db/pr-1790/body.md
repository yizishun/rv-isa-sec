## Summary

This PR introduces the initial ingest layer for the RISC-V unified database RAG pipeline, focusing on extracting structured information from both specification text and parameter definitions. It implements an AsciiDoc-based chunker for parsing and processing ISA manual files, along with a YAML-based chunker for UDB parameter data. Both sources are normalized into a unified chunk schema to support downstream tasks such as classification and retrieval. The pipeline is designed to be config-driven and modular, allowing iterative refinement of filtering and chunking logic. 

Note:- This is an early-stage implementation and is intended to evolve based on feedback and validation.

---

### Ingestion — Input Coverage

| Source | Files | Chunker |
|--------|------|---------|
| YAML (param + csr + ext) | 781 | `chunker_udb.py` |
| ISA Manual (`.adoc`) | 136 | `chunker_adoc.py` |
| **Total** | **917** | — |

**Notes**
- YAML files are local (`spec/std/isa/`)  
- `.adoc` files are cloned at runtime and removed after processing  
- CSR files are discovered recursively across nested directories  

---

## Status — Current Extraction 

| Metric | Value |
|--------|------|
| Output dataset | `chunks_repo.json` |
| Parameter dataset | `parameter_dataset.csv` |
| Raw chunk files | 100+ |
| Largest chunk file | `src__v-st-ext.json` |
| Coverage | unpriv + priv + profiles + extensions |

---

## Chunkers

### `chunker_adoc.py`
- Parses `.adoc` specification files  
- Cleans formatting artifacts (anchors, tables, directives)  
- Tracks section hierarchy (breadcrumb metadata)  
- Splits content into sentence and logical rule-level chunks  
- Outputs structured chunks via classifier integration  

### `chunker_udb.py`
- Parses YAML parameter definitions  
- Extracts relevant fields into text form  
- Normalizes output to match AsciiDoc chunk schema  

---

## Tasks

### Completed
- [x] AsciiDoc parsing, cleaning, and chunking  
- [x] UDB YAML ingestion  
- [x] Section hierarchy tracking  
- [x] Shared chunk schema across sources    
- [x] Pipeline execution flow  
- [x] Initial dataset generation (`json`, `csv`)  

### Pending
- [ ] Normative vs descriptive filtering improvements  
- [ ] Chunk scoring/confidence tuning  
- [x] Classifier integration (external)  
- [ ] Performance optimization  
- [ ] Manual Review and `schema_rules` validation
---

## Observations
- Normative rules are extracted but mixed with descriptive text  
- Code blocks and examples are still present in chunks  
- Some files produce low or zero output  
- Chunking is currently sentence-level and may need refinement 
- Outputs require manual review and requirement-based filtering

---

## Concerns
- A large number of generated outputs are pushed in this PR and are for review purposes
- Output files are regenerable and will be removed in a follow-up PR  
- Filtering logic is still evolving and requires tuning  

---

## Testing
- Pipeline executed on full ISA specification  
- Outputs manually inspected (sample-based)  
- No LLM-based testing and spec verification 

---

## Expected Outcome
- Unified ingest layer for specification + UDB sources  
- Structured chunk dataset ready for downstream RAG pipeline stages  

---

## Status
In progress (#1779)
