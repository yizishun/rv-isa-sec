## Summary
This PR adds cache-related architectural parameters extracted from the RISC-V Privileged Specification (Section 19.3.1).

## Methodology
- Used a large-context LLM to identify candidate parameters
- No fine-tuning was performed
- Hallucination was mitigated through strict prompt constraints and manual verification
- Each parameter is justified with an exact quotation from the specification

## Files Added
- spec/privileged/cache_parameters.yaml
- doc/cache_parameter_extraction_notes.md

## Scope
Intentionally limited to Privileged Spec 19.3.1 for correctness and reviewability.

