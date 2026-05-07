The V extension is compatible with Zfinx [1], but the current spec language indicating that it depends on F contradicts that.  This PR resolves that contradiction by allowing V to depend on either F or Zfinx, etc.

The longer-term and more elegant solution is to declare ISAs with Zfinx to be distinct base ISAs. The band-aid in this PR is compatible with the long-term plan.

[1] https://github.com/riscv/riscv-isa-manual/blob/5b8f8d6c04b515e633023deecca49de855f452d2/src/v-st-ext.adoc#L941
