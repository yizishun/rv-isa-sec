### Description
Building the CRD for `RVI20-32` resulted in missing `cycleh` and `instreth` CSRs. These CSRs are defined by the `Zicntr` extension but are restricted to `RV32` only. The existing logic in `Extension#csrs` filtered them out because the `Zicntr` extension alone does not unconditionally imply their existence (it requires `Zicntr` AND `RV32`).

### Changes

*   Modified [tools/ruby-gems/udb/lib/udb/obj/extension.rb](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/tools/ruby-gems/udb/lib/udb/obj/extension.rb:0:0-0:0): Updated the [csrs](cci:1://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/tools/ruby-gems/udb/lib/udb/obj/extension.rb:714:4-719:7) method to explicitly include the XLEN condition (`Condition::Xlen32` or `Condition::Xlen64`) in the requirement check when a CSR is defined only for a specific base. This allows the tool to correctly identify that `Zicntr` implies `cycleh` when targeting a 32-bit architecture.
*   Modified [tools/ruby-gems/udb/lib/udb/resolver.rb](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/tools/ruby-gems/udb/lib/udb/resolver.rb:0:0-0:0): Updated python path resolution to fallback to the system `python3` if the virtual environment path is not found, improving robustness on native environments.

### Related Issues
Closes #1440

cc - @james-ball-qualcomm 
