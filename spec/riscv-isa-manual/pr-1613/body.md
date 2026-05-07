Since [T1](https://github.com/chipsalliance/t1.git) implemented `LMUL=1/8` in `EEW=32` case. we submit this PR for consideration:
making `e8mf8` type to be allowed when `VLEN>=64` and `EEW=32`, the common case of `VLEN` is `VLEN>>EEW`, e.g. `VLEN=64/128/256`, and `EEW=32`.
On the other hand, `e8mf8` doesn't make sense in the architecture design that the pair of (`e8mf8`, `e16mf4`, `e32mf2`) can always be replaced by (`e8mf4`, `e16mf2`, `e32m1`).
However, when  specification allows `SEW_min=4` in the future, `e4mf8` might find its place for some edge AI scenario.

But at least, if we don't change the specification(to disallow `e8mf8` in `EEW=32`), I think we still need to change the reason why `e8mf8` not being allowed in the specification.
