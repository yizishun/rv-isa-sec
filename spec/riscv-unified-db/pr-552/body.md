This branch/PR will serve as the proof-of-concept for integrating `riscv-isa-manual` with `riscv-unified-db`

The `riscv-isa-manual` repo was added with:

```bash
git subtree add --prefix arch/prose/isa_manual https://github.com/riscv/riscv-isa-manual.git main
```

It can be subsequently kept up-to-date with:

```bash
git subtree pull --prefix arch/prose/isa_manual https://github.com/riscv/riscv-isa-manual.git main
```

See https://www.atlassian.com/git/tutorials/git-subtree for a tutorial on `git subtree`
