- Store actual results in the cache (not a boolean sentinel), so shared
  callers receive the full transitive closure of reachable functions;
  this also fixes a significant performance regression in IDL type
  checking by avoiding redundant re-traversal of shared callees
- Use array key [name, tvals, avals] instead of .hash to avoid collisions
- Rescue SystemStackError in StatementAst#reachable_functions and report
  it as a type_error: unconditional recursion is not representable in IDL
- Share a single cache across all per-instruction calls in cfg_arch.rb
- Fix @to_condition/@in_scope_condition memoization collision
- Add 11 tests covering direct calls, transitive closure, deduplication,
  recursion, conditional branching, builtins, and shared-cache correctness
