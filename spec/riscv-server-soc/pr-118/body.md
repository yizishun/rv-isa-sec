There is no evidence to add a strict load-acquire semantics here; if the device needs that sync, it should not depend on MSI.

Anyway, we don't need to put this rare semantics here, which prevents further optimization of the MSI transponder design.

Keeping the store-release semantics for MSI is enough.
