Live preview of these changes is here:
https://dhower-qc.github.io/riscv-unified-db/




- Add schema doc generator gem (tools/ruby-gems/schema_doc_gen/) that produces
  MDX pages from JSON Schema files; invoked via bin/chore gen schema-docs (D7)
- Generator renders bare enum values as pipe-separated backtick values
- Add AnchorOpenDetails React component for collapsible schema blocks
- Generate schema docs for all v0.1 and v0.2 schemas under doc/docs/schemas/
- Improve config_schema.json and ext_schema.json descriptions and examples
- Add spec_state description to schema_defs.json (all six ratification states)
- Add IDL syntax highlighting, landing page, and language reference pages (D5/D6)
- Add idlc compiler page (doc/docs/idl/idlc.md)
- Add configurations concept overview (doc/docs/concepts/configurations/)
- Configure navbar, theming, UDB/IDL logos with CSS variable support (D8)
- Add CI build-only job via bin/npm wrapper (D4)
- Update planning docs (decisions.md D7/D8, implementation plan task status)

