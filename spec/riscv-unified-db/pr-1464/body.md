## Summary

Replace placeholder text with accurate documentation for all 15 Hypervisor extension instructions that previously had `long_name: No synopsis available` and `description: No description available`.

## Changes

### Load Instructions (hlv.*)
| Instruction | Long Name |
|-------------|-----------|
| hlv.b | Hypervisor load byte |
| hlv.bu | Hypervisor load byte unsigned |
| hlv.h | Hypervisor load halfword |
| hlv.hu | Hypervisor load halfword unsigned |
| hlv.w | Hypervisor load word |
| hlv.wu | Hypervisor load word unsigned |
| hlv.d | Hypervisor load doubleword |

### Executable Load Instructions (hlvx.*)
| Instruction | Long Name |
|-------------|-----------|
| hlvx.hu | Hypervisor load halfword unsigned, executable |
| hlvx.wu | Hypervisor load word unsigned, executable |

### Store Instructions (hsv.*)
| Instruction | Long Name |
|-------------|-----------|
| hsv.b | Hypervisor store byte |
| hsv.h | Hypervisor store halfword |
| hsv.w | Hypervisor store word |
| hsv.d | Hypervisor store doubleword |

### Fence Instructions
| Instruction | Long Name |
|-------------|-----------|
| hfence.gvma | Hypervisor fence guest-physical address |
| hfence.vvma | Hypervisor fence guest virtual address |

## Description Details

All descriptions explain the "as though V=1" semantics for hypervisor virtual memory access, consistent with the RISC-V Privileged Specification.



