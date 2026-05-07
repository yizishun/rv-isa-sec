This PR implements GPR definition in the Unified Database, addressing issue #1085.

## Problem

The UDB currently lacks information about General Purpose Registers in YAML format.

## Solution

This PR adds structured register file support to UDB, starting with RISC-V general purpose registers as a foundation for future register file additions.

## Changes

### New Files
- **`spec/schemas/register_schema.json`**: JSON schema defining the structure for YAML register file.
- **`spec/std/isa/register/gpr.yaml`**: Complete RISC-V general purpose register file with all 32 registers, proper ABI mnemonics, calling convention roles, and conditional support for RV32E (16 registers)
- **`tools/ruby-gems/udb/lib/udb/obj/register_file.rb`**: RegisterFile class extending TopLevelDatabaseObject for programmatic access to register file data

### Modified Files
- **`spec/schemas/schema_defs.json`**: Added register-specific schema definitions
- **`spec/std/isa/README.adoc`**: Updated architecture documentation to include register files alongside extensions/instructions/CSRs with usage examples
- **`tools/ruby-gems/udb/lib/udb/obj/database_obj.rb`**: Added RegisterFile kind to DatabaseObject::Kind enum for type system integration
- **`tools/ruby-gems/udb/lib/udb/architecture.rb`**: Added register file loading support to architecture system

## Register Details

The GPR implementation includes:
- All 32 general purpose registers (x0-x31) with standard names
- Proper ABI mnemonics (zero, ra, sp, gp, tp, t0-t6, s0-s11, a0-a7)
- Calling convention classifications (caller/callee saved, arguments, return values)
- Special register roles (zero register, stack pointer, frame pointer, etc.)
- Conditional presence for RV32E embedded profile

## Benefits

- **Single Source of Truth**: Eliminates need for hardcoded register mappings in downstream tools
- **Consistency**: Ensures all tools use identical register information
- **Automation Ready**: Structured format enables automatic code generation

## Future Work

This establishes the foundation for adding other register files mentioned in issue #1085:
- Floating Point Registers
- Vector Registers

Closes #1085
