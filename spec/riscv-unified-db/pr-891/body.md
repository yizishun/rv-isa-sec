Includes the following features:

- Unified conditional schema in the database
- Ruby support to understand conditions and test for satisfiability
- Parameters promoted to top-level data (rather than under extensions)
- Interrupt/exception codes promoted to top-level data (rather than under extensions)
- No longer auto-expands implications in full configs (i.e., no longer sufficient to specify just "F' -- need to specify "F" and "Zicsr")
- Adds coverage tests and CI for udb ruby gem
- Interface improvements (better logger, progress bars)
- Adds udb-gen gem, with first command "ext-doc" for generating extension documentation
- Adds CI tests for Xqci
- Adds golden reference for generated profile documents
- Numerous fixes to extension relations (notably B, C)
- Makes many generated (from .layout) files read-only to prevent accidental modification
- Adds extension information for Zfinx/Zdinx/Zhinxmin
- Generates partial configs for all profiles in spec/std and stores then under cfgs/profile
