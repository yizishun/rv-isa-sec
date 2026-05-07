Replaces the Python YAML resolver with a pure Ruby implementation that preserves comments and formatting. Includes:

- `Udb::Yaml::CommentParser`: parses YAML while tracking comments and source locations
- `Udb::Yaml::PreservingEmitter`: emits YAML while preserving comments and string styles
- `Udb::Yaml::Resolver`: resolves `$inherits`, `$remove`, and compiles IDL when `compile_idl: true`
- Comprehensive test suite in `test_yaml_resolver.rb` including `test_compile_idl_all_database_files` which verifies IDL compilation produces correct ASTs with valid source byte-offset info across all database files
