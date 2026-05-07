## Summary

Performance improvements to IDL type checking and AST processing:

- **Lazy source propagation**: `input_file` and `starting_line` now walk up the parent chain on demand instead of eagerly propagating to all children on `set_input_file`. This eliminates O(n) tree traversals on every parse.
- **Memoized AST operations**: Introduce `pruned_operation_ast`, `type_checked_pruned_sw_read_ast`, `pruned_reset_value_ast`, `pruned_sw_write_ast`, and `pruned_type_ast` helpers that cache prune+type-check results, avoiding redundant work across multiple callers.
- **Faster `eql?`/`hash` for condition terms**: `ParameterTerm` and `ExtensionTerm` now use a pre-computed `yaml_no_reason` hash instead of re-running `<=>` for equality, and short-circuit on hash mismatch.
- **Memoized Z3 satisfiability**: `CfgArch` caches `ParameterTerm` Z3 results in `param_term_satisfied_memo` so identical terms across different `Condition` objects share results.
- **`Executable`/`Declaration` as abstract modules**: Converted from `interface!` to `abstract!` with a default `executable?`/`declaration?` predicate, enabling `is_a?` checks to be replaced with cheaper method calls.
- **Consolidated `$`-function dispatch**: New `DollarFunctionCallSyntaxNode` centralizes `$width`, `$signed`, `$bits`, etc. dispatch in one place, reducing parser grammar duplication.
- **Sorbet runtime checks disabled on hot paths**: Added `.checked(:never)` to `set_input_file*` and other frequently-called methods to reduce Sorbet overhead.
