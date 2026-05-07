Just proof of concept of this tool https://github.com/sourcemeta/jsonschema
Don't expect this PR to go anywhere mostly just capturing results.

Has a lint feature that found some anti-patterns in the schema files.  The `--fix` option also formats the files so I did that commit separately to make it easier to see the anti-patterns.

Here's the log output: 

```
jsonschema lint schemas/.
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_class_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_class_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_class_schema.json:
  Setting `type` alongside `enum` is considered an anti-pattern, as the enumeration choices already imply their respective types (enum_with_type)
    at schema location "/properties/processor_kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_class_schema.json:
  Setting `type` alongside `enum` is considered an anti-pattern, as the enumeration choices already imply their respective types (enum_with_type)
    at schema location "/properties/mandatory_priv_modes/items"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_model_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_model_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/cert_model_schema.json:
  Setting `type` alongside `enum` is considered an anti-pattern, as the enumeration choices already imply their respective types (enum_with_type)
    at schema location "/properties/base"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/config_schema.json:
  Setting `type` alongside `enum` is considered an anti-pattern, as the enumeration choices already imply their respective types (enum_with_type)
    at schema location "/properties/type"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/config_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/config_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/json-schema-draft-07.json:
  Setting the `items` keyword to the true schema does not add any further constraint (items_schema_default)
    at schema location "/properties/examples"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/json-schema-draft-07.json:
  Setting the `items` keyword to the true schema does not add any further constraint (items_schema_default)
    at schema location "/properties/enum"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/manual_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/manual_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/manual_version_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/manual_version_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_class_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_class_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_class_schema.json:
  Setting `type` alongside `enum` is considered an anti-pattern, as the enumeration choices already imply their respective types (enum_with_type)
    at schema location "/properties/processor_kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_release_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_release_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/$schema"
/Users/kbroch/rvi/repos/riscv-software-src/riscv-unified-db/schemas/profile_schema.json:
  Setting `type` alongside `const` is considered an anti-pattern, as the constant already implies its respective type (const_with_type)
    at schema location "/properties/kind"
```

