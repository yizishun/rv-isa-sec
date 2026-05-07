MDCFG table must be monotonically incremental. However, there could be some period that MDCFG[m-1].t is greater than MDCFG[m].t, which is improper setting, during MDCFG table programming. To avoid potential security issues, IOPMP can implement special behavior to mitigate improper settings of MDCFG table.

Some reference behaviors for an improper setting are given in the specification, e.g.:
"correct the values to make the table have a proper setting".

This commit implements authomatically MDCFG table fixing if current MDCFG table violates the monotonically incremental rule by:

```c
  For any m, if (MDCFG(m).t < MDCFG(m-1).t):
                 MDCFG(m).t = MDCFG(m-1).t
```

The programmer can check MDCFG table values after programming done.
