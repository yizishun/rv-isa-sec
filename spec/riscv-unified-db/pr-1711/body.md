Closes #1704

## Summary
- Add missing `Zalrsc` instruction variants:
  - `lr.d.aq`, `lr.d.rl`, `lr.d.aqrl`
  - `lr.w.aq`, `lr.w.rl`, `lr.w.aqrl`
  - `sc.d.aq`, `sc.d.rl`, `sc.d.aqrl`
  - `sc.w.aq`, `sc.w.rl`, `sc.w.aqrl`
- Add missing `Zalasr` instruction variants:
  - `ld.aqrl`, `lw.aqrl`, `lh.aqrl`, `lb.aqrl`
  - `sd.aqrl`, `sw.aqrl`, `sh.aqrl`, `sb.aqrl`
- Constrain base `sc.d` decode bits (`aq=0`, `rl=0`) to avoid overlap with suffix variants
- Update instructions appendix golden output

## Validation
- `./bin/regress --all`
- `./do test:instruction_appendix`

