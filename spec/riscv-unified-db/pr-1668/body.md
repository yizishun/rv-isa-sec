This PR contains the following updates:

| Package | Type | Update | Change |
|---|---|---|---|
| [actions/setup-node](https://redirect.github.com/actions/setup-node) | action | major | `v4.4.0` → `v6.2.0` |

---

### Release Notes

<details>
<summary>actions/setup-node (actions/setup-node)</summary>

### [`v6.2.0`](https://redirect.github.com/actions/setup-node/compare/v6.1.0...v6.2.0)

[Compare Source](https://redirect.github.com/actions/setup-node/compare/v6.1.0...v6.2.0)

### [`v6.1.0`](https://redirect.github.com/actions/setup-node/releases/tag/v6.1.0)

[Compare Source](https://redirect.github.com/actions/setup-node/compare/v6.0.0...v6.1.0)

#### What's Changed

##### Enhancement:

- Remove always-auth configuration handling by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;1436](https://redirect.github.com/actions/setup-node/pull/1436)

##### Dependency updates:

- Upgrade [@&#8203;actions/cache](https://redirect.github.com/actions/cache) from 4.0.3 to 4.1.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1384](https://redirect.github.com/actions/setup-node/pull/1384)
- Upgrade actions/checkout from 5 to 6 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1439](https://redirect.github.com/actions/setup-node/pull/1439)
- Upgrade js-yaml from 3.14.1 to 3.14.2 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1435](https://redirect.github.com/actions/setup-node/pull/1435)

##### Documentation update:

- Add example for restore-only cache in documentation by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;1419](https://redirect.github.com/actions/setup-node/pull/1419)

**Full Changelog**: <https://github.com/actions/setup-node/compare/v6...v6.1.0>

### [`v6.0.0`](https://redirect.github.com/actions/setup-node/releases/tag/v6.0.0)

[Compare Source](https://redirect.github.com/actions/setup-node/compare/v5.0.0...v6)

##### What's Changed

**Breaking Changes**

- Limit automatic caching to npm, update workflows and documentation by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;1374](https://redirect.github.com/actions/setup-node/pull/1374)

**Dependency Upgrades**

- Upgrade ts-jest from 29.1.2 to 29.4.1 and document breaking changes in v5 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1336](https://redirect.github.com/actions/setup-node/pull/1336)
- Upgrade prettier from 2.8.8 to 3.6.2 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1334](https://redirect.github.com/actions/setup-node/pull/1334)
- Upgrade actions/publish-action from 0.3.0 to 0.4.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1362](https://redirect.github.com/actions/setup-node/pull/1362)

**Full Changelog**: <https://github.com/actions/setup-node/compare/v5...v6.0.0>

### [`v5.0.0`](https://redirect.github.com/actions/setup-node/releases/tag/v5.0.0)

[Compare Source](https://redirect.github.com/actions/setup-node/compare/v4.4.0...v5.0.0)

##### What's Changed

##### Breaking Changes

- Enhance caching in setup-node with automatic package manager detection by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;1348](https://redirect.github.com/actions/setup-node/pull/1348)

This update, introduces automatic caching when a valid `packageManager` field is present in your `package.json`. This aims to improve workflow performance and make dependency management more seamless.
To disable this automatic caching, set `package-manager-cache: false`

```yaml
steps:
- uses: actions/checkout@v5
- uses: actions/setup-node@v5
  with:
    package-manager-cache: false
```

- Upgrade action to use node24 by [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) in [#&#8203;1325](https://redirect.github.com/actions/setup-node/pull/1325)

Make sure your runner is on version v2.327.1 or later to ensure compatibility with this release. [See Release Notes](https://redirect.github.com/actions/runner/releases/tag/v2.327.1)

##### Dependency Upgrades

- Upgrade [@&#8203;octokit/request-error](https://redirect.github.com/octokit/request-error) and [@&#8203;actions/github](https://redirect.github.com/actions/github) by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1227](https://redirect.github.com/actions/setup-node/pull/1227)
- Upgrade uuid from 9.0.1 to 11.1.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1273](https://redirect.github.com/actions/setup-node/pull/1273)
- Upgrade undici from 5.28.5 to 5.29.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1295](https://redirect.github.com/actions/setup-node/pull/1295)
- Upgrade form-data to bring in fix for critical vulnerability by [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) in [#&#8203;1332](https://redirect.github.com/actions/setup-node/pull/1332)
- Upgrade actions/checkout from 4 to 5 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;1345](https://redirect.github.com/actions/setup-node/pull/1345)

##### New Contributors

- [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) made their first contribution in [#&#8203;1348](https://redirect.github.com/actions/setup-node/pull/1348)
- [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) made their first contribution in [#&#8203;1325](https://redirect.github.com/actions/setup-node/pull/1325)

**Full Changelog**: <https://github.com/actions/setup-node/compare/v4...v5.0.0>

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
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0My44LjUiLCJ1cGRhdGVkSW5WZXIiOiI0My44LjUiLCJ0YXJnZXRCcmFuY2giOiJtYWluIiwibGFiZWxzIjpbImRlcGVuZGVuY2llcyJdfQ==-->

