This patch reflects the observed behaviour from GCC, as discussed in
issue #99.

Note: this is a solution to #99 but not necessarily the best one (see my comment in that thread). Alternatively, we could always ignore zero-width bitfields when considering eligibility for passing according to the floating point calling convention which seems more consistent even if it doesn't fully match what GCC currently does.
