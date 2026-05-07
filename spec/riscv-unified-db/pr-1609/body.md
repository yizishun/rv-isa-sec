Moved the inline test code for UnknownLiteral from tools/ruby-gems/idlc/lib/idlc/ast.rb to the existing test_values.rb file. This ensures that the test is run with the rest of the suite and doesn't clutter the production code.

## Changes:

- Removed test code from ast.rb (6 lines)
- Added TestUnknownLiteral as a top-level class in test_values.rb (11 lines)
- Used explicit Idl::UnknownLiteral reference to avoid polluting the Idl namespace
- Removed require statement from test/run.rb

