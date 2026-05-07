## Summary

- Adds a new Claude skill `.claude/skills/model-instruction-from-spec/SKILL.md` that generates IDL `operation()` bodies for RISC-V instructions from their YAML spec files
- The skill locates the instruction YAML under `spec/std/isa/inst/`, reads the description, encoding, and `sail()` reference, then generates syntactically valid IDL per the grammar in `tools/ruby-gems/idlc/lib/idlc/idl.treetop`
- Writes the IDL into the spec file if `operation()` is empty, or to `/tmp/<name>.yaml` if already populated

## Test plan

- [ ] Run `/model-instruction-from-spec <instruction>` on an instruction with an empty `operation()` and verify IDL is written into the spec YAML
- [ ] Run `/model-instruction-from-spec <instruction>` on an instruction with a populated `operation()` and verify output goes to `/tmp/<name>.yaml`
- [ ] Spot-check generated IDL for syntactic validity against the Treetop grammar

🤖 Generated with [Claude Code](https://claude.com/claude-code)
