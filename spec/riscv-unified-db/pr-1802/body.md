Introduces the Xqccmi extension for the qc_iu configuration. Xqccmi improves code density by replacing frequently-used 32-bit (and wider) instructions with a single 16-bit lookup instruction, qc.cm.ilut, that fetches and executes the original instruction from a table in memory.

The table (Instruction Lookup Table, ILUT) is an array of entries in memory whose base address is configured by a new CSR, qc.itba. A linker or post-processing tool populates the table with the most-used instruction encodings and replaces each occurrence in the code stream with a 16-bit qc.cm.ilut instruction carrying an 11-bit index (0..2047) into the table. The net effect is that a 32-bit or wider instruction is replaced by a 16-bit one wherever it appears, reducing code size.

Each table entry can hold one or two packed instructions:
- A 32-bit entry holds one 32-bit instruction, or two 16-bit instructions
- A 64-bit entry (double entry) holds combinations up to 64 bits total, including 48-bit Xqci instructions. The number of leading 64-bit entries is configured by a second new CSR, qc.itdec.

When a table entry contains two instructions and the second instruction causes an exception or double trap, bit 0 of mepc (or mnepc) is set to
1. This allows software to identify which instruction within the entry was the source of the fault, enabling precise exception handling and software emulation of absent instructions.

qc.cm.ilut uses the same encoding as c.fld and is therefore mutually exclusive with the Zcd extension.

Key changes:
- Added extension definition: spec/custom/isa/qc_iu/ext/Xqccmi.yaml
- Added instruction: spec/custom/isa/qc_iu/inst/Xqccmi/qc.cm.ilut.yaml
- Added CSR qc.itba (0x800): spec/custom/isa/qc_iu/csr/Xqccmi/qc.itba.yaml
- Added CSR qc.itdec (0x801): spec/custom/isa/qc_iu/csr/Xqccmi/qc.itdec.yaml
- Updated cfgs/qc_iu.yaml to include Xqccmi v0.1.0
