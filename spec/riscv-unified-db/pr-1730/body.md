Previously, the IDL compiler used the symbol table to track variable
values during compile-time value analysis by layering the same variable
in different scopes. The idea was that when the scope changes and symtab
is popped, the variable reverts back to its value in the parent scope.
This was never a great solution, and is potentially error-prone. This
change was driven by a pruning error in fadd.s that exposed the fragility.

This patch changes the mechanism to use a more robust value snapshot/restore,
and adds more tests to check that we are getting it right.


