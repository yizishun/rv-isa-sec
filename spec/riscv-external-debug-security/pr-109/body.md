This pull request introduces significant updates and clarifications to the Sdsec (ISA extension) documentation for RISC-V, focusing on privilege-based debug and trace control. The changes expand and clarify the specification, introduce new configuration tables, and provide detailed descriptions of privilege levels, debug access, and control registers. Additionally, contributor acknowledgments and documentation resources have been updated.

**Major documentation improvements and clarifications:**

*Extension overview and privilege-based debug control*  
- Expanded the introduction to the `Sdsec` extension, clarifying its security enhancements, mandatory and optional controls for different privilege modes (M/S/VS/U), and added summary tables for debug/trace controls and valid implementation combinations.

*Privilege and debug access model*  
- Added detailed explanations and tables for determining the "debug access privilege" and the "maximum allowed resume privilege mode," with explicit field mappings and behavioral descriptions for privilege transitions and debug mode entry.
- Clarified the impact of the `mdbgen` state on debug mode entry, halt requests, trigger behavior, and single-stepping, including behavior when transitioning between privilege modes.

*Optional extension controls and memory access*  
- Provided explicit descriptions for S-mode (`Smsdedbg`), VS-mode (`Smvsdedbg`), and U-mode (`Smudedbg`) debug controls, including how each extension manages privilege and access.
- Clarified how the `DMPRV` field in various CSRs (`sdcsr`, `vsdcsr`) modifies the effective debug access privilege for memory operations in debug mode, and added a detailed table for the `DMPRV` field. [[1]](diffhunk://#diff-70b10b1ac019b41aa5814694f8db1904ec388bdbf11f2bf298bb349a34a80e15L30-R158) [[2]](diffhunk://#diff-70b10b1ac019b41aa5814694f8db1904ec388bdbf11f2bf298bb349a34a80e15R276-R286)

*Contributor and resource updates*  
- Added new contributors to the `contributors.adoc` file.
- Updated the documentation subproject reference in `docs-resources`.

These changes provide a more robust, clear, and comprehensive specification for the Sdsec extension and its related privilege and debug control mechanisms.
