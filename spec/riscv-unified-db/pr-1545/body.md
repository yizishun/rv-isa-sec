This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [reuse](https://reuse.software/) ([source](https://redirect.github.com/fsfe/reuse-tool)) | `==5.1.1` → `==6.2.0` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/reuse/6.2.0?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/reuse/5.1.1/6.2.0?slim=true) |

---

### Release Notes

<details>
<summary>fsfe/reuse-tool (reuse)</summary>

### [`v6.2.0`](https://redirect.github.com/fsfe/reuse-tool/blob/HEAD/CHANGELOG.md#v620---2025-10-27)

[Compare Source](https://redirect.github.com/fsfe/reuse-tool/compare/v6.1.2...v6.2.0)

##### Added

- Added new file extensions and files:
  - `.arcconfig`, `.arclint`, `.arcunit` ([#&#8203;1123](https://redirect.github.com/fsfe/reuse-tool/issues/1123))
  - `.nvmrc` ([#&#8203;1211](https://redirect.github.com/fsfe/reuse-tool/issues/1211))
  - `.smk`, `Snakefile`, `matplotlibrc` ([#&#8203;1206](https://redirect.github.com/fsfe/reuse-tool/issues/1206))
  - `.yamllint` ([#&#8203;1124](https://redirect.github.com/fsfe/reuse-tool/issues/1124))
  - `uv.lock` ([#&#8203;1156](https://redirect.github.com/fsfe/reuse-tool/issues/1156))
  - `dune`, `dune-project`, `dune-workspace` ([#&#8203;1208](https://redirect.github.com/fsfe/reuse-tool/issues/1208))
- `file-magic` is now supported as an additional module for detecting the
  encoding of files. ([#&#8203;1264](https://redirect.github.com/fsfe/reuse-tool/issues/1264))
- Support deprecated licences for `reuse download`. ([#&#8203;606](https://redirect.github.com/fsfe/reuse-tool/issues/606))
- Markdown files which have frontmatter (i.e. yaml or toml between a `---` block
  at the start of the file) now get Python-like comments inside of the
  frontmatter when annotating. ([#&#8203;1170](https://redirect.github.com/fsfe/reuse-tool/issues/1170))

##### Fixed

- When `file-magic` is installed simultaneously with `python-magic`, the tool
  used to misbehave (read: crash), because either one of them could be imported
  on `import magic`. This misbehaviour no longer happens. ([#&#8203;1264](https://redirect.github.com/fsfe/reuse-tool/issues/1264))
- Invalid SPDX license expressions are no longer recognized as used or missing
  licenses. ([#&#8203;1254](https://redirect.github.com/fsfe/reuse-tool/issues/1254))
- `click` translations are now correctly loaded. ([#&#8203;1267](https://redirect.github.com/fsfe/reuse-tool/issues/1267))

### [`v6.1.2`](https://redirect.github.com/fsfe/reuse-tool/blob/HEAD/CHANGELOG.md#v612---2025-10-08)

[Compare Source](https://redirect.github.com/fsfe/reuse-tool/compare/v6.1.1...v6.1.2)

##### Fixed

- Fixed a bug where a newline would sometimes be missing from
  `reuse lint --lines`. ([#&#8203;1251](https://redirect.github.com/fsfe/reuse-tool/issues/1251))
- The output of `reuse lint --lines` is now sorted by path name. ([#&#8203;1251](https://redirect.github.com/fsfe/reuse-tool/issues/1251))
- Fixed a performance regression introduced in v6.1.1 that would cause some
  copyright notices to take incredibly long to parse. ([#&#8203;1252](https://redirect.github.com/fsfe/reuse-tool/issues/1252))

### [`v6.1.1`](https://redirect.github.com/fsfe/reuse-tool/blob/HEAD/CHANGELOG.md#v611---2025-10-07)

[Compare Source](https://redirect.github.com/fsfe/reuse-tool/compare/v6.1.0...v6.1.1)

##### Changed

- In the Docker images, Alpine is bumped to `alpine:3.22` and Debian to
  `debian:13-slim`. ([#&#8203;1247](https://redirect.github.com/fsfe/reuse-tool/issues/1247))

##### Fixed

- ASCII frames around comments were broken in v6.0.0. They now work again. The
  sole condition is that the 'suffix' of a comment is identical to its 'prefix'.
  For example:

  ```
  /*******************************************\
  |*  SPDX-License-Identifier: CC-BY-SA-4.0  *|
  \*******************************************/
  ```

  ([#&#8203;1249](https://redirect.github.com/fsfe/reuse-tool/issues/1249))

### [`v6.1.0`](https://redirect.github.com/fsfe/reuse-tool/blob/HEAD/CHANGELOG.md#v610---2025-10-07)

[Compare Source](https://redirect.github.com/fsfe/reuse-tool/compare/v6.0.0...v6.1.0)

This release adds a simple feature as a workaround for a bug that will be
resolved in a later version. The bug is described in
<https://codeberg.org/fsfe/reuse-tool/issues/1244>, and can be summarised as:
When `charset-normalizer` is used to detect the encoding of a file, it will
erroneously detect a UTF-8 file as having no encoding (i.e. a binary file) when
the 2048th byte is a non-final byte of a multi-byte glyph.

You can run reuse as `REUSE_ENCODING_MODULE=chardet reuse` to circumvent this
bug. If you use pre-commit, you can use this snippet:

```yaml
repos:
  - repo: https://codeberg.org/fsfe/reuse-tool
    rev: v6.1.0
    hooks:
      - id: reuse
        entry: env REUSE_ENCODING_MODULE=chardet reuse
```

You will not encounter this bug if your environment has libmagic available.

##### Added

- You can now specify the module that will be used for detecting the encoding of
  files with the `REUSE_ENCODING_MODULE` environment variable. ([#&#8203;1245](https://redirect.github.com/fsfe/reuse-tool/issues/1245))
- The Docker images and the pre-commit hooks now come bundled with all encoding
  modules. ([#&#8203;1245](https://redirect.github.com/fsfe/reuse-tool/issues/1245))
- The `--debug` flag now tells you the detected encoding and detected newlines
  of each file, as well as which encoding module is used. ([#&#8203;1246](https://redirect.github.com/fsfe/reuse-tool/issues/1246))

### [`v6.0.0`](https://redirect.github.com/fsfe/reuse-tool/blob/HEAD/CHANGELOG.md#v600---2025-10-06)

[Compare Source](https://redirect.github.com/fsfe/reuse-tool/compare/v5.1.1...v6.0.0)

This release contains a lot of refactoring regarding the parsing of files. The
most impactful details are that `reuse lint` now searches every file in its
entirety for REUSE information, tries to detect each file's encoding, and no
longer breaks when invalid SPDX License Expressions are detected.

Because files are now read in their entireties instead of just the first 4 KiB,
you may need to add `REUSE-IgnoreStart` and `REUSE-IgnoreEnd` tags to get rid of
false positives that were previously too deep into files for `reuse` to detect.

**For package maintainers:** This release removes, adds, and changes
dependencies. It merits running `git diff v5.1.1..v6.0.0 pyproject.toml` and
reading the 'Changed' section of this change log to see what changed.

##### Added

- Added new file extensions:
  - `py.typed` ([#&#8203;1239](https://redirect.github.com/fsfe/reuse-tool/issues/1239))
  - `.blade.php` ([#&#8203;573](https://redirect.github.com/fsfe/reuse-tool/issues/573))
- A new criterion 'Invalid SPDX License Expressions' has been added to
  `reuse lint`. Invalid expressions are SPDX License Expressions which are not
  valid according to the grammar of the SPDX specification. ([#&#8203;1240](https://redirect.github.com/fsfe/reuse-tool/issues/1240))

##### Changed

- Python 3.9 support dropped. ([#&#8203;1219](https://redirect.github.com/fsfe/reuse-tool/issues/1219))
- The Python requirement for `reuse` now no longer requires a lower major
  version than 4. The requirement is now `>=3.10` instead of `>=3.10,<4`.
  ([#&#8203;1219](https://redirect.github.com/fsfe/reuse-tool/issues/1219))
- Dependency changes:
  - Removed explicit dependency `boolean.boolean`. It is now an implicit
    dependency via `license-expression`. ([#&#8203;1240](https://redirect.github.com/fsfe/reuse-tool/issues/1240))
  - The dependency `python-magic` has been added, alongside the optional
    dependencies `charset-normalizer` and `chardet`. So long as at least one of
    these is installed, the program will work. ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235))
  - The dependency `binaryornot` has been removed. ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235))
  - The minimum requirements of several dependencies have been updated. ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235),
    [#&#8203;1241](https://redirect.github.com/fsfe/reuse-tool/issues/1241))
- `reuse lint` now always searches the entire file for REUSE information.
  Previously, it only searched the first 4 KiB under most circumstances. ([#&#8203;1229](https://redirect.github.com/fsfe/reuse-tool/issues/1229))
- The encodings of files are now detected before they are read or altered.
  ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235), [#&#8203;1218](https://redirect.github.com/fsfe/reuse-tool/issues/1218))
- The 'Bad licenses' criterion in `reuse lint` previously searched for bad
  licenses in every single file. Now, only bad licenses in `LICENSES/` are
  detected, which is more in line with the documentation. ([#&#8203;1240](https://redirect.github.com/fsfe/reuse-tool/issues/1240))
- The behaviour of the `--year` option to `reuse annotate`is now different.
  Previously, you could define `--year <year>` multiple times. Now you can only
  do so once, but the value may be a string containing multiple years or a range
  of years. ([#&#8203;1145](https://redirect.github.com/fsfe/reuse-tool/issues/1145))
- `reuse annotate --merge-copyrights` works more efficiently now, capable of
  better heuristics to detect years and year ranges. ([#&#8203;1145](https://redirect.github.com/fsfe/reuse-tool/issues/1145))
- `reuse annotate --merge-copyrights` no longer adds spacing around the merged
  year ranges. i.e. `2017-2025`, not `2017 - 2025`. ([#&#8203;1145](https://redirect.github.com/fsfe/reuse-tool/issues/1145))

##### Fixed

- Unparseable SPDX expressions in a file now no longer cause the collection of
  REUSE information from that file to entirely fail. ([#&#8203;1240](https://redirect.github.com/fsfe/reuse-tool/issues/1240))
- Files with carriage return (`\r`) line endings are now correctly linted.
  ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235), [#&#8203;1226](https://redirect.github.com/fsfe/reuse-tool/issues/1226))
- There used to be a specific scenario where `reuse lint` would read the
  contents of an entire file into memory. This no longer happens.
  `reuse annotate` will still read the entire file into memory. ([#&#8203;1229](https://redirect.github.com/fsfe/reuse-tool/issues/1229))
- Fixed formatting in `lint` subcommand help message. ([#&#8203;1212](https://redirect.github.com/fsfe/reuse-tool/issues/1212), [#&#8203;1236](https://redirect.github.com/fsfe/reuse-tool/issues/1236))
- Fixed a case where, if a recognised file extension (such as `.blade.php`) has
  two or more components, it would not be correctly recognised. ([#&#8203;573](https://redirect.github.com/fsfe/reuse-tool/issues/573))
- Fixed a bug where, if `REUSE-IgnoreStart` is the very first thing that appears
  in a file, the subsequent text is not actually ignored. ([#&#8203;1229](https://redirect.github.com/fsfe/reuse-tool/issues/1229))
- If using `reuse annotate` to write to a file, the BOM is preserved if the
  encoding is UTF-8, UTF-16, or UTF-32. ([#&#8203;1235](https://redirect.github.com/fsfe/reuse-tool/issues/1235), [#&#8203;384](https://redirect.github.com/fsfe/reuse-tool/issues/384))
- The summaries of `reuse lint` are now sorted better. ([#&#8203;1241](https://redirect.github.com/fsfe/reuse-tool/issues/1241))
- Several performance improvements. Local testing on a 12-core laptop suggests
  speedup of up to 50%, but it may depend on your repository. ([#&#8203;1222](https://redirect.github.com/fsfe/reuse-tool/issues/1222), [#&#8203;1223](https://redirect.github.com/fsfe/reuse-tool/issues/1223),
  [#&#8203;1230](https://redirect.github.com/fsfe/reuse-tool/issues/1230), [#&#8203;1241](https://redirect.github.com/fsfe/reuse-tool/issues/1241))

</details>

---

### Configuration

📅 **Schedule**: Branch creation - At 12:00 AM through 04:59 AM and 10:00 PM through 11:59 PM, Monday through Friday ( * 0-4,22-23 * * 1-5 ), Only on Sunday and Saturday ( * * * * 0,6 ) in timezone America/Los_Angeles, Automerge - At any time (no schedule defined).

🚦 **Automerge**: Enabled.

♻ **Rebasing**: Whenever PR is behind base branch, or you tick the rebase/retry checkbox.

🔕 **Ignore**: Close this PR and you won't be reminded about this update again.

---

 - [ ] <!-- rebase-check -->If you want to rebase/retry this PR, check this box

---

This PR was generated by [Mend Renovate](https://mend.io/renovate/). View the [repository job log](https://developer.mend.io/github/riscv/riscv-unified-db).
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45NS4yIiwidXBkYXRlZEluVmVyIjoiNDIuOTUuMiIsInRhcmdldEJyYW5jaCI6Im1haW4iLCJsYWJlbHMiOlsiZGVwZW5kZW5jaWVzIl19-->

