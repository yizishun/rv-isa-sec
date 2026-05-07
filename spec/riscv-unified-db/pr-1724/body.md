Non-dedicated M mode HPM counters are indexed 3-31 and named identically.
For example, the "long_name" for `mhpmcounter10` is
"Machine Hardware Performance Counter 10".

Non-dedicated unprivileged HPM counters are indexed 3-31, but named 0-28.
For example, the "long_name" for `hpmcounter10` is
"Machine Hardware Performance Counter 7".

This seems very wrong. Fix it.
