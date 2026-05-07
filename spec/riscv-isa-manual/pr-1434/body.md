This part of the spec was written before the RVWMO section which introduced the "memory operation" nomenclature.

This updates the section to talk about memory operations instead of memory accesses.

I also reworked the text about CMOs and PMPs because it didn't quite make sense - the access size is irrelevant for PMPs; it's the memory operation size that matters, and that can be anything for CMOs since they are allowed to be decomposed.
