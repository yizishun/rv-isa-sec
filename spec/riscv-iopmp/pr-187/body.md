Summary:
- The `rrid_transl` takes effect only when IOPMP has been enabled.
- Move `no_w` and `no_x` checks from entry level to top level (`iopmp_validate_access()`).
- Reduce duplicated code to improve maintenance.
- Refine the rule analyzer and matching logics


The biggest change in this PR is to clarify the meaning of "match". From the spec:
An entry qualifies as a matching entry for an incoming transaction if:
- Its region covers any byte of the transaction,
- It is associated with the RRID carried by the transaction; and
- It holds the highest priority among entries that meet the previous criteria.

Technically speaking, **"match"** doesn't mean that the entry also grants transaction permission.
The model should distinguish between the following two cases:
- Entry matches the transaction, and grants transaction permission
- Entry matches the transaction, but doesn't grant transaction permission

We add more `enum` (MATCH & GRANT) to describe the aforementioned cases.
