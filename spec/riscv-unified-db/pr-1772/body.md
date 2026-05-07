
## Task Completion Summary
This PR implements the core architectural requirements for the RISC-V parameter pipeline as defined in Issue 1. The focus was on deep schema parsing and exact CSR logic extraction to ensure data completeness for RAG and analysis workflows.

### 1. Schema Parsing & Extraction
- **Recursive $ref Resolution**: Implemented resolution across all schema nodes, including nested `allOf`, `oneOf`, and `array` structures.
- **Branch Analysis**: Updated the parser to independently analyze and store conditional branch schemas.
- **Recursive definedBy Parsing**: Replaced shallow extraction with a full recursive parser to capture extensions, parameter conditions, and the raw structure.
- **Dual-Mode Pipeline**: Introduced `rag` and `analysis` modes. 
    - `analysis` mode retains the full structural detail and raw schema.
    - `rag` mode uses summaries optimized for embedding-based retrieval.

### 2. CSR Logic Cross-Referencing
- **IDL-Based Detection**: Upgraded CSR cross-referencing to detect parameter usage within specific IDL fields rather than simple string matching:
    - Target fields: `sw_write(csr_value)`, `type()`, `reset_value`, and `legal?(csr_value)`.
- **Constraint Mapping**: This allows for precise linking between parameters and their associated hardware register constraints.

### 3. Data Outputs & Metrics
- **Dependency Graph**: Generated a standard output (`dependency_graph.json`) mapping parameter relationships.
- **Enum Preservation**: Preserved both compressed and raw values for parameters to ensure range data is available for retrieval.
- **Validation Metrics**: Added metrics to track the completeness and retrieval readiness of the database.


## Related Issue
Closes #1769 
