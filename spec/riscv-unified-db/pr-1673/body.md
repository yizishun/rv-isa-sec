## Summary

Makes Z3 self-contained in the `udb` gem: a new `extconf.rb` hook downloads
the correct pre-built `libz3.so` from a GitHub Release on
`riscv/riscv-unified-db` at `gem install` time (no system `libz3-dev`
needed). `bin/setup` does the same for source-checkout workflows via `gh`.

## Changes

- **`ext/udb_z3_download/extconf.rb`** — downloads `libz3-{x64,arm64}.so`
  at install time using only `Net::HTTP`; caches under `$XDG_CACHE_HOME`.
- **`bin/setup`** — new `setup_z3` function downloads Z3 via `gh` CLI for
  source-checkout users.
- **`bin/chore install gems`** — new subcommand to install newly-added gems
  without a full update cycle.
- **`bin/chore update z3`** — new maintainer subcommand: builds Z3 via
  Docker/AlmaLinux 8, creates a GitHub Release, updates `z3_version.rb`.
  Skips the build if the release already exists; falls back to XDG cache
  when re-releasing the current version.
- **`tools/scripts/build_z3_with_docker.sh`** — builds portable Z3 binaries
  for x64/arm64 inside AlmaLinux 8.
- **CI** — new `create-gems` and `udb-gem-z3` jobs validate gem install +
  Z3 load across ubuntu-24.04 × {x64, arm64} × {almalinux:8, ruby:3-slim}.
- **`udb.gemspec`** — adds `rubyzip`; relaxes pinned `sorbet`/`tapioca`.
- **`doc/HOW-DO-I.adoc`** — updated gem install instructions; new Z3 update
  section.

> **Note:** The large line-count delta is almost entirely deleted Sorbet RBI
> files pruned during the `tapioca` upgrade — not functional changes.
