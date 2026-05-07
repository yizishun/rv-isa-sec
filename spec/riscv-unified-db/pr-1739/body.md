Test/mock data was living in `spec/` (the production ISA specification directory) alongside real spec data. This removes it and cleans up the only production code that referenced it.

## Deleted from `spec/std/isa/`

- `ext/Xmock.yaml` — mock extension
- `param/MOCK_*.yaml` (22 files) — mock parameters of all schema types (int ranges, booleans, string/int enums, arrays), all `definedBy` the `Xmock` extension
- `proc_cert_class/MockProcessor.yaml` — mock processor certificate class
- `profile_family/Mock.yaml` — mock profile family

## Dead code removed

`table_builder.rb` had a filter to remove a "Mock" profile release from the sorted list, but no profile release with that name has ever existed (only the now-deleted profile *family*). The guard was never triggered.

```ruby
# Removed — never executed
sorted.delete_if { |pr| pr.name == "Mock" }
```

## Coverage impact

`test_conditions.rb` dynamically generates `test_param_*_defined_by` / `test_param_*_requirements` tests by iterating over all params in the real spec. Removing the 22 mock params drops ~44 generated test methods, but every schema type they represented (int, boolean, string enum, integer enum, tuple array, typed array) is still covered by multiple real params that remain in the spec.

<!-- START COPILOT CODING AGENT SUFFIX -->



<!-- START COPILOT ORIGINAL PROMPT -->



<details>

<summary>Original prompt</summary>

> Create a new PR that removes any mock data from under spec/. After submitting the PR, monitor CI for any failures. Fix failures that are simple. If project coverage drops (reported by codecov), suggest new unit tests to recover the coverage.


</details>



<!-- START COPILOT CODING AGENT TIPS -->
---

📍 Connect Copilot coding agent with [Jira](https://gh.io/cca-jira-docs), [Azure Boards](https://gh.io/cca-azure-boards-docs) or [Linear](https://gh.io/cca-linear-docs) to delegate work to Copilot in one click without leaving your project management tool.
