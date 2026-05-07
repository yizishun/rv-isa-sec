I've started from #994 to avoid merge problems later

I've reordered the CSRs in the CSV so that they are more logically grouped, as it makes the behaviour summary table much easier to read.

Most of the edits are very minor - but it does include renaming the CHERI Execution Modes to:

* Pointer Mode
* Capability Mode

As the metadata bit = 1 for Pointer Mode I've renamed it from M to P
