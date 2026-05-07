Fixes #2700

Summary of changes from Copilot:

```
hypervisor.yaml
Added 9 new WARL implementation-defined behavior rules for CSR fields shown in images:

HEDELEG_WARL (tag: norm:hedeleg_img)
HIDELEG_WARL (tag: norm:hideleg_img)
HVIP_WARL (tag: norm:hvip_img)
HIP_WARL (tag: norm:hip_img)
HIE_WARL (tag: norm:hie_img)
HGEIE_WARL (tag: norm:hgeie_img)
VSIP_WARL (tag: norm:vsip_img)
VSIE_WARL (tag: norm:vsie_img)
VSTVEC_MODE_WARL and VSTEC_BASE_WARL (tag: norm:vstvec_img)
Also fixed a typo: changed "norm:hdeleg_acc" to "norm:hedeleg_acc" on line 98.

rnmi.yaml
Converted 3 existing rules to uppercase WARL format with impl-def-behavior flags:

mnepc_warl → MNEPC_WARL (added impl-def-behavior and impl-def-category)
Added new MNCAUSE_WARL (tag: norm:mncause_img)
Added new MNSTATUS_WARL (tag: norm:mnstatus_img)
supervisor.yaml
Reorganized and expanded SIP/SIE interrupt rules:

Added STVEC_MODE_WARL and STVEC_BASE_WARL for stvec (tag: norm:stvec_img)
Replaced generic sip_unimpl_acc/sie_unimpl_acc with 8 specific uppercase rules: SIP_SEI_UNIMPL, SIE_SEI_UNIMPL, SIP_STI_UNIMPL, SIE_STI_UNIMPL, SIP_SSI_UNIMPL, SIE_SSI_UNIMPL, SIP_LCOFIP_UNIMPL, SIE_LCOFIP_UNIMPL
Removed SIP_UNIMPL_WARL and added SIP_WARL and SIE_WARL (tag: norm:sip_sie_warl)
```
