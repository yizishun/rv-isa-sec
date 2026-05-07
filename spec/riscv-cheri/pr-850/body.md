As soon as DDC is used as the authorizing capability, the metadata, incl. the tag bit, of rs1 becomes irrelevant. Only the address is sourced from rs1.

While this behavior seems natural, and the specification certainly gives that impression, I had to convince myself by looking at [CHERI's SAIL model](https://github.com/CTSRD-CHERI/sail-cheri-riscv/blob/bb07488dac8322fc4a653a01d049e16fa05c9065/src/cheri_addr_checks.sail#L182-L189) that my interpretation of the specification is correct. Therefore, it seems sensible to spell it out once in prose.

The following is my attempt to address this, and I hope you find it useful. However, feel free to reject this entirely.
