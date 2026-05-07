Currently, assembly syntax is represented as a simple string of comma-separated operands with a heuristic naming convention to indicate their respective type and purpose.

Make this more rigorous by adding a schema which supports:
- registers
- the registers' register file (GPR, FPR, VR, CSR, etc.)
- dereference syntax "(reg)"
- dereference+offset syntax "offset(reg)"
- immediates
- floating-point rounding mode and possible values
- FENCE scopes
- register lists (for POP/PUSH)

The new "operands" YAML field is currently optional and coexists with the existing "assembly" field. So, support can be added over time to both the YAML files and the infrastructure to support generation of actual assembly syntax where needed (documentation) until the "assembly" field is no longer needed.
