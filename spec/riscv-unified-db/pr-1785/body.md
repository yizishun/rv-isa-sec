Two particularly interesting cases:
- Some vector "less than or equal"/"greater than" instructions are mapped to
 "less than"/"greater than or equal" pseudoinstructions with the immediate
  incremented. So, these need to allow for (by ignoring) cases where the
  immediate cannot be incremented without overflowing.
- `vmnot.v` depends on the immediate for `vxor.vi` being "-1", thus
  sign-extended. Add this attribute to the opcode field (and presume the
  attribute is applied before pseudoinstruction mapping).
