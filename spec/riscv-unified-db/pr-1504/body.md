This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [pre_commit](https://redirect.github.com/pre-commit/pre-commit) | `==4.0.1` → `==4.5.1` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/pre-commit/4.5.1?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/pre-commit/4.0.1/4.5.1?slim=true) |

---

### Release Notes

<details>
<summary>pre-commit/pre-commit (pre_commit)</summary>

### [`v4.5.1`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#451---2025-12-16)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.5.0...v4.5.1)

\==================

##### Fixes

- Fix `language: python` with `repo: local` without `additional_dependencies`.
  - [#&#8203;3597](https://redirect.github.com/pre-commit/pre-commit/issues/3597) PR by [@&#8203;asottile](https://redirect.github.com/asottile).

### [`v4.5.0`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#450---2025-11-22)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.4.0...v4.5.0)

\==================

##### Features

- Add `pre-commit hazmat`.
  - [#&#8203;3585](https://redirect.github.com/pre-commit/pre-commit/issues/3585) PR by [@&#8203;asottile](https://redirect.github.com/asottile).

### [`v4.4.0`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#440---2025-11-08)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.3.0...v4.4.0)

\==================

##### Features

- Add `--fail-fast` option to `pre-commit run`.
  - [#&#8203;3528](https://redirect.github.com/pre-commit/pre-commit/issues/3528) PR by [@&#8203;JulianMaurin](https://redirect.github.com/JulianMaurin).
- Upgrade `ruby-build` / `rbenv`.
  - [#&#8203;3566](https://redirect.github.com/pre-commit/pre-commit/issues/3566) PR by [@&#8203;asottile](https://redirect.github.com/asottile).
  - [#&#8203;3565](https://redirect.github.com/pre-commit/pre-commit/issues/3565) issue by [@&#8203;MRigal](https://redirect.github.com/MRigal).
- Add `language: unsupported` / `language: unsupported_script` as aliases
  for `language: system` / `language: script` (which will eventually be
  deprecated).
  - [#&#8203;3577](https://redirect.github.com/pre-commit/pre-commit/issues/3577) PR by [@&#8203;asottile](https://redirect.github.com/asottile).
- Add support docker-in-docker detection for cgroups v2.
  - [#&#8203;3535](https://redirect.github.com/pre-commit/pre-commit/issues/3535) PR by [@&#8203;br-rhrbacek](https://redirect.github.com/br-rhrbacek).
  - [#&#8203;3360](https://redirect.github.com/pre-commit/pre-commit/issues/3360) issue by [@&#8203;JasonAlt](https://redirect.github.com/JasonAlt).

##### Fixes

- Handle when docker gives `SecurityOptions: null`.
  - [#&#8203;3537](https://redirect.github.com/pre-commit/pre-commit/issues/3537) PR by [@&#8203;asottile](https://redirect.github.com/asottile).
  - [#&#8203;3514](https://redirect.github.com/pre-commit/pre-commit/issues/3514) issue by [@&#8203;jenstroeger](https://redirect.github.com/jenstroeger).
- Fix error context for invalid `stages` in `.pre-commit-config.yaml`.
  - [#&#8203;3576](https://redirect.github.com/pre-commit/pre-commit/issues/3576) PR by [@&#8203;asottile](https://redirect.github.com/asottile).

### [`v4.3.0`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#430---2025-08-09)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.2.0...v4.3.0)

\==================

##### Features

- `language: docker` / `language: docker_image`: detect rootless docker.
  - [#&#8203;3446](https://redirect.github.com/pre-commit/pre-commit/issues/3446) PR by [@&#8203;matthewhughes934](https://redirect.github.com/matthewhughes934).
  - [#&#8203;1243](https://redirect.github.com/pre-commit/pre-commit/issues/1243) issue by [@&#8203;dkolepp](https://redirect.github.com/dkolepp).
- `language: julia`: avoid `startup.jl` when executing hooks.
  - [#&#8203;3496](https://redirect.github.com/pre-commit/pre-commit/issues/3496) PR by [@&#8203;ericphanson](https://redirect.github.com/ericphanson).
- `language: dart`: support latest dart versions which require a higher sdk
  lower bound.
  - [#&#8203;3507](https://redirect.github.com/pre-commit/pre-commit/issues/3507) PR by [@&#8203;bc-lee](https://redirect.github.com/bc-lee).

### [`v4.2.0`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#420---2025-03-18)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.1.0...v4.2.0)

\==================

##### Features

- For `language: python` first attempt a versioned python executable for
  the default language version before consulting a potentially unversioned
  `sys.executable`.
  - [#&#8203;3430](https://redirect.github.com/pre-commit/pre-commit/issues/3430) PR by [@&#8203;asottile](https://redirect.github.com/asottile).

##### Fixes

- Handle error during conflict detection when a file is named "HEAD"
  - [#&#8203;3425](https://redirect.github.com/pre-commit/pre-commit/issues/3425) PR by [@&#8203;tusharsadhwani](https://redirect.github.com/tusharsadhwani).

### [`v4.1.0`](https://redirect.github.com/pre-commit/pre-commit/blob/HEAD/CHANGELOG.md#410---2025-01-20)

[Compare Source](https://redirect.github.com/pre-commit/pre-commit/compare/v4.0.1...v4.1.0)

\==================

##### Features

- Add `language: julia`.
  - [#&#8203;3348](https://redirect.github.com/pre-commit/pre-commit/issues/3348) PR by [@&#8203;fredrikekre](https://redirect.github.com/fredrikekre).
  - [#&#8203;2689](https://redirect.github.com/pre-commit/pre-commit/issues/2689) issue [@&#8203;jmuchovej](https://redirect.github.com/jmuchovej).

##### Fixes

- Disable automatic toolchain switching for `language: golang`.
  - [#&#8203;3304](https://redirect.github.com/pre-commit/pre-commit/issues/3304) PR by [@&#8203;AleksaC](https://redirect.github.com/AleksaC).
  - [#&#8203;3300](https://redirect.github.com/pre-commit/pre-commit/issues/3300) issue by [@&#8203;AleksaC](https://redirect.github.com/AleksaC).
  - [#&#8203;3149](https://redirect.github.com/pre-commit/pre-commit/issues/3149) issue by [@&#8203;nijel](https://redirect.github.com/nijel).
- Fix `language: r` installation when initiated by RStudio.
  - [#&#8203;3389](https://redirect.github.com/pre-commit/pre-commit/issues/3389) PR by [@&#8203;lorenzwalthert](https://redirect.github.com/lorenzwalthert).
  - [#&#8203;3385](https://redirect.github.com/pre-commit/pre-commit/issues/3385) issue by [@&#8203;lorenzwalthert](https://redirect.github.com/lorenzwalthert).

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
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45Mi4xIiwidXBkYXRlZEluVmVyIjoiNDIuOTIuMSIsInRhcmdldEJyYW5jaCI6Im1haW4iLCJsYWJlbHMiOlsiZGVwZW5kZW5jaWVzIl19-->

