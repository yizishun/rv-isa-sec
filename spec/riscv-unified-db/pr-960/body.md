## Summary
Adds missing platform-specific configuration parameters to Zihpm extension as requested in issue #69.

## Changes
- **NUM_HPM_COUNTERS**: Specifies number of additional HPM counters (0-29)
- **UNIMPLEMENTED_HPM_BEHAVIOR**: Defines behavior for unimplemented counter access
- **UNIMPLEMENTED_HPM_CONSTANT_VALUE**: Constant value returned when applicable

## Addresses
- Platform-specific counter implementation requirements from ISA manual
- ThinkOpenly's final parameter specifications in issue comments

Closes #69 

Ready for Review @ThinkOpenly @dhower-qc @AFOliveira 
