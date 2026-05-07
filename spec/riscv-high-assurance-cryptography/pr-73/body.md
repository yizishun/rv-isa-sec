The traps on access are fully described by permissions, so we don't have to repeat them, and scdirty has to be accessible from M and S.

It is a bit nicer to reserve the remaining bits on RV64, since there are only 32 CR registers.

We don't want to say that any instruction that "may" change the state "must" set Dirty -- we want to allow implementation where only instructions that "do" change the state "must" set Dirty.

This allows to remove an ace.clear rule that clearing unconfigured state doesn't set Dirty, since the operation doesn't have to change the state.

Slight rewording to make the definitions of scrdirty vs vscrdirty as syntactically close as possible.

And comments about the reason for imprecise dirty tracking and the possibility of lazy storing on top of lazy loading.
