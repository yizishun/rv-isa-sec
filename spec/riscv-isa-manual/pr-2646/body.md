1. The spec says when `henvcfg.SSE` is 0 then `senvcfg.SSE` is read-only and reads as 0. However it also says when `menvcfg.SSE` is 0, then `henvcfg.SSE` and `senvcfg.SSE` "are read-only zero". That is both very unclear (does it actually change their underlying values?) and inconsistent with `henvcfg.SSE`'s behaviour. I suspect it was a mistake. This changes them both to be "read-only and read as 0".

2. The `ssp` CSR access conditions redundently say either `henvcfg.SSE=0` OR `senvcfg.SSE=0` raise an exception in VU mode. This is redundant becahse `henvcfg.SSE=0` causes `senvcfg.SSE` to read as 0 (see above), so you only need to check `senvcfg.SSE`. Simplifying this case also makes the link between this check and xSSE slightly clearer.

3. Execution of the Zicfiss instructions (including SSAMOSWAP) depends on S-mode being implemented, but access to the CSR doesn't. That isn't very obvious so I made this explicit.

4. The "When S-mode is not implemented then `xSSE` is 0 at both M and U privilege modes." sentence doesn't make any mention of VS or VU modes. I assume they were added later and this sentence was overlooked. In any case `xSSE` is simply 0 in all modes if S-mode is not implemented so it's clearer to say that. Same for the change in the NOTE.

I think the behaviour of `SSE` is still not described clearly (I would expect many implementation bugs here!) but I believe this at least makes it consistent. For reference I believe the simplest description of the behaviour would be this mostly valid Sail:

```
// "Raw" value of xenvcfg.SSE according to the current privilege.
// This is not the same as xSSE from the ISA manual becuase it is 1 for
// machine mode and it is not 0 if supervisor is not implemented.
function zicfiss_xSSE_raw(priv : Privilege) -> bool =
  bool_bits(match priv {
    Machine           => 0b1
    Supervisor        => menvcfg[SSE],
    VirtualSupervisor => read_henvcfg()[SSE], // The `read_` takes care of the "reads as 0".
    User              => read_senvcfg()[SSE],
    VirtualUser       => read_senvcfg()[SSE],
  })

// xSSE from the ISA manual. 0 in machine mode or if S-mode is not implemented.
function zicfiss_xSSE(priv : Privilege) -> bool =
  priv != Machine & extensionEnabled(Ext_S) & zicfiss_xSSE_raw()

// Return true if we should raise a virtual instruction exception instead
// of an illegal instruction.
function zicfiss_exception_is_virtual(priv : Privilege) -> bool =
  menvcfg[SSE] == 0b1 & (priv == VirtualSupervisor | priv == VirtualUser)

function access_ssp(priv : Privilege) = {
    if not(zicfiss_xSSE_raw(priv))
    then return (if zicfiss_exception_is_virtual(priv) then Virtual_Instruction else Illegal_Instruction);
    // ... ok
}

function execute_sspush() = {
    if not(zicfiss_xSSE(cur_privilege)) then return RETIRE_SUCCESS;

    // ... normal execution
}

function execute_ssamoswap() = {
    if not(zicfiss_xSSE(priv))
    then return (if zicfiss_exception_is_virtual(priv) then Virtual_Instruction else Illegal_Instruction);

    // ... normal execuion
}
```
