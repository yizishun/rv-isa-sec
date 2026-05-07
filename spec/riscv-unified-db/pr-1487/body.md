This PR contains the following updates:

| Package | Type | Update | Change |
|---|---|---|---|
| [actions/upload-artifact](https://redirect.github.com/actions/upload-artifact) |  | minor | `v4` → `v4.6.2` |
| [actions/upload-artifact](https://redirect.github.com/actions/upload-artifact) | action | minor | `v4` → `v4.6.2` |

---

### Release Notes

<details>
<summary>actions/upload-artifact (actions/upload-artifact)</summary>

### [`v4.6.2`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.6.2)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.6.1...v4.6.2)

#### What's Changed

- Update to use artifact 2.3.2 package & prepare for new upload-artifact release by [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) in [#&#8203;685](https://redirect.github.com/actions/upload-artifact/pull/685)

#### New Contributors

- [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) made their first contribution in [#&#8203;685](https://redirect.github.com/actions/upload-artifact/pull/685)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.6.2>

### [`v4.6.1`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.6.1)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.6.0...v4.6.1)

#### What's Changed

- Update to use artifact 2.2.2 package by [@&#8203;yacaovsnc](https://redirect.github.com/yacaovsnc) in [#&#8203;673](https://redirect.github.com/actions/upload-artifact/pull/673)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.6.1>

### [`v4.6.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.6.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.5.0...v4.6.0)

#### What's Changed

- Expose env vars to control concurrency and timeout by [@&#8203;yacaovsnc](https://redirect.github.com/yacaovsnc) in [#&#8203;662](https://redirect.github.com/actions/upload-artifact/pull/662)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.6.0>

### [`v4.5.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.5.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.4.3...v4.5.0)

#### What's Changed

- fix: deprecated `Node.js` version in action by [@&#8203;hamirmahal](https://redirect.github.com/hamirmahal) in [#&#8203;578](https://redirect.github.com/actions/upload-artifact/pull/578)
- Add new `artifact-digest` output by [@&#8203;bdehamer](https://redirect.github.com/bdehamer) in [#&#8203;656](https://redirect.github.com/actions/upload-artifact/pull/656)

#### New Contributors

- [@&#8203;hamirmahal](https://redirect.github.com/hamirmahal) made their first contribution in [#&#8203;578](https://redirect.github.com/actions/upload-artifact/pull/578)
- [@&#8203;bdehamer](https://redirect.github.com/bdehamer) made their first contribution in [#&#8203;656](https://redirect.github.com/actions/upload-artifact/pull/656)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.4.3...v4.5.0>

### [`v4.4.3`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.4.3)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.4.2...v4.4.3)

#### What's Changed

- Undo indirect dependency updates from [#&#8203;627](https://redirect.github.com/actions/upload-artifact/issues/627) by [@&#8203;joshmgross](https://redirect.github.com/joshmgross) in [#&#8203;632](https://redirect.github.com/actions/upload-artifact/pull/632)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.4.2...v4.4.3>

### [`v4.4.2`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.4.2)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.4.1...v4.4.2)

#### What's Changed

- Bump `@actions/artifact` to 2.1.11 by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;627](https://redirect.github.com/actions/upload-artifact/pull/627)
  - Includes fix for relative symlinks not resolving properly

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.4.1...v4.4.2>

### [`v4.4.1`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.4.1)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.4.0...v4.4.1)

#### What's Changed

- Add a section about hidden files by [@&#8203;joshmgross](https://redirect.github.com/joshmgross) in [#&#8203;607](https://redirect.github.com/actions/upload-artifact/pull/607)
- Add workflow file for publishing releases to immutable action package by [@&#8203;Jcambass](https://redirect.github.com/Jcambass) in [#&#8203;621](https://redirect.github.com/actions/upload-artifact/pull/621)
- Update [@&#8203;actions/artifact](https://redirect.github.com/actions/artifact) to latest version, includes symlink and timeout fixes by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;625](https://redirect.github.com/actions/upload-artifact/pull/625)

#### New Contributors

- [@&#8203;Jcambass](https://redirect.github.com/Jcambass) made their first contribution in [#&#8203;621](https://redirect.github.com/actions/upload-artifact/pull/621)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.4.0...v4.4.1>

### [`v4.4.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.4.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.6...v4.4.0)

#### Notice: Breaking Changes :warning:

We will no longer include hidden files and folders by default in the `upload-artifact` action of this version. This reduces the risk that credentials are accidentally uploaded into artifacts. Customers who need to continue to upload these files can use a new option, `include-hidden-files`, to continue to do so.

See ["Notice of upcoming deprecations and breaking changes in GitHub Actions runners"](https://github.blog/changelog/2024-08-19-notice-of-upcoming-deprecations-and-breaking-changes-in-github-actions-runners/) changelog and [this issue](https://redirect.github.com/actions/upload-artifact/issues/602) for more details.

#### What's Changed

- Exclude hidden files by default by [@&#8203;joshmgross](https://redirect.github.com/joshmgross) in [#&#8203;598](https://redirect.github.com/actions/upload-artifact/pull/598)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.3.6...v4.4.0>

### [`v4.3.6`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.6)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.5...v4.3.6)

#### What's Changed

- Revert to [@&#8203;actions/artifact](https://redirect.github.com/actions/artifact) 2.1.8 by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;594](https://redirect.github.com/actions/upload-artifact/pull/594)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.3.6>

### [`v4.3.5`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.5)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.4...v4.3.5)

#### What's Changed

- Bump [@&#8203;actions/artifact](https://redirect.github.com/actions/artifact) to v2.1.9 by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;588](https://redirect.github.com/actions/upload-artifact/pull/588)
  - Fixed artifact upload chunk timeout logic [#&#8203;1774](https://redirect.github.com/actions/toolkit/pull/1774)
  - Use lazy stream to prevent issues with open file limits [#&#8203;1771](https://redirect.github.com/actions/toolkit/pull/1771)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.3.4...v4.3.5>

### [`v4.3.4`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.4)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.3...v4.3.4)

#### What's Changed

- Update [@&#8203;actions/artifact](https://redirect.github.com/actions/artifact) version, bump dependencies by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;584](https://redirect.github.com/actions/upload-artifact/pull/584)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.3.3...v4.3.4>

### [`v4.3.3`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.3)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.2...v4.3.3)

#### What's Changed

- updating `@actions/artifact` dependency to v2.1.6 by [@&#8203;eggyhead](https://redirect.github.com/eggyhead) in [#&#8203;565](https://redirect.github.com/actions/upload-artifact/pull/565)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.3.2...v4.3.3>

### [`v4.3.2`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.2)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.1...v4.3.2)

#### What's Changed

- Update release-new-action-version.yml by [@&#8203;konradpabjan](https://redirect.github.com/konradpabjan) in [#&#8203;516](https://redirect.github.com/actions/upload-artifact/pull/516)
- Minor fix to the migration readme by [@&#8203;andrewakim](https://redirect.github.com/andrewakim) in [#&#8203;523](https://redirect.github.com/actions/upload-artifact/pull/523)
- Update readme with v3/v2/v1 deprecation notice by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;561](https://redirect.github.com/actions/upload-artifact/pull/561)
- updating `@actions/artifact` dependency to v2.1.5 and `@actions/core` to v1.0.1 by [@&#8203;eggyhead](https://redirect.github.com/eggyhead) in [#&#8203;562](https://redirect.github.com/actions/upload-artifact/pull/562)

#### New Contributors

- [@&#8203;andrewakim](https://redirect.github.com/andrewakim) made their first contribution in [#&#8203;523](https://redirect.github.com/actions/upload-artifact/pull/523)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4.3.1...v4.3.2>

### [`v4.3.1`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.1)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.3.0...v4.3.1)

- Bump [@&#8203;actions/artifacts](https://redirect.github.com/actions/artifacts) to latest version to include [updated GHES host check](https://redirect.github.com/actions/toolkit/pull/1648)

### [`v4.3.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.3.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.2.0...v4.3.0)

#### What's Changed

- Reorganize upload code in prep for merge logic & add more tests by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;504](https://redirect.github.com/actions/upload-artifact/pull/504)
- Add sub-action to merge artifacts by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;505](https://redirect.github.com/actions/upload-artifact/pull/505)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.3.0>

### [`v4.2.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.2.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.1.0...v4.2.0)

#### What's Changed

- Ability to overwrite an Artifact by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;501](https://redirect.github.com/actions/upload-artifact/pull/501)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.2.0>

### [`v4.1.0`](https://redirect.github.com/actions/upload-artifact/releases/tag/v4.1.0)

[Compare Source](https://redirect.github.com/actions/upload-artifact/compare/v4.0.0...v4.1.0)

#### What's Changed

- Add migrations docs by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;482](https://redirect.github.com/actions/upload-artifact/pull/482)
- Update README.md by [@&#8203;samuelwine](https://redirect.github.com/samuelwine) in [#&#8203;492](https://redirect.github.com/actions/upload-artifact/pull/492)
- Support artifact-url output by [@&#8203;konradpabjan](https://redirect.github.com/konradpabjan) in [#&#8203;496](https://redirect.github.com/actions/upload-artifact/pull/496)
- Update readme to reflect new 500 artifact per job limit by [@&#8203;robherley](https://redirect.github.com/robherley) in [#&#8203;497](https://redirect.github.com/actions/upload-artifact/pull/497)

#### New Contributors

- [@&#8203;samuelwine](https://redirect.github.com/samuelwine) made their first contribution in [#&#8203;492](https://redirect.github.com/actions/upload-artifact/pull/492)

**Full Changelog**: <https://github.com/actions/upload-artifact/compare/v4...v4.1.0>

</details>

---

### Configuration

📅 **Schedule**: Branch creation - At 12:00 AM through 04:59 AM and 10:00 PM through 11:59 PM, Monday through Friday ( * 0-4,22-23 * * 1-5 ), Only on Sunday and Saturday ( * * * * 0,6 ) in timezone America/Los_Angeles, Automerge - At any time (no schedule defined).

🚦 **Automerge**: Enabled.

♻ **Rebasing**: Whenever PR is behind base branch, or you tick the rebase/retry checkbox.

🔕 **Ignore**: Close this PR and you won't be reminded about these updates again.

---

 - [ ] <!-- rebase-check -->If you want to rebase/retry this PR, check this box

---

This PR was generated by [Mend Renovate](https://mend.io/renovate/). View the [repository job log](https://developer.mend.io/github/riscv/riscv-unified-db).
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45Mi4xIiwidXBkYXRlZEluVmVyIjoiNDIuOTIuMSIsInRhcmdldEJyYW5jaCI6Im1haW4iLCJsYWJlbHMiOlsiZGVwZW5kZW5jaWVzIl19-->

