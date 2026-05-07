## Summary

- The RV32 constraint for `JVT_BASE_MASK` uses strict `<` which rejects `0xFFFFFFC0` — the correct mask for a fully-writable 26-bit `jvt.BASE` field (bits[31:6])
- Change `<` to `<=` so implementations can declare all BASE bits writable

## Context

Discovered while configuring CV32E40S (OpenHW) for RISC-V ACT4 certification. The RTL defines `CSR_JVT_MASK = 32'hFFFFFFC0` (all 26 BASE bits writable), but UDB config validation rejects it. Using a smaller mask as workaround misrepresents the hardware and causes DUT vs Sail signature mismatches.

## Change

`spec/std/isa/param/JVT_BASE_MASK.yaml` line 26:

```diff
-    MXLEN == 32 -> JVT_BASE_MASK < 0xffff_ffc0;
+    MXLEN == 32 -> JVT_BASE_MASK <= 0xffff_ffc0;
```
