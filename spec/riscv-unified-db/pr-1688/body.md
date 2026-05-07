Mirrors the existing Z3 pattern for `espresso` and `must`.

## What this does

- Prebuilt statically-linked binaries for x64 and arm64, built on AlmaLinux 8 (glibc 2.28) for maximum portability
- Downloaded at `gem install` time via `ext/` extconf.rb hooks — no local build toolchain required by gem users
- Binaries cached under `~/.cache/udb/{tool}/{version}/{cpu}/`
- Absolute paths used at call sites in `logic.rb` via `EspressoPath` / `MustPath` helper modules

## Files changed

**New**
- `lib/udb/ESPRESSO_VERSION`, `MUST_VERSION` — pinned version tags
- `lib/udb/espresso_version.rb`, `must_version.rb` — Ruby version wrappers
- `lib/udb/espresso_path.rb`, `must_path.rb` — binary path helpers
- `ext/udb_espresso_download/extconf.rb` — downloads espresso at gem install
- `ext/udb_must_download/extconf.rb` — downloads must at gem install
- `tools/scripts/build_espresso_with_docker.sh` — Docker build script (AlmaLinux 8, static)
- `tools/scripts/build_must_with_docker.sh` — Docker build script (AlmaLinux 8, static)
- `tools/scripts/README_build_espresso.md`, `README_build_must.md`
- `.github/workflows/release_tools.yml` — `workflow_dispatch` CI to build and publish binaries as GitHub release assets

**Modified**
- `udb.gemspec` — add new `ext/` extensions and version files to `s.files`
- `logic.rb` — use absolute binary paths at `espresso`/`must` call sites
- `.devcontainer/Dockerfile` — remove manual `espresso`/`must` build steps

## Before this is mergeable

The prebuilt binaries need to be published:
1. Create GitHub release tags `espresso-1.0` and `must-17fa9f9` on this repo
2. Run the `release_tools` workflow (or upload binaries manually) to attach `espresso-x64`, `espresso-arm64`, `must-x64`, `must-arm64` as release assets
