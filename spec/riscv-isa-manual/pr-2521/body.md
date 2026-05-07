## Introduction
This PR introduces the RISC-V S-level Physical Memory Protection (SPMP) specification. 

SPMP is designed to enforce memory isolation in environments where supervisor mode is implemented but virtual memory, managed by a Memory Management Unit (MMU), is not. Processors based on the RISC-V architecture are gaining significant traction in the burgeoning Internet of Things (IoT) and automotive sectors. In these domains, however, virtual memory is frequently avoided to comply with stringent constraints on system resources and execution latency. Consequently, in the absence of an MMU, effectively isolating S-mode operating systems (such as an RTOS) from U-mode applications presents a significant challenge. The SPMP extension adopts an architecture and programming model analogous to the existing Physical Memory Protection (PMP) standard. It equips an S-mode OS with the capability to guarantee secure processing and fault isolation for U-mode software. This protection is achieved by restricting the physical memory regions that U-mode software can access on a specific hart.

## Current Status
- The specification for Sspmp extension has passed the ARC review.
- The Task Group has prepared all requirements for ratification, including support for simulator (QEMU), hardware PoC (CVA6), software PoC (Zephyr), and the Sail model.

