This PR contains the following updates:

| Package | Update | Change |
|---|---|---|
| [actions/setup-java](https://redirect.github.com/actions/setup-java) | major | `v4.8.0` → `v5.2.0` |

---

### Release Notes

<details>
<summary>actions/setup-java (actions/setup-java)</summary>

### [`v5.2.0`](https://redirect.github.com/actions/setup-java/releases/tag/v5.2.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v5.1.0...v5.2.0)

##### What's Changed

##### Enhancement

- Retry on HTTP 522 Connection timed out by [@&#8203;findepi](https://redirect.github.com/findepi) in [#&#8203;964](https://redirect.github.com/actions/setup-java/pull/964)

##### Documentation Changes

- Update gradle caching by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;972](https://redirect.github.com/actions/setup-java/pull/972)
- Update checkout to v6 by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;973](https://redirect.github.com/actions/setup-java/pull/973)

##### Dependency Updates

- Upgrade [@&#8203;actions/cache](https://redirect.github.com/actions/cache) to v5 by [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) in [#&#8203;968](https://redirect.github.com/actions/setup-java/pull/968)
- Upgrade actions/checkout from 5 to 6 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;961](https://redirect.github.com/actions/setup-java/pull/961)

##### New Contributors

- [@&#8203;findepi](https://redirect.github.com/findepi) made their first contribution in [#&#8203;964](https://redirect.github.com/actions/setup-java/pull/964)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v5...v5.2.0>

### [`v5.1.0`](https://redirect.github.com/actions/setup-java/releases/tag/v5.1.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v5.0.0...v5.1.0)

##### What's Changed

##### New Features

- Add support for `.sdkmanrc` file in `java-version-file` parameter by [@&#8203;guicamest](https://redirect.github.com/guicamest) in [#&#8203;736](https://redirect.github.com/actions/setup-java/pull/736)
- Add support for Microsoft OpenJDK 25 builds by [@&#8203;the-mod](https://redirect.github.com/the-mod) in [#&#8203;927](https://redirect.github.com/actions/setup-java/pull/927)

##### Bug Fixes & Improvements

- Update Regex to Support All ASDF Versions for the supported distributions in tool-versions File by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;767](https://redirect.github.com/actions/setup-java/pull/767)
- Enhance error logging for network failures to include endpoint/IP details, add retry mechanism and update workflows to use macos-15-intel by [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) in [#&#8203;946](https://redirect.github.com/actions/setup-java/pull/946)
- Update SapMachine URLs by [@&#8203;RealCLanger](https://redirect.github.com/RealCLanger) in [#&#8203;955](https://redirect.github.com/actions/setup-java/pull/955)
- Add GitHub Token Support for GraalVM and Refactor Code by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;849](https://redirect.github.com/actions/setup-java/pull/849)

##### Documentation changes

- Update documentation to use checkout and Java v5 by [@&#8203;lmvysakh](https://redirect.github.com/lmvysakh) in [#&#8203;903](https://redirect.github.com/actions/setup-java/pull/903)
- Clarify JAVA\_HOME and PATH setup in README by [@&#8203;chiranjib-swain](https://redirect.github.com/chiranjib-swain) in [#&#8203;841](https://redirect.github.com/actions/setup-java/pull/841)

##### Dependency updates

- Upgrade prettier from 2.8.8 to 3.6.2 and document breaking changes in v5 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;873](https://redirect.github.com/actions/setup-java/pull/873)
- Upgrade actions/publish-action from 0.3.0 to 0.4.0  by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;912](https://redirect.github.com/actions/setup-java/pull/912)

##### New Contributors

- [@&#8203;lmvysakh](https://redirect.github.com/lmvysakh) made their first contribution in [#&#8203;903](https://redirect.github.com/actions/setup-java/pull/903)
- [@&#8203;chiranjib-swain](https://redirect.github.com/chiranjib-swain) made their first contribution in [#&#8203;841](https://redirect.github.com/actions/setup-java/pull/841)
- [@&#8203;the-mod](https://redirect.github.com/the-mod) made their first contribution in [#&#8203;927](https://redirect.github.com/actions/setup-java/pull/927)
- [@&#8203;priya-kinthali](https://redirect.github.com/priya-kinthali) made their first contribution in [#&#8203;946](https://redirect.github.com/actions/setup-java/pull/946)
- [@&#8203;guicamest](https://redirect.github.com/guicamest) made their first contribution in [#&#8203;736](https://redirect.github.com/actions/setup-java/pull/736)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v5...v5.1.0>

### [`v5.0.0`](https://redirect.github.com/actions/setup-java/releases/tag/v5.0.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v5...v5)

#### What's Changed

##### Breaking Changes

- Upgrade to node 24 by [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) in [#&#8203;888](https://redirect.github.com/actions/setup-java/pull/888)

Make sure your runner is updated to this version or newer to use this release. v2.327.1 [Release Notes](https://redirect.github.com/actions/runner/releases/tag/v2.327.1)

##### Dependency Upgrades

- Upgrade Publish Immutable Action by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;798](https://redirect.github.com/actions/setup-java/pull/798)
- Upgrade eslint-plugin-jest from 27.9.0 to 28.11.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;730](https://redirect.github.com/actions/setup-java/pull/730)
- Upgrade undici from 5.28.5 to 5.29.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;833](https://redirect.github.com/actions/setup-java/pull/833)
- Upgrade form-data to bring in fix for critical vulnerability by [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) in [#&#8203;887](https://redirect.github.com/actions/setup-java/pull/887)
- Upgrade actions/checkout from 4 to 5 by [@&#8203;dependabot](https://redirect.github.com/dependabot)\[bot] in [#&#8203;896](https://redirect.github.com/actions/setup-java/pull/896)

##### Bug Fixes

- Prevent default installation of JetBrains pre-releases by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;859](https://redirect.github.com/actions/setup-java/pull/859)
- Improve Error Handling for Setup-Java Action to Help Debug Intermittent Failures by [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) in [#&#8203;848](https://redirect.github.com/actions/setup-java/pull/848)

#### New Contributors

- [@&#8203;gowridurgad](https://redirect.github.com/gowridurgad) made their first contribution in [#&#8203;848](https://redirect.github.com/actions/setup-java/pull/848)
- [@&#8203;salmanmkc](https://redirect.github.com/salmanmkc) made their first contribution in [#&#8203;888](https://redirect.github.com/actions/setup-java/pull/888)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v5.0.0>

### [`v5`](https://redirect.github.com/actions/setup-java/compare/v4...v5)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.8.0...v5)

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
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45NS4yIiwidXBkYXRlZEluVmVyIjoiNDIuOTcuMCIsInRhcmdldEJyYW5jaCI6Im1haW4iLCJsYWJlbHMiOlsiZGVwZW5kZW5jaWVzIl19-->

