## Summary

- Add `description` and `operation()` IDL for all 16 Zalasr extension instructions
  via parameterized layout files (`lSIZE.AQRL.layout`, `sSIZE.AQRL.layout`)
- Load-acquire instructions: `lb.aq`, `lh.aq`, `lw.aq`, `ld.aq`
- Load-acquire-release instructions: `lb.aqrl`, `lh.aqrl`, `lw.aqrl`, `ld.aqrl`
- Store-release instructions: `sb.rl`, `sh.rl`, `sw.rl`, `sd.rl`
- Store-acquire-release instructions: `sb.aqrl`, `sh.aqrl`, `sw.aqrl`, `sd.aqrl`
- Each instruction documents acquire/release memory ordering semantics and performs
  explicit alignment checking in `operation()`
- Extend `read_memory_aligned` and `write_memory_aligned` in `globals.isa` with
  `aq`/`rl` parameters for memory ordering semantics
- Update all existing callers to pass `1'b0, 1'b0` (no ordering)
- Changes are in layout files only; YAML files are regenerated from layouts

## Changes after review

- Rebased on current `main` (after #1711 which introduced layout-based generation)
- Moved all changes from individual YAML files into layout templates per reviewer feedback
- Removed `sail()` blocks (removed upstream in #1740)
- Added parameterized `description` and `operation()` to layout files

## Test plan

- [x] All YAML files pass JSON schema validation (`inst_schema.json`)
- [x] Prettier formatting passes
- [x] No trailing whitespace or missing newlines
- [ ] CI passes
