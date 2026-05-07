The MDCFG Table is used to map a memory domain to its own entries:
* For baseline MDCFG format:
  - index j belongs to MD m if MDCFG(m-1).t ≤ j < MDCFG(m).t, where m > 0.
  - index j belongs to MD 0 if j < MDCFG(0).t
* For other MDCFG formats:
  - Entry Indexes = [m * k, (m * k) + k - 1], where k=(HWCFG3.md_entry_num+1).

This commits fixes the bug in the reference model where upper bound index must not be iterated.
