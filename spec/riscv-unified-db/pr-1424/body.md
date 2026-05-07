## Changes
- Add `mop.r.N.layout` for generating `mop.r.0` through `mop.r.31` (32 files)
- Add `mop.rr.N.layout` for generating `mop.rr.0` through `mop.rr.7` (8 files)
- Add `c.mop.N.layout` for generating `c.mop.1`, `c.mop.3`, `c.mop.5`, `c.mop.7`, `c.mop.9`, `c.mop.11`, `c.mop.13`, `c.mop.15` (8 files)
- Update `Rakefile` with generation rules following the AMO instruction pattern
- Generate all 48 individual instruction YAML files
## Testing
- All 48 instruction files generated with correct 32-bit/16-bit encoding patterns
- Layout files follow the existing pattern used for AMO instructions
