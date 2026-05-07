Brought up by @ThinkOpenly here: https://github.com/riscv-software-src/riscv-unified-db/pull/811#issuecomment-2912568489

```
❯ pre-commit run --all-files check-jsonschema
Validate instruction files with jsonschema...............................Passed
Validate CSR files with jsonschema.......................................Passed
Validate extension files with jsonschema.................................Passed
Validate cert model files with jsonschema................................Passed
Validate cert class files with jsonschema................................Passed
Validate profile family files with jsonschema........(no files to check)Skipped
Validate profile release files with jsonschema...........................Failed
- hook id: check-jsonschema
- exit code: 1

Schema validation errors were encountered.
  arch/profile_release/Mock.yaml::$: Additional properties are not allowed ('class', 'contributors', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'release', 'state', 'versions' were unexpected)
  arch/profile_release/RVA22.yaml::$: Additional properties are not allowed ('class', 'contributors', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'release', 'state', 'versions' were unexpected)
  arch/profile_release/RVI20.yaml::$: Additional properties are not allowed ('base', 'class', 'contributors', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'state', 'versions' were unexpected)
  arch/profile_release/RVA20.yaml::$: Additional properties are not allowed ('class', 'contributors', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'release', 'state', 'versions' were unexpected)
Schema validation errors were encountered.
  arch/profile_release/RVA23.yaml::$: Additional properties are not allowed ('class', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'release', 'state', 'versions' were unexpected)
  arch/profile_release/RVB23.yaml::$: Additional properties are not allowed ('class', 'description', 'introduction', 'long_name', 'marketing_name', 'profiles', 'ratification_date', 'release', 'state', 'versions' were unexpected)
```
