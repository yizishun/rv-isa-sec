Summary of Changes
Following feedback from the Architecture Review Committee, this specification has been reorganized. Core chapters now focus on baseline features; optional extensions are grouped in the Extensions chapter; design strategies and models for resource-constrained systems are in the Application Note. HWCFG registers have been updated to support these changes.
1. Structural and Functional Updates
SRCMD/MDCFG tables:
Now in Chapter 2: Terminology and Concepts; reduction formats and mappings in Appendix A: Application Note.
Implementation models & formats:
All moved to Appendix A: Application Note (Section A.7).
Configuration protection:
Now a dedicated Chapter 3: Configuration Protection.
Runtime configuration:
Programming steps moved to Chapter 5: Extensions (Section 5.8).
SPS, MFR, MSI:
Now part of Chapter 5: Extensions.
Run-out memory domains:
Covered in Appendix A: Application Note (Section A.6).
2. Registers and Fields
HWCFG0:
Layout updated.
HWCFG2 & HWCFG3:
Added for extension and implementation options.
