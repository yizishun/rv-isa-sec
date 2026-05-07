## Description
This PR resolves the encoding divergence for c.nop between the unified database and riscv-opcodes, as reported in issue #1177.
## Changes
YAML (`c.nop.yaml`):

Updated the match pattern from the fully constrained value `0x0001` to `000-00000-----01`, using wildcards for the immediate field
This change enables the database to correctly recognize c.addi x0, x0, imm (where imm ≠ 0) as c.nop HINT variants

Generator (`template_helpers.rb`):

Enhanced assembly_fmt and assembly_fmt_args to support dynamic formatting based on the immediate value:

When imm = 0: displays as c.nop
When imm ≠ 0 (HINT variant): displays as c.nop <imm>



## Verification

- Confirmed the match field correctly enforces the rd = x0 constraint (bits 11-7)
- Verified the Ruby generator properly switches between assembly formats based on the immediate value

Fixes #1177
