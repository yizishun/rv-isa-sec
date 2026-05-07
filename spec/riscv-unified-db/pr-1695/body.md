This PR removes the database-specific pseudo-extensions Smpmp and Smhpm 
and replaces their usage in CSR layouts and IDL constraints with standard parameter-based conditions (NUM_PMP_ENTRIES and HPM_COUNTER_EN).

Key Changes:
- Deleted Smpmp.yaml and Smhpm.yaml
- Updated PMP and HPM CSR layouts to use parameter checks instead of extension checks
- Fixed a bug in test_cfg.rb and test_cfg_arch.rb where generation paths were clobbering the main gen/ directory
- Updated MC100-32-Full and mc100-32-full-example configurations to include now-mandatory PMP parameters

All regression tests pass.

Closes #1608

