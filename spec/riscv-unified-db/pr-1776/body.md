`noneOf` was treated as OR instead of NOR when in an `ExtensionCondition`. This updates the behavior to match ParamCondition.

`TRAP_ON_SFENCE_VMA_WHEN_SATP_MODE_IS_READ_ONLY` is removed from several configs as a result of this because it is no longer defined for those configs.

Fixes #1775
