Removes all Sail functional descriptions from the RISC-V instruction database, along with the BSD-2-Clause license that covered that content, schema support, and all code paths that referenced or rendered it.

## Instruction Files (~760 files)
- Stripped `sail(): |` key and surrounding `SPDX-SnippetBegin/End` blocks (BSD-2-Clause copyright) from all `.yaml` and `.layout` files under `spec/std/isa/inst/`
- Removed sail() from the mock test fixture (`tools/ruby-gems/udb/test/mock_spec/isa/inst/mock.yaml`)
- Updated `spec/std/isa/inst/README.md` template and field descriptions

## License
- Deleted `LICENSE-BSD-2-Clause.txt` and `LICENSES/BSD-2-Clause.txt` (symlink) — these existed solely for the sail() snippets

## Schema (`spec/schemas/inst_schema.json`)
- Removed `"sail()"` property definition
- Bumped `$id` from `v0.1` → `v0.2`

## Backend Templates
- `tools/ruby-gems/udb-gen/templates/common/inst.adoc.erb` (symlinked from `backends/common_templates/adoc/`): dropped sail() block and the `PSEUDO` env-var logic that switched between IDL/sail/both
- `backends/portfolio/templates/inst_appendix.adoc.erb`: removed "Sail Operation" section
- `tools/ruby-gems/udb-gen/templates/manual/instruction.adoc.erb`: replaced the `[tabs]` IDL/Sail block in the Execution section with a plain IDL code block

## Generator
- `tools/ruby-gems/udb-gen/lib/udb-gen/generators/ext_doc/generator.rb`: removed `--pseudo` option (`sail` / `idl` / `both`)

## YAML Resolver & Tools
- `yaml_resolver.rb` / `yaml_resolver.py`: removed the `sail()` carve-out from IDL key detection — all `*()` keys are now treated uniformly as IDL
- `tools/mcp_gen_server/server.py`: scoped `find_function_usages` to `operation()` only
- `tools/ruby-gems/udb/test/test_yaml_resolver.rb`: updated helper functions accordingly

<!-- START COPILOT CODING AGENT SUFFIX -->



<!-- START COPILOT ORIGINAL PROMPT -->



<details>

<summary>Original prompt</summary>

> Create a new PR that removes the "sail()" key from any file under spec/**/inst/. Also remove the surrounding comments about copyright/license. Remove the corresponding license file at the root and/or LICENSES directory. Remove sail() from the corresponding schema, reading doc/schemas/versioning.adoc first to understand how to bump the schema version. Look for any use of the sail data elsewhere in the repository. Off the top of my head, there is likely references in some of the backends that select between IDL and sail code, and probably some small references in the tools. When removed from the backend, be sure to modify the template to only display IDL (including dropping the use of the tabs asciidoc extension) and any any related generation options )probably specified through an environment variable). Monitor CI and fix any issues that arise.


</details>



<!-- START COPILOT CODING AGENT TIPS -->
---

📱 Kick off Copilot coding agent tasks wherever you are with [GitHub Mobile](https://gh.io/cca-mobile-docs), available on iOS and Android.
