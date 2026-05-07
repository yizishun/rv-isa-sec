## Summary

This PR completes the `doc/data-templates.adoc` file, replacing the TODO placeholder with comprehensive documentation for creating UDB data files.

## Problem

The `doc/data-templates.adoc` file was linked from README.adoc as a "How-to/recipe" guide but only contained "TODO". New contributors clicking this link found no guidance on creating UDB data files.

## Solution

Added ~380 lines of documentation covering:

### Extension Definitions
- Basic template with required fields
- Extension types (privileged/unprivileged)
- Extensions with parameter requirements

### Instruction Definitions
- Complete template with encoding, assembly, and operation
- Encoding variables (location, sign_extend, left_shift)
- Pseudoinstruction mappings
- Operation IDL patterns

### CSR Definitions
- Basic template with fields
- Field types (RO, RW, RWR, RO-H, etc.)
- RV32/RV64 different locations
- Dynamic field types with `type()`
- Software write behavior with `sw_write()`
- Field aliases

### Parameter Definitions
- Basic template
- Schema types (integer, boolean, enum, array)

### Additional Sections
- Validation steps
- Common validation errors
- Best practices
- Links to real examples in the repository

## Test plan

- [x] AsciiDoc renders correctly
- [x] All code examples are syntactically valid YAML
- [x] Links to other documentation files are correct

Closes #1343

