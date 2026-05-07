This PR refactors the satisfiability checking approach and includes significant improvements to the test infrastructure and tooling.

### Core Changes: Z3 Incremental Solving

Previously, the udb gem would determine the minimal subset of constraints for each SAT check, construct a Z3 solver for that subset, and check satisfiability. For example, testing `(U & S)` would expand to `(U & S) & (S -> U) & (...)`.

This PR changes the approach to create a complete model of the configured architecture containing all information upfront, then check SAT by AND-ing the test with the full model: `(U & S) & (complete arch spec)`.

The new implementation leverages Z3's __incremental solving__ capabilities, which allows checkpointing proofs and reusing them. Each new test is incremental on top of the full architecture model.

__Performance:__ Slightly faster for batch jobs but longer startup time (long-running jobs become shorter, short-running jobs become longer). Overall performance is comparable, but this approach:

- Reduces udb code complexity by leaning more on Z3
- Makes it easier to add parameter restrictions comparing to other parameter values
- Removes the need for mock architecture support

### Additional Improvements

__Test Infrastructure:__

- Significantly increased IDL test coverage with new comprehensive test suites
- Added data-driven test frameworks for type checking and control flow
- New test documentation and coverage analysis tools

__Tooling & Developer Experience:__

- Refactored `bin/chore` script with improved structure
- Added container command wrappers (`bin/container/idlc`, `bin/container/udb`, etc.)
- Better error messages and debugging support

__Type System & Compiler:__

- Improved type checking for MXLEN-wide integer literals and ternary operations
- Enhanced pruning pass in IDL compiler
- Better handling of CSR field widths

__Code Quality:__

- Adjusted codecov configuration to focus on project coverage over patch coverage
- Added documentation to Z3 module


supersedes #1524
