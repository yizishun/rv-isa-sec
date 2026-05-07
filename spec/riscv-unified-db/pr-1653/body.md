This PR contains the following updates:

| Package | Type | Update | Change |
|---|---|---|---|
| [actions/setup-python](https://redirect.github.com/actions/setup-python) | action | minor | `v5` → `v5.6.0` |

---

### Release Notes

<details>
<summary>actions/setup-python (actions/setup-python)</summary>

### [`v5.6.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.6.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.5.0...v5.6.0)

#### What's Changed

- Workflow updates related to Ubuntu 20.04 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;1065](https://redirect.github.com/actions/setup-python/pull/1065)
- Fix for Candidate Not Iterable Error by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;1082](https://redirect.github.com/actions/setup-python/pull/1082)
- Upgrade semver and [@&#8203;types/semver](https://redirect.github.com/types/semver) by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1091](https://redirect.github.com/actions/setup-python/pull/1091)
- Upgrade prettier from 2.8.8 to 3.5.3 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1046](https://redirect.github.com/actions/setup-python/pull/1046)
- Upgrade ts-jest from 29.1.2 to 29.3.2 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1081](https://redirect.github.com/actions/setup-python/pull/1081)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.6.0>

### [`v5.5.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.5.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.4.0...v5.5.0)

#### What's Changed

##### Enhancements:

- Support free threaded Python versions like '3.13t' by [@&#8203;colesbury](https://redirect.github.com/colesbury) in [#&#8203;973](https://redirect.github.com/actions/setup-python/pull/973)
- Enhance Workflows: Include ubuntu-arm runners, Add e2e Testing for free threaded and Upgrade [@&#8203;action/cache](https://redirect.github.com/action/cache) from 4.0.0 to 4.0.3 by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;1056](https://redirect.github.com/actions/setup-python/pull/1056)
- Add support for .tool-versions file in setup-python by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;1043](https://redirect.github.com/actions/setup-python/pull/1043)

##### Bug fixes:

- Fix architecture for pypy on Linux ARM64 by [@&#8203;mayeut](https://redirect.github.com/mayeut) in [#&#8203;1011](https://redirect.github.com/actions/setup-python/pull/1011)
  This update maps arm64 to aarch64 for Linux ARM64 PyPy installations.

##### Dependency updates:

- Upgrade [@&#8203;vercel/ncc](https://redirect.github.com/vercel/ncc) from 0.38.1 to 0.38.3 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1016](https://redirect.github.com/actions/setup-python/pull/1016)
- Upgrade [@&#8203;actions/glob](https://redirect.github.com/actions/glob) from 0.4.0 to 0.5.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1015](https://redirect.github.com/actions/setup-python/pull/1015)

#### New Contributors

- [@&#8203;colesbury](https://redirect.github.com/colesbury) made their first contribution in [#&#8203;973](https://redirect.github.com/actions/setup-python/pull/973)
- [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) made their first contribution in [#&#8203;1043](https://redirect.github.com/actions/setup-python/pull/1043)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.5.0>

### [`v5.4.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.4.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.3.0...v5.4.0)

#### What's Changed

##### Enhancements:

- Update cache error message by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;968](https://redirect.github.com/actions/setup-python/pull/968)
- Enhance Workflows: Add Ubuntu-24, Remove Python 3.8  by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;985](https://redirect.github.com/actions/setup-python/pull/985)
- Configure Dependabot settings by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;1008](https://redirect.github.com/actions/setup-python/pull/1008)

##### Documentation changes:

- Readme update - recommended permissions by [@&#8203;benwells](https://redirect.github.com/benwells) in [#&#8203;1009](https://redirect.github.com/actions/setup-python/pull/1009)
- Improve Advanced Usage examples by [@&#8203;lrq3000](https://redirect.github.com/lrq3000) in [#&#8203;645](https://redirect.github.com/actions/setup-python/pull/645)

##### Dependency updates:

- Upgrade `undici` from 5.28.4 to 5.28.5 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1012](https://redirect.github.com/actions/setup-python/pull/1012)
- Upgrade `urllib3` from 1.25.9 to 1.26.19 in /**tests**/data by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;895](https://redirect.github.com/actions/setup-python/pull/895)
- Upgrade `actions/publish-immutable-action` from 0.0.3 to 0.0.4 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1014](https://redirect.github.com/actions/setup-python/pull/1014)
- Upgrade `@actions/http-client` from 2.2.1 to 2.2.3 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1020](https://redirect.github.com/actions/setup-python/pull/1020)
- Upgrade `requests` from 2.24.0 to 2.32.2 in /**tests**/data by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;1019](https://redirect.github.com/actions/setup-python/pull/1019)
- Upgrade `@actions/cache` to `^4.0.0` by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;1007](https://redirect.github.com/actions/setup-python/pull/1007)

#### New Contributors

- [@&#8203;benwells](https://redirect.github.com/benwells) made their first contribution in [#&#8203;1009](https://redirect.github.com/actions/setup-python/pull/1009)
- [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) made their first contribution in [#&#8203;1008](https://redirect.github.com/actions/setup-python/pull/1008)
- [@&#8203;lrq3000](https://redirect.github.com/lrq3000) made their first contribution in [#&#8203;645](https://redirect.github.com/actions/setup-python/pull/645)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.4.0>

### [`v5.3.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.3.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.2.0...v5.3.0)

#### What's Changed

- Add workflow file for publishing releases to immutable action package by [@&#8203;Jcambass](https://redirect.github.com/Jcambass) in [#&#8203;941](https://redirect.github.com/actions/setup-python/pull/941)
- Upgrade IA publish by [@&#8203;Jcambass](https://redirect.github.com/Jcambass) in [#&#8203;943](https://redirect.github.com/actions/setup-python/pull/943)

##### Bug Fixes:

- Normalise Line Endings to Ensure Cross-Platform Consistency by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;938](https://redirect.github.com/actions/setup-python/pull/938)
- Revise `isGhes` logic by [@&#8203;jww3](https://redirect.github.com/jww3) in [#&#8203;963](https://redirect.github.com/actions/setup-python/pull/963)
- Bump pillow from 7.2 to 10.2.0 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;956](https://redirect.github.com/actions/setup-python/pull/956)

##### Enhancements:

- Enhance workflows and documentation updates by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;965](https://redirect.github.com/actions/setup-python/pull/965)
- Bump default versions to latest by [@&#8203;jeffwidman](https://redirect.github.com/jeffwidman) in [#&#8203;905](https://redirect.github.com/actions/setup-python/pull/905)

#### New Contributors

- [@&#8203;Jcambass](https://redirect.github.com/Jcambass) made their first contribution in [#&#8203;941](https://redirect.github.com/actions/setup-python/pull/941)
- [@&#8203;jww3](https://redirect.github.com/jww3) made their first contribution in [#&#8203;963](https://redirect.github.com/actions/setup-python/pull/963)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.3.0>

### [`v5.2.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.2.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.1.1...v5.2.0)

#### What's Changed

##### Bug fixes:

- Add `.zip` extension to Windows package downloads for `Expand-Archive` Compatibility by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;916](https://redirect.github.com/actions/setup-python/pull/916)
  This addresses compatibility issues on Windows self-hosted runners by ensuring that the filenames for Python and PyPy package downloads explicitly include the .zip extension, allowing the Expand-Archive command to function correctly.
- Add arch to cache key by [@&#8203;Zxilly](https://redirect.github.com/Zxilly) in [#&#8203;896](https://redirect.github.com/actions/setup-python/pull/896)
  This addresses issues with caching by adding the architecture (arch) to the cache key, ensuring that cache keys are accurate to prevent conflicts.
  Note: This change may break previous cache keys as they will no longer be compatible with the new format.

##### Documentation changes:

- Fix display of emojis in contributors doc by [@&#8203;sciencewhiz](https://redirect.github.com/sciencewhiz) in [#&#8203;899](https://redirect.github.com/actions/setup-python/pull/899)
- Documentation update for caching poetry dependencies by [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) in [#&#8203;908](https://redirect.github.com/actions/setup-python/pull/908)

##### Dependency updates:

- Bump [@&#8203;iarna/toml](https://redirect.github.com/iarna/toml) version from 2.2.5 to 3.0.0 by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;912](https://redirect.github.com/actions/setup-python/pull/912)
- Bump pyinstaller from 3.6 to 5.13.1 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;923](https://redirect.github.com/actions/setup-python/pull/923)

#### New Contributors

- [@&#8203;sciencewhiz](https://redirect.github.com/sciencewhiz) made their first contribution in [#&#8203;899](https://redirect.github.com/actions/setup-python/pull/899)
- [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) made their first contribution in [#&#8203;916](https://redirect.github.com/actions/setup-python/pull/916)
- [@&#8203;Zxilly](https://redirect.github.com/Zxilly) made their first contribution in [#&#8203;896](https://redirect.github.com/actions/setup-python/pull/896)
- [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) made their first contribution in [#&#8203;923](https://redirect.github.com/actions/setup-python/pull/923)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.2.0>

### [`v5.1.1`](https://redirect.github.com/actions/setup-python/releases/tag/v5.1.1)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.1.0...v5.1.1)

#### What's Changed

##### Bug fixes:

- fix(ci): update all failing workflows by [@&#8203;mayeut](https://redirect.github.com/mayeut) in [#&#8203;863](https://redirect.github.com/actions/setup-python/pull/863)
  This update ensures compatibility and optimal performance of workflows on the latest macOS version.

##### Documentation changes:

- Documentation update for cache by [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) in [#&#8203;873](https://redirect.github.com/actions/setup-python/pull/873)

##### Dependency updates:

- Bump braces from 3.0.2 to 3.0.3 and undici from 5.28.3 to 5.28.4 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;893](https://redirect.github.com/actions/setup-python/pull/893)

#### New Contributors

- [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) made their first contribution in [#&#8203;873](https://redirect.github.com/actions/setup-python/pull/873)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5...v5.1.1>

### [`v5.1.0`](https://redirect.github.com/actions/setup-python/releases/tag/v5.1.0)

[Compare Source](https://redirect.github.com/actions/setup-python/compare/v5.0.0...v5.1.0)

#### What's Changed

- Leveraging the raw API to retrieve the version-manifest, as it does not impose a rate limit and hence facilitates unrestricted consumption without the need for a token for Github Enterprise Servers by [@&#8203;Shegox](https://redirect.github.com/Shegox) in [#&#8203;766](https://redirect.github.com/actions/setup-python/pull/766).
- Dependency updates by [@&#8203;dependabot](https://redirect.github.com/dependabot) and [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;817](https://redirect.github.com/actions/setup-python/pull/817)
- Documentation changes for version in README by [@&#8203;basnijholt](https://redirect.github.com/basnijholt) in [#&#8203;776](https://redirect.github.com/actions/setup-python/pull/776)
- Documentation changes for link in README by [@&#8203;ukd1](https://redirect.github.com/ukd1) in [#&#8203;793](https://redirect.github.com/actions/setup-python/pull/793)
- Documentation changes for link in Advanced Usage by [@&#8203;Jamim](https://redirect.github.com/Jamim) in [#&#8203;782](https://redirect.github.com/actions/setup-python/pull/782)
- Documentation changes for avoiding rate limit issues on GHES by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;835](https://redirect.github.com/actions/setup-python/pull/835)

#### New Contributors

- [@&#8203;basnijholt](https://redirect.github.com/basnijholt) made their first contribution in [#&#8203;776](https://redirect.github.com/actions/setup-python/pull/776)
- [@&#8203;ukd1](https://redirect.github.com/ukd1) made their first contribution in [#&#8203;793](https://redirect.github.com/actions/setup-python/pull/793)
- [@&#8203;Jamim](https://redirect.github.com/Jamim) made their first contribution in [#&#8203;782](https://redirect.github.com/actions/setup-python/pull/782)
- [@&#8203;Shegox](https://redirect.github.com/Shegox) made their first contribution in [#&#8203;766](https://redirect.github.com/actions/setup-python/pull/766)
- [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) made their first contribution in [#&#8203;835](https://redirect.github.com/actions/setup-python/pull/835)

**Full Changelog**: <https://github.com/actions/setup-python/compare/v5.0.0...v5.1.0>

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

