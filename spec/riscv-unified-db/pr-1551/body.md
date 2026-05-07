### Description: 
This PR addresses Issue #1550 by introducing a dedicated xlen property in architecture configurations, replacing the reliance on the MXLEN parameter which incorrectly implied M-mode presence.

### Changes:
Configurations: Updated all 27 YAML configuration files in cfgs/ and cfgs/profile/ to use xlen: <value> instead of MXLEN: <value>.

Logic: Modified udb/config.rb to parse the xlen property as a first-class citizen. Added a fallback to MXLEN for backward compatibility during the transition.

Refactoring: Removed MXLEN injection from Profile and ProfileRelease objects and updated Condition logic to remove dependencies on the MXLEN parameter.

Tests: Updated test_cfg_arch.rb and test_conditions.rb to verify the new xlen property usage and remove legacy parameter checks.

### Closes issue:

Fixes #1550 

cc - @james-ball-qualcomm 
