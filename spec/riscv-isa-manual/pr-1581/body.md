`pmpaddr` uniquely contains writable bits that "read as" some value, but have an underlying value that can be different. The behaviour when you modify *different* bits in the CSR using `csrr{sc}[i]` was not clear.

This is the behaviour that the Sail model, SPIKE and the open-source Rocket core all implement.
