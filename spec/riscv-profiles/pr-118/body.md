Those implications are useful to capture simpler "an extension specifies a feature" principle.

For instance, if the `Za64rs` extension is implemented (at most 64-byte reservation set), the feature specified by the `Za128rs` extension is also implemented (at most 128-byte reservation set).
In that case, implying `Za64rs` → `Za128rs` makes feature detection logic simpler.

Despite that requiring the `H` extension to some `Sh*` extensions in the specification seems redundant (because they are mandatory in the profile if `H` is implemented), it will be useful if those extensions are used separately from the RISC-V Profiles.

Note that one of them (`Smstateen` → `Ssstateen`) is implemented in GNU Binutils version 2.40 or later.
