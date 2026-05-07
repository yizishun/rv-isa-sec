## Summary
Fix shellcheck warnings in `bin/clean` and `bin/clobber` scripts.

## Changes
- **SC2046**: Quote command substitution to prevent word splitting
- **SC2086**: Double quote variables to prevent globbing and word splitting  

## Testing
- All pre-commit hooks pass
- `shellcheck bin/clean bin/clobber` passes with no warnings
