Templated functions were originally added to enhance static analysis,
but the toolchain now performs complete static value analysis
regardless of argument type. Remove this feature entirely.

BREAKING CHANGE: Templated functions are no longer supported in IDL

