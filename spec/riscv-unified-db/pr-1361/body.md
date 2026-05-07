Closes #1320

## Problem

The `COUNTINHIBIT_EN.yaml` parameter description contained an incorrect constraint:

> COUNTINHIBIT_EN[3:31] must all be false if `Zihpm` is not implemented.

## Why This Is Wrong

The constraint confuses two unrelated concepts:

| Extension | What It Controls |
|-----------|------------------|
| **Zihpm** | User-mode access to HPM counters (`hpmcounter*` CSRs) |
| **mcountinhibit** | Machine-mode control of whether counters advance |

These are orthogonal. Even if `Zihpm` is not implemented (no user-mode HPM access), machine mode should still be able to inhibit counters via `mcountinhibit`.

## Also Redundant

The constraint was also redundant because the description already states:

> An unimplemented counter cannot be specified, i.e., if HPM_COUNTER_EN[3] is false, it would be illegal to set COUNTINHIBIT_EN[3] to true.

This existing constraint properly ties COUNTINHIBIT_EN to counter existence (HPM_COUNTER_EN), not user-mode visibility (Zihpm).

## The Fix

Simply removed the incorrect line from the description.
