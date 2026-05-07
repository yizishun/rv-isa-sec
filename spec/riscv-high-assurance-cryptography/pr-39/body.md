`aceccdirty` is not strictly better than the off/init/clean/dirty model, so we can have both, as the customary model is better for optimizing HS context switches.
Use the customary model to make ACE more palatable to ARC as well.

Remove ace.enable and ace.disable, since ace.enable serves no clear purpose, and ace.disable is a pure context switch optimization.

Rename ace.disable to ace.reset, because that is closer to what it does, and use an encoding of ace.clean x0, which was originally a functional duplicate of ace.clean c0.

Also mark some surrounding non-normative text as NOTE.
