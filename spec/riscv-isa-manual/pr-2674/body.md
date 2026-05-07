# Summary of this PR

This PR looks big but is just adopting an updated norm rule schema and terminology changes created to support the Parameters SIG . Mainly implementation-defined behaviors now have upper-case names with just underscores to allow for their parameter name to be the same. Note that this PR also requires an updated commit of the docs-resources repo since it has the schema and tooling that was updated to support Parameters SIG.

Names of norm tags in *.adoc files were intentionally changed in some cases so the ref/* files were updated with the new names. 

Finally, a small bug in Rafael's call a script without executable permissions from the Makefile was fixed. Bug only affects when build-norm-rules Makefile target is used.

Fixes issue #2669 

# Normative Rule Name Changes Summary

## Changes by File

| File | Number of Names Changed |
|------|------------------------|
| counters.yaml | 1 |
| f-st-ext.yaml | 1 |
| hypervisor.yaml | 9 |
| machine.yaml | 171 |
| priv-csrs.yaml | 1 |
| smctr.yaml | 1 |
| supervisor.yaml | 3 |
| v-st-ext.yaml | 15 |
| zc.yaml | 1 |
| zihintntl.yaml | 1 |
| zilsd.yaml | 1 |

**Grand Total: 205 normative rule names uppercased across 11 files**

## Key Transformations Applied

- All lowercase letters → UPPERCASE
- Hyphens (-) → Underscores (_)
- Pattern: `[a-z0-9_-]+` → `[A-Z0-9_]+`

## Examples

- `misa_csr_implemented` → `MISA_CSR_IMPLEMENTED`
- `satp-asidlen` → `SATP_ASIDLEN`
- `critical-error` → `CRITICAL_ERROR`
- `vector_ls_vstart` → `VECTOR_LS_VSTART`
- `hpm_platform_specific_impl` → `HPM_PLATFORM_SPECIFIC_IMPL`

## Additional Changes in machine.yaml

- Converted 61 `kind: parameter` entries to `impl-def-behavior: true`
- Removed `instances` field from pmp_granularity_param rule

## Validation

All changes have been validated with `make build-norm-rules` and conform to the required pattern `^[A-Z][A-Z0-9_]+$`.
## Detailed Name Changes

| File | Old Name | New Name |
|------|----------|----------|
| counters.yaml | `hpm_platform_specific_impl` | `HPM_PLATFORM_SPECIFIC_IMPL` |
| f-st-ext.yaml | `flen` | `FLEN` |
| hypervisor.yaml | `geilen` | `GEILEN` |
| hypervisor.yaml | `hgatp-vmid` | `HGATP_VMID` |
| hypervisor.yaml | `hsxlen` | `HSXLEN` |
| hypervisor.yaml | `htval_trapval` | `HTVAL_TRAPVAL` |
| hypervisor.yaml | `mtval2_trapval` | `MTVAL2_TRAPVAL` |
| hypervisor.yaml | `vsstatus-ube` | `VSSTATUS_UBE` |
| hypervisor.yaml | `vsxl_ro` | `VSXL_RO` |
| hypervisor.yaml | `vsxlen` | `VSXLEN` |
| hypervisor.yaml | `vtw_virtinstr` | `VTW_VIRTINSTR` |
| machine.yaml | `arch_id` | `ARCH_ID` |
| machine.yaml | `critical-error` | `CRITICAL_ERROR` |
| machine.yaml | `hart_id` | `HART_ID` |
| machine.yaml | `imp_id` | `IMP_ID` |
| machine.yaml | `mcause_rst_alias_ok` | `MCAUSE_RST_ALIAS_OK` |
| machine.yaml | `mcause_rst_val` | `MCAUSE_RST_VAL` |
| machine.yaml | `mconfigptr_zero` | `MCONFIGPTR_ZERO` |
| machine.yaml | `mcounteren_cy_rdonly0` | `MCOUNTEREN_CY_RDONLY0` |
| machine.yaml | `mcounteren_hpm10_rdonly0` | `MCOUNTEREN_HPM10_RDONLY0` |
| machine.yaml | `mcounteren_hpm11_rdonly0` | `MCOUNTEREN_HPM11_RDONLY0` |
| machine.yaml | `mcounteren_hpm12_rdonly0` | `MCOUNTEREN_HPM12_RDONLY0` |
| machine.yaml | `mcounteren_hpm13_rdonly0` | `MCOUNTEREN_HPM13_RDONLY0` |
| machine.yaml | `mcounteren_hpm14_rdonly0` | `MCOUNTEREN_HPM14_RDONLY0` |
| machine.yaml | `mcounteren_hpm15_rdonly0` | `MCOUNTEREN_HPM15_RDONLY0` |
| machine.yaml | `mcounteren_hpm16_rdonly0` | `MCOUNTEREN_HPM16_RDONLY0` |
| machine.yaml | `mcounteren_hpm17_rdonly0` | `MCOUNTEREN_HPM17_RDONLY0` |
| machine.yaml | `mcounteren_hpm18_rdonly0` | `MCOUNTEREN_HPM18_RDONLY0` |
| machine.yaml | `mcounteren_hpm19_rdonly0` | `MCOUNTEREN_HPM19_RDONLY0` |
| machine.yaml | `mcounteren_hpm20_rdonly0` | `MCOUNTEREN_HPM20_RDONLY0` |
| machine.yaml | `mcounteren_hpm21_rdonly0` | `MCOUNTEREN_HPM21_RDONLY0` |
| machine.yaml | `mcounteren_hpm22_rdonly0` | `MCOUNTEREN_HPM22_RDONLY0` |
| machine.yaml | `mcounteren_hpm23_rdonly0` | `MCOUNTEREN_HPM23_RDONLY0` |
| machine.yaml | `mcounteren_hpm24_rdonly0` | `MCOUNTEREN_HPM24_RDONLY0` |
| machine.yaml | `mcounteren_hpm25_rdonly0` | `MCOUNTEREN_HPM25_RDONLY0` |
| machine.yaml | `mcounteren_hpm26_rdonly0` | `MCOUNTEREN_HPM26_RDONLY0` |
| machine.yaml | `mcounteren_hpm27_rdonly0` | `MCOUNTEREN_HPM27_RDONLY0` |
| machine.yaml | `mcounteren_hpm28_rdonly0` | `MCOUNTEREN_HPM28_RDONLY0` |
| machine.yaml | `mcounteren_hpm29_rdonly0` | `MCOUNTEREN_HPM29_RDONLY0` |
| machine.yaml | `mcounteren_hpm30_rdonly0` | `MCOUNTEREN_HPM30_RDONLY0` |
| machine.yaml | `mcounteren_hpm31_rdonly0` | `MCOUNTEREN_HPM31_RDONLY0` |
| machine.yaml | `mcounteren_hpm3_rdonly0` | `MCOUNTEREN_HPM3_RDONLY0` |
| machine.yaml | `mcounteren_hpm4_rdonly0` | `MCOUNTEREN_HPM4_RDONLY0` |
| machine.yaml | `mcounteren_hpm5_rdonly0` | `MCOUNTEREN_HPM5_RDONLY0` |
| machine.yaml | `mcounteren_hpm6_rdonly0` | `MCOUNTEREN_HPM6_RDONLY0` |
| machine.yaml | `mcounteren_hpm7_rdonly0` | `MCOUNTEREN_HPM7_RDONLY0` |
| machine.yaml | `mcounteren_hpm8_rdonly0` | `MCOUNTEREN_HPM8_RDONLY0` |
| machine.yaml | `mcounteren_hpm9_rdonly0` | `MCOUNTEREN_HPM9_RDONLY0` |
| machine.yaml | `mcounteren_ir_rdonly0` | `MCOUNTEREN_IR_RDONLY0` |
| machine.yaml | `mcounteren_tm_rdonly0` | `MCOUNTEREN_TM_RDONLY0` |
| machine.yaml | `mcycle_shared` | `MCYCLE_SHARED` |
| machine.yaml | `menvcfg_fiom_rdonly0_ok` | `MENVCFG_FIOM_RDONLY0_OK` |
| machine.yaml | `mepc_inv_addr_conv` | `MEPC_INV_ADDR_CONV` |
| machine.yaml | `mhpmcounter10_rdonly0` | `MHPMCOUNTER10_RDONLY0` |
| machine.yaml | `mhpmcounter10_sz` | `MHPMCOUNTER10_SZ` |
| machine.yaml | `mhpmcounter11_rdonly0` | `MHPMCOUNTER11_RDONLY0` |
| machine.yaml | `mhpmcounter11_sz` | `MHPMCOUNTER11_SZ` |
| machine.yaml | `mhpmcounter12_rdonly0` | `MHPMCOUNTER12_RDONLY0` |
| machine.yaml | `mhpmcounter12_sz` | `MHPMCOUNTER12_SZ` |
| machine.yaml | `mhpmcounter13_rdonly0` | `MHPMCOUNTER13_RDONLY0` |
| machine.yaml | `mhpmcounter13_sz` | `MHPMCOUNTER13_SZ` |
| machine.yaml | `mhpmcounter14_rdonly0` | `MHPMCOUNTER14_RDONLY0` |
| machine.yaml | `mhpmcounter14_sz` | `MHPMCOUNTER14_SZ` |
| machine.yaml | `mhpmcounter15_rdonly0` | `MHPMCOUNTER15_RDONLY0` |
| machine.yaml | `mhpmcounter15_sz` | `MHPMCOUNTER15_SZ` |
| machine.yaml | `mhpmcounter16_rdonly0` | `MHPMCOUNTER16_RDONLY0` |
| machine.yaml | `mhpmcounter16_sz` | `MHPMCOUNTER16_SZ` |
| machine.yaml | `mhpmcounter17_rdonly0` | `MHPMCOUNTER17_RDONLY0` |
| machine.yaml | `mhpmcounter17_sz` | `MHPMCOUNTER17_SZ` |
| machine.yaml | `mhpmcounter18_rdonly0` | `MHPMCOUNTER18_RDONLY0` |
| machine.yaml | `mhpmcounter18_sz` | `MHPMCOUNTER18_SZ` |
| machine.yaml | `mhpmcounter19_rdonly0` | `MHPMCOUNTER19_RDONLY0` |
| machine.yaml | `mhpmcounter19_sz` | `MHPMCOUNTER19_SZ` |
| machine.yaml | `mhpmcounter20_rdonly0` | `MHPMCOUNTER20_RDONLY0` |
| machine.yaml | `mhpmcounter20_sz` | `MHPMCOUNTER20_SZ` |
| machine.yaml | `mhpmcounter21_rdonly0` | `MHPMCOUNTER21_RDONLY0` |
| machine.yaml | `mhpmcounter21_sz` | `MHPMCOUNTER21_SZ` |
| machine.yaml | `mhpmcounter22_rdonly0` | `MHPMCOUNTER22_RDONLY0` |
| machine.yaml | `mhpmcounter22_sz` | `MHPMCOUNTER22_SZ` |
| machine.yaml | `mhpmcounter23_rdonly0` | `MHPMCOUNTER23_RDONLY0` |
| machine.yaml | `mhpmcounter23_sz` | `MHPMCOUNTER23_SZ` |
| machine.yaml | `mhpmcounter24_rdonly0` | `MHPMCOUNTER24_RDONLY0` |
| machine.yaml | `mhpmcounter24_sz` | `MHPMCOUNTER24_SZ` |
| machine.yaml | `mhpmcounter25_rdonly0` | `MHPMCOUNTER25_RDONLY0` |
| machine.yaml | `mhpmcounter25_sz` | `MHPMCOUNTER25_SZ` |
| machine.yaml | `mhpmcounter26_rdonly0` | `MHPMCOUNTER26_RDONLY0` |
| machine.yaml | `mhpmcounter26_sz` | `MHPMCOUNTER26_SZ` |
| machine.yaml | `mhpmcounter27_rdonly0` | `MHPMCOUNTER27_RDONLY0` |
| machine.yaml | `mhpmcounter27_sz` | `MHPMCOUNTER27_SZ` |
| machine.yaml | `mhpmcounter28_rdonly0` | `MHPMCOUNTER28_RDONLY0` |
| machine.yaml | `mhpmcounter28_sz` | `MHPMCOUNTER28_SZ` |
| machine.yaml | `mhpmcounter29_rdonly0` | `MHPMCOUNTER29_RDONLY0` |
| machine.yaml | `mhpmcounter29_sz` | `MHPMCOUNTER29_SZ` |
| machine.yaml | `mhpmcounter30_rdonly0` | `MHPMCOUNTER30_RDONLY0` |
| machine.yaml | `mhpmcounter30_sz` | `MHPMCOUNTER30_SZ` |
| machine.yaml | `mhpmcounter31_rdonly0` | `MHPMCOUNTER31_RDONLY0` |
| machine.yaml | `mhpmcounter31_sz` | `MHPMCOUNTER31_SZ` |
| machine.yaml | `mhpmcounter3_rdonly0` | `MHPMCOUNTER3_RDONLY0` |
| machine.yaml | `mhpmcounter3_sz` | `MHPMCOUNTER3_SZ` |
| machine.yaml | `mhpmcounter4_rdonly0` | `MHPMCOUNTER4_RDONLY0` |
| machine.yaml | `mhpmcounter4_sz` | `MHPMCOUNTER4_SZ` |
| machine.yaml | `mhpmcounter5_rdonly0` | `MHPMCOUNTER5_RDONLY0` |
| machine.yaml | `mhpmcounter5_sz` | `MHPMCOUNTER5_SZ` |
| machine.yaml | `mhpmcounter6_rdonly0` | `MHPMCOUNTER6_RDONLY0` |
| machine.yaml | `mhpmcounter6_sz` | `MHPMCOUNTER6_SZ` |
| machine.yaml | `mhpmcounter7_rdonly0` | `MHPMCOUNTER7_RDONLY0` |
| machine.yaml | `mhpmcounter7_sz` | `MHPMCOUNTER7_SZ` |
| machine.yaml | `mhpmcounter8_rdonly0` | `MHPMCOUNTER8_RDONLY0` |
| machine.yaml | `mhpmcounter8_sz` | `MHPMCOUNTER8_SZ` |
| machine.yaml | `mhpmcounter9_rdonly0` | `MHPMCOUNTER9_RDONLY0` |
| machine.yaml | `mhpmcounter9_sz` | `MHPMCOUNTER9_SZ` |
| machine.yaml | `mhpmevent10_rdonly0` | `MHPMEVENT10_RDONLY0` |
| machine.yaml | `mhpmevent11_rdonly0` | `MHPMEVENT11_RDONLY0` |
| machine.yaml | `mhpmevent12_rdonly0` | `MHPMEVENT12_RDONLY0` |
| machine.yaml | `mhpmevent13_rdonly0` | `MHPMEVENT13_RDONLY0` |
| machine.yaml | `mhpmevent14_rdonly0` | `MHPMEVENT14_RDONLY0` |
| machine.yaml | `mhpmevent15_rdonly0` | `MHPMEVENT15_RDONLY0` |
| machine.yaml | `mhpmevent16_rdonly0` | `MHPMEVENT16_RDONLY0` |
| machine.yaml | `mhpmevent17_rdonly0` | `MHPMEVENT17_RDONLY0` |
| machine.yaml | `mhpmevent18_rdonly0` | `MHPMEVENT18_RDONLY0` |
| machine.yaml | `mhpmevent19_rdonly0` | `MHPMEVENT19_RDONLY0` |
| machine.yaml | `mhpmevent20_rdonly0` | `MHPMEVENT20_RDONLY0` |
| machine.yaml | `mhpmevent21_rdonly0` | `MHPMEVENT21_RDONLY0` |
| machine.yaml | `mhpmevent22_rdonly0` | `MHPMEVENT22_RDONLY0` |
| machine.yaml | `mhpmevent23_rdonly0` | `MHPMEVENT23_RDONLY0` |
| machine.yaml | `mhpmevent24_rdonly0` | `MHPMEVENT24_RDONLY0` |
| machine.yaml | `mhpmevent25_rdonly0` | `MHPMEVENT25_RDONLY0` |
| machine.yaml | `mhpmevent26_rdonly0` | `MHPMEVENT26_RDONLY0` |
| machine.yaml | `mhpmevent27_rdonly0` | `MHPMEVENT27_RDONLY0` |
| machine.yaml | `mhpmevent28_rdonly0` | `MHPMEVENT28_RDONLY0` |
| machine.yaml | `mhpmevent29_rdonly0` | `MHPMEVENT29_RDONLY0` |
| machine.yaml | `mhpmevent30_rdonly0` | `MHPMEVENT30_RDONLY0` |
| machine.yaml | `mhpmevent31_rdonly0` | `MHPMEVENT31_RDONLY0` |
| machine.yaml | `mhpmevent3_rdonly0` | `MHPMEVENT3_RDONLY0` |
| machine.yaml | `mhpmevent4_rdonly0` | `MHPMEVENT4_RDONLY0` |
| machine.yaml | `mhpmevent5_rdonly0` | `MHPMEVENT5_RDONLY0` |
| machine.yaml | `mhpmevent6_rdonly0` | `MHPMEVENT6_RDONLY0` |
| machine.yaml | `mhpmevent7_rdonly0` | `MHPMEVENT7_RDONLY0` |
| machine.yaml | `mhpmevent8_rdonly0` | `MHPMEVENT8_RDONLY0` |
| machine.yaml | `mhpmevent9_rdonly0` | `MHPMEVENT9_RDONLY0` |
| machine.yaml | `mideleg_rd1_lower_level` | `MIDELEG_RD1_LOWER_LEVEL` |
| machine.yaml | `mip_bits_wr_or_rdonly` | `MIP_BITS_WR_OR_RDONLY` |
| machine.yaml | `misa_csr_implemented` | `MISA_CSR_IMPLEMENTED` |
| machine.yaml | `misa_extensions_writable_bits` | `MISA_EXTENSIONS_WRITABLE_BITS` |
| machine.yaml | `mseccfg_mml_mmwp_rlb_rst` | `MSECCFG_MML_MMWP_RLB_RST` |
| machine.yaml | `mseccfg_useed_sseed_rst` | `MSECCFG_USEED_SSEED_RST` |
| machine.yaml | `msip_update_max_time` | `MSIP_UPDATE_MAX_TIME` |
| machine.yaml | `mstatus_fs_imprecise` | `MSTATUS_FS_IMPRECISE` |
| machine.yaml | `mstatus_fs_no_change_dirty` | `MSTATUS_FS_NO_CHANGE_DIRTY` |
| machine.yaml | `mstatus_fs_no_dirty_track` | `MSTATUS_FS_NO_DIRTY_TRACK` |
| machine.yaml | `mstatus_fs_rdonly0_s-no-f` | `MSTATUS_FS_RDONLY0_S_NO_F` |
| machine.yaml | `mstatus_sbe_rocopy` | `MSTATUS_SBE_ROCOPY` |
| machine.yaml | `mstatus_sxl_rdonly_mxlen64` | `MSTATUS_SXL_RDONLY_MXLEN64` |
| machine.yaml | `mstatus_tw_always_illegal` | `MSTATUS_TW_ALWAYS_ILLEGAL` |
| machine.yaml | `mstatus_tw_time_limit` | `MSTATUS_TW_TIME_LIMIT` |
| machine.yaml | `mstatus_ube_rocopy` | `MSTATUS_UBE_ROCOPY` |
| machine.yaml | `mstatus_uxl_legal_vals_smode` | `MSTATUS_UXL_LEGAL_VALS_SMODE` |
| machine.yaml | `mstatus_vs_imprecise` | `MSTATUS_VS_IMPRECISE` |
| machine.yaml | `mstatus_vs_no_change_dirty` | `MSTATUS_VS_NO_CHANGE_DIRTY` |
| machine.yaml | `mstatus_vs_rdonly0_s-no-v` | `MSTATUS_VS_RDONLY0_S_NO_V` |
| machine.yaml | `mtime_tick_period` | `MTIME_TICK_PERIOD` |
| machine.yaml | `mtval_inv_addr_conv` | `MTVAL_INV_ADDR_CONV` |
| machine.yaml | `mtval_per_exc_behavior` | `MTVAL_PER_EXC_BEHAVIOR` |
| machine.yaml | `mtval_rdonly0` | `MTVAL_RDONLY0` |
| machine.yaml | `mtval_varlen_wr` | `MTVAL_VARLEN_WR` |
| machine.yaml | `mtvec_base_align_func_mode` | `MTVEC_BASE_ALIGN_FUNC_MODE` |
| machine.yaml | `mtvec_rdonly` | `MTVEC_RDONLY` |
| machine.yaml | `mxlen` | `MXLEN` |
| machine.yaml | `nmi_mcause_val` | `NMI_MCAUSE_VAL` |
| machine.yaml | `pma_cache_mm_all_atomics` | `PMA_CACHE_MM_ALL_ATOMICS` |
| machine.yaml | `pma_idp_implicit_sz` | `PMA_IDP_IMPLICIT_SZ` |
| machine.yaml | `pma_mag_exc` | `PMA_MAG_EXC` |
| machine.yaml | `pma_mag_op_ldst` | `PMA_MAG_OP_LDST` |
| machine.yaml | `pma_mm_ifetch` | `PMA_MM_IFETCH` |
| machine.yaml | `pma_mo_dyn` | `PMA_MO_DYN` |
| machine.yaml | `pmp_A_L_rst` | `PMP_A_L_RST` |
| machine.yaml | `pmp_granularity_param` | `PMP_GRANULARITY_PARAM` |
| machine.yaml | `vendor_id_bank` | `VENDOR_ID_BANK` |
| machine.yaml | `vendor_id_offset` | `VENDOR_ID_OFFSET` |
| machine.yaml | `wfi_opt_U-mode` | `WFI_OPT_U_MODE` |
| machine.yaml | `wfi_resume_reason` | `WFI_RESUME_REASON` |
| machine.yaml | `xlen_reduction_hint_op` | `XLEN_REDUCTION_HINT_OP` |
| priv-csrs.yaml | `Zicsr_wlrl_exception` | `ZICSR_WLRL_EXCEPTION` |
| smctr.yaml | `ctrdata_cc_supported` | `CTRDATA_CC_SUPPORTED` |
| supervisor.yaml | `hint_sxlen` | `HINT_SXLEN` |
| supervisor.yaml | `satp-asidlen` | `SATP_ASIDLEN` |
| supervisor.yaml | `satp-mode_roz_sfence_illegal` | `SATP_MODE_ROZ_SFENCE_ILLEGAL` |
| v-st-ext.yaml | `hw_mstatus_vs_dirty_update` | `HW_MSTATUS_VS_DIRTY_UPDATE` |
| v-st-ext.yaml | `mstatus_vs_exists` | `MSTATUS_VS_EXISTS` |
| v-st-ext.yaml | `mutable_misa_v` | `MUTABLE_MISA_V` |
| v-st-ext.yaml | `reserved_vill_set` | `RESERVED_VILL_SET` |
| v-st-ext.yaml | `vector_ff_past_trap` | `VECTOR_FF_PAST_TRAP` |
| v-st-ext.yaml | `vector_ff_seg_partial_access` | `VECTOR_FF_SEG_PARTIAL_ACCESS` |
| v-st-ext.yaml | `vector_ls_constant-stride_x0` | `VECTOR_LS_CONSTANT_STRIDE_X0` |
| v-st-ext.yaml | `vector_ls_missaligned_exception` | `VECTOR_LS_MISSALIGNED_EXCEPTION` |
| v-st-ext.yaml | `vector_ls_overwrite_past_trap` | `VECTOR_LS_OVERWRITE_PAST_TRAP` |
| v-st-ext.yaml | `vector_ls_seg_ff_overload` | `VECTOR_LS_SEG_FF_OVERLOAD` |
| v-st-ext.yaml | `vector_ls_seg_partial_access` | `VECTOR_LS_SEG_PARTIAL_ACCESS` |
| v-st-ext.yaml | `vector_ls_vstart` | `VECTOR_LS_VSTART` |
| v-st-ext.yaml | `vector_ls_wholereg_missaligned_exception` | `VECTOR_LS_WHOLEREG_MISSALIGNED_EXCEPTION` |
| v-st-ext.yaml | `vill_implicit_encoding` | `VILL_IMPLICIT_ENCODING` |
| v-st-ext.yaml | `vsstatus_vs_exists` | `VSSTATUS_VS_EXISTS` |
| zc.yaml | `interrupts_allowed_in_pushpop` | `INTERRUPTS_ALLOWED_IN_PUSHPOP` |
| zihintntl.yaml | `NTL-trap_behavior` | `NTL_TRAP_BEHAVIOR` |
| zilsd.yaml | `Zilsd_align8_atomic` | `ZILSD_ALIGN8_ATOMIC` |

**Total: 205 name changes**

# Changing Hypens to Underscores in Normatively Tagged Text

Changed all hyphens to underscores in normative rule tag names to match the updated rule names.

## Changes in YAML Files

### hypervisor.yaml
- `norm:hgatp-vmid_param` → `norm:hgatp_vmid_param`
- `norm:hgatp-vmid_lsbs` → `norm:hgatp_vmid_lsbs`
- `norm:vsstatus-ube_param` → `norm:vsstatus_ube_param`
- `norm:satp-asidlen` → `norm:satp_asidlen` (in vsatp-asidlen)

### v-st-ext.yaml
- `norm:vector_ls_constant-stride_x0` → `norm:vector_ls_constant_stride_x0`

### zihintntl.yaml
- `norm:NTL-trap_behavior` → `norm:NTL_trap_behavior`

### machine.yaml
- `norm:mstatus_fs_rdonly0_s-no-f` → `norm:mstatus_fs_rdonly0_s_no_f`
- `norm:mstatus_vs_rdonly0_s-no-v` → `norm:mstatus_vs_rdonly0_s_no_v`
- `norm:wfi_opt_U-mode` → `norm:wfi_opt_U_mode`
- `norm:critical-error` → `norm:critical_error`

### supervisor.yaml
- `norm:satp-asidlen` → `norm:satp_asidlen`
- `norm:satp-mode_roz_sfence_illegal_param` → `norm:satp_mode_roz_sfence_illegal_param`

## Changes in AsciiDoc Files

### hypervisor.adoc
- `norm:hgatp-vmid_param` → `norm:hgatp_vmid_param`
- `norm:hgatp-vmid_lsbs` → `norm:hgatp_vmid_lsbs`
- `norm:vsstatus-ube_param` → `norm:vsstatus_ube_param`

### v-st-ext.adoc
- `norm:vector_ls_constant-stride_x0` → `norm:vector_ls_constant_stride_x0`

### zihintntl.adoc
- `norm:NTL-trap_behavior` → `norm:NTL_trap_behavior`

### machine.adoc
- `norm:mstatus_fs_rdonly0_s-no-f` → `norm:mstatus_fs_rdonly0_s_no_f`
- `norm:mstatus_vs_rdonly0_s-no-v` → `norm:mstatus_vs_rdonly0_s_no_v`
- `norm:wfi_opt_U-mode` → `norm:wfi_opt_U_mode`
- `norm:critical-error` → `norm:critical_error`

### supervisor.adoc
- `norm:satp-asidlen` → `norm:satp_asidlen`
- `norm:satp-mode_roz_sfence_illegal_param` → `norm:satp_mode_roz_sfence_illegal_param`

## Summary

Total: 11 unique tag names updated across 10 files (5 YAML + 5 AsciiDoc)

These changes ensure consistency between the normative rule names (which were uppercased with hyphens converted to underscores) and their corresponding tag identifiers in both the YAML definition files and the AsciiDoc documentation files.

# Normative Tags with _param Suffix Removed

During the normative rule refactoring to align with Parameter SIG requirements, the `_param` suffix was removed from normative tags associated with implementation-defined behaviors. This document lists all tags that had their `_param` suffix removed.

## Summary

**Total: 35 normative tags had `_param` suffix removed**

## Changes by File

### d-st-ext.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:flen_param` | `norm:flen` |

### f-st-ext.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:flen_param` | `norm:flen` |

### hypervisor.yaml (9 tags)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:geilen_param` | `norm:geilen` |
| `norm:hgatp-vmid_param` | `norm:hgatp_vmid` |
| `norm:hsxlen_param` | `norm:hsxlen` |
| `norm:htval_trapval_param` | `norm:htval_trapval` |
| `norm:mtval2_trapval_param` | `norm:mtval2_trapval` |
| `norm:vsstatus-ube_param` | `norm:vsstatus_ube` |
| `norm:vsxl_ro_param` | `norm:vsxl_ro` |
| `norm:vsxlen_param` | `norm:vsxlen` |
| `norm:vtw_virtinstr_param` | `norm:vtw_virtinstr` |

### machine.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:pmp_granularity_param` | `norm:pmp_granularity` |

### priv-csrs.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:Zicsr_wlrl_exception_param` | `norm:Zicsr_wlrl_exception` |

### q-st-ext.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:flen_param` | `norm:flen` |

### smctr.yaml (2 tags)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:ctrdata_cc_supported_param` | `norm:ctrdata_cc_supported` |
| `norm:sctrdepth-depth_param` | `norm:sctrdepth-depth` |

### supervisor.yaml (2 tags)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:hint_sxlen_param` | `norm:hint_sxlen` |
| `norm:satp-mode_roz_sfence_illegal_param` | `norm:satp_mode_roz_sfence_illegal` |

### v-st-ext.yaml (16 tags)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:elen_param` | `norm:elen` |
| `norm:hw_mstatus_vs_dirty_update_param` | `norm:hw_mstatus_vs_dirty_update` |
| `norm:mstatus_vs_exists_param` | `norm:mstatus_vs_exists` |
| `norm:mutable_misa_v_param` | `norm:mutable_misa_v` |
| `norm:reserved_vill_set_param` | `norm:reserved_vill_set` |
| `norm:vector_ff_past_trap_param` | `norm:vector_ff_past_trap` |
| `norm:vector_ff_seg_partial_access_param` | `norm:vector_ff_seg_partial_access` |
| `norm:vector_ls_missaligned_exception_param` | `norm:vector_ls_missaligned_exception` |
| `norm:vector_ls_overwrite_past_trap_param` | `norm:vector_ls_overwrite_past_trap` |
| `norm:vector_ls_seg_ff_overload_param` | `norm:vector_ls_seg_ff_overload` |
| `norm:vector_ls_seg_partial_access_param` | `norm:vector_ls_seg_partial_access` |
| `norm:vector_ls_vstart_param` | `norm:vector_ls_vstart` |
| `norm:vector_ls_wholereg_missaligned_exception_param` | `norm:vector_ls_wholereg_missaligned_exception` |
| `norm:vill_implicit_encoding_param` | `norm:vill_implicit_encoding` |
| `norm:vlen_param` | `norm:vlen` |
| `norm:vsstatus_vs_exists_param` | `norm:vsstatus_vs_exists` |

### zc.yaml (1 tag)

| Old Tag Name | New Tag Name |
|--------------|--------------|
| `norm:interrupts_allowed_in_pushpop_param` | `norm:interrupts_allowed_in_pushpop` |

## Notes

- These tags were updated as part of the implementation-defined behavior standardization
- In addition to removing the `_param` suffix, hyphens in tag names were also converted to underscores where applicable
- Tags that previously appeared in multiple rule definitions (e.g., `flen_param` in d-st-ext.yaml, f-st-ext.yaml, and q-st-ext.yaml) had the `_param` suffix removed consistently across all occurrences

# Normative Tag Name Updates (Hyphens to Underscores)

## Summary
Updated all normative tag names to use underscores instead of hyphens where the corresponding normative rule names had hyphens converted to underscores during the field-type property changes.

## Tag Changes in YAML Files

### hypervisor.yaml (6 tags)
- `norm:hstatus-vsxl_64` → `norm:hstatus_vsxl_64`
- `norm:hstatus-vgein_op` → `norm:hstatus_vgein_op`
- `norm:hstatus-vsbe_op` → `norm:hstatus_vsbe_op`
- `norm:hgatp-mode_warl` → `norm:hgatp_mode_warl`
- `norm:vsstatus-uxl_op` → `norm:vsstatus_uxl_op`
- `norm:henvcfg-cbie` → `norm:henvcfg_cbie` (actually in hypervisor, not in hypervisor.yaml)

### smctr.yaml (2 tags + compound tags)
- `norm:sctrdepth-depth_op0` → `norm:sctrdepth_depth_op0`
- `norm:sctrdepth-depth_op1` → `norm:sctrdepth_depth_op1`
- `norm:sctrdepth-depth` → `norm:sctrdepth_depth`
- `norm:sctrstatus-wrptr` → `norm:sctrstatus_wrptr`

### supervisor.yaml (5 tags + compound tags)
- `norm:sstatus-uxl_sz` → `norm:sstatus_uxl_sz`
- `norm:sstatus-ube` → `norm:sstatus_ube`
- `norm:sstatus-ube_implicit` → `norm:sstatus_ube_implicit`
- `norm:sstatus-sdt` → `norm:sstatus_sdt`
- `norm:sstatus-sdt_sstatus-sie_overwrite` → `norm:sstatus_sdt_sstatus_sie_overwrite`
- `norm:sstatus-sdt_trap` → `norm:sstatus_sdt_trap`
- `norm:sstatus-sdt_sret` → `norm:sstatus_sdt_sret`
- `norm:scause-exception_code_acc` → `norm:scause_exception_code_acc`
- `norm:senvcfg-cbie` → `norm:senvcfg_cbie`

## Tag Changes in AsciiDoc Files

### supervisor.adoc (8 tags)
- `[[norm:sstatus-uxl_sz]]` → `[[norm:sstatus_uxl_sz]]`
- `[[norm:sstatus-ube]]` → `[[norm:sstatus_ube]]`
- `[[norm:sstatus-ube_implicit]]` → `[[norm:sstatus_ube_implicit]]`
- `[[norm:sstatus-sdt]]` → `[[norm:sstatus_sdt]]`
- `[[norm:sstatus-sdt_sstatus-sie_overwrite]]` → `[[norm:sstatus_sdt_sstatus_sie_overwrite]]`
- `[[norm:sstatus-sdt_trap]]` → `[[norm:sstatus_sdt_trap]]`
- `[[norm:sstatus-sdt_sret]]` → `[[norm:sstatus_sdt_sret]]`
- `[#norm:scause-exception_code_acc]` → `[#norm:scause_exception_code_acc]`
- `[[norm:senvcfg-cbie]]` → `[[norm:senvcfg_cbie]]`

### hypervisor.adoc (6 tags)
- `[#norm:hstatus-vsxl_64]` → `[#norm:hstatus_vsxl_64]`
- `[[norm:hstatus-vgein_op]]` → `[[norm:hstatus_vgein_op]]`
- `[[norm:hstatus-vsbe_op]]` → `[[norm:hstatus_vsbe_op]]`
- `[[norm:henvcfg-cbie]]` → `[[norm:henvcfg_cbie]]`
- `[[norm:hgatp-mode_warl]]` → `[[norm:hgatp_mode_warl]]`
- `[[norm:vsstatus-uxl_op]]` → `[[norm:vsstatus_uxl_op]]`

### smctr.adoc (2 tags)
- `[#norm:sctrdepth-depth_op0]` → `[#norm:sctrdepth_depth_op0]`
- `[#norm:sctrstatus-wrptr]` → `[#norm:sctrstatus_wrptr]`

## Rationale

These tag name updates ensure consistency between:
1. The normative rule names (which were uppercased and had hyphens converted to underscores)
2. The tag names (now using underscores to match the rule names)

This maintains the naming convention where tags use lowercase versions of the rule names with underscores instead of hyphens.

## Total Changes
- **YAML files modified:** 3 (hypervisor.yaml, smctr.yaml, supervisor.yaml)
- **AsciiDoc files modified:** 3 (hypervisor.adoc, smctr.adoc, supervisor.adoc)
- **Total tag updates:** 26 (including compound tags)




