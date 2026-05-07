In the released udb gem, calling the CLI causes a `NameError`.

According to Copilot, this is because:

When bin/udb loads udb/cli, the require chain (cli -> resolver -> cfg_arch -> non_isa_specification -> database_obj -> doc_link) reaches doc_link.rb before lib/udb.rb is loaded. doc_link.rb uses the compact class notation `class Udb::DocLink` which requires the Udb constant to already exist, causing:

```
  uninitialized constant Udb (NameError)
  class Udb::DocLink
```

Fix by replacing the compact notation with the nested module form (`module Udb; class DocLink`), which is self-contained and defines the module if it doesn't already exist.
