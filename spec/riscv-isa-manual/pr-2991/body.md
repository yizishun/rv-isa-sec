This PR extracts normative rules for unprivileged extensions that were recently added to the ISA manual following the merger of RISC-V profiles into a unified document.

The following extensions now have properly tagged normative rules:
- **Memory Atomicity & Ordering**: Zama16b, Ziccamoa, Ziccamoc, Zicclsm, Ziccrse
- **Reservation Sets**: Za128rs, Za64rs
- **Cache Blocks**: Zic64b
- **Instruction Fetch**: Ziccif
- **Vector BF16**: Zvfbfmin, Zvfbfwma

Each extension now has:
1. Tagged normative text in the corresponding `.adoc` file
2. A YAML definition file in normative_rule_defs mapping normative rules to their tags

Also fixed #2947 
