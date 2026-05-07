### Description
The LLVM verification script ([test_parsing.py](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/ext/auto-inst/test_parsing.py:0:0-0:0)) was failing or incorrectly skipping hint instructions such as `lpad`. These instructions are defined in UnifiedDB but often do not appear as distinct, top-level entries in the LLVM `riscv.json` dump, or they are implemented as aliases/pseudo-instructions of a parent (e.g., `lpad` is a hint for `auipc`).

Attempting to verify them strictly against their parent's encoding would fail because the hint definition is more specific (e.g., `lpad` requires `rd=0` and `imm=0`, whereas `auipc` allows variable [rd](cci:1://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/tools/ruby-gems/udb/lib/udb/portfolio_design.rb:68:4-68:66) and `imm`).

### Changes
*   Modified [ext/auto-inst/parsing.py](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/ext/auto-inst/parsing.py:0:0-0:0): 
    *   Extracts the [hints](cci:1://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/tools/ruby-gems/udb/lib/udb/obj/instruction.rb:1177:4-1180:7) field from YAML definitions.
    *   Updates [compare_yaml_json_encoding](cci:1://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/ext/auto-inst/parsing.py:147:0-255:22) to support an `allow_refinement` flag. This allows a YAML bit to be fixed (e.g., `0`) even if the LLVM JSON bit is variable, which is the correct behavior for hint/subset instructions.
*   Modified [ext/auto-inst/test_parsing.py](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/ext/auto-inst/test_parsing.py:0:0-0:0):
    *   Builds a [hint_map](cci:1://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/ext/auto-inst/test_parsing.py:64:4-76:23) linking hint instructions to their parents (e.g., `lpad` -> `auipc`) during setup.
    *   Updates the test loop: if an instruction isn't found in the LLVM data, it checks if it is a known hint.
    *   If identified as a hint, it retrieves the parent's encoding from LLVM and verifies against that, enabling the `allow_refinement` check.

### Related Issues
Fixes #1531
