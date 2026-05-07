This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [ruff](https://docs.astral.sh/ruff) ([source](https://redirect.github.com/astral-sh/ruff), [changelog](https://redirect.github.com/astral-sh/ruff/blob/main/CHANGELOG.md)) | `==0.14.11` → `==0.14.14` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/ruff/0.14.14?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/ruff/0.14.11/0.14.14?slim=true) |

---

### Release Notes

<details>
<summary>astral-sh/ruff (ruff)</summary>

### [`v0.14.14`](https://redirect.github.com/astral-sh/ruff/blob/HEAD/CHANGELOG.md#01414)

[Compare Source](https://redirect.github.com/astral-sh/ruff/compare/0.14.13...0.14.14)

Released on 2026-01-22.

##### Preview features

- Preserve required parentheses in lambda bodies ([#&#8203;22747](https://redirect.github.com/astral-sh/ruff/pull/22747))
- Combine range suppression code diagnostics ([#&#8203;22613](https://redirect.github.com/astral-sh/ruff/pull/22613))
- \[`airflow`] Second positional argument to `Asset`/`Dataset` should not be a dictionary (`AIR303`) ([#&#8203;22453](https://redirect.github.com/astral-sh/ruff/pull/22453))
- \[`ruff`] Detect duplicate entries in `__all__` (`RUF068`) ([#&#8203;22114](https://redirect.github.com/astral-sh/ruff/pull/22114))

##### Bug fixes

- \[`pyupgrade`] Allow shadowing non-builtin bindings (`UP029`) ([#&#8203;22749](https://redirect.github.com/astral-sh/ruff/pull/22749))
- \[`pyupgrade`] Apply `UP045` to string arguments of `typing.cast` ([#&#8203;22320](https://redirect.github.com/astral-sh/ruff/pull/22320))
- \[`flake8-pie`] Detect duplicated declared class fields in `PIE794` ([#&#8203;22717](https://redirect.github.com/astral-sh/ruff/pull/22717))

##### Rule changes

- \[`flake8-pyi`] Fix inconsistent handling of forward references for `__new__`, `__enter__`, `__aenter__` in `PYI034` ([#&#8203;22798](https://redirect.github.com/astral-sh/ruff/pull/22798))
- \[`flake8-pytest-style`] Support `check` parameter in `PT011` ([#&#8203;22725](https://redirect.github.com/astral-sh/ruff/pull/22725))
- \[`ruff`] Add exception for `ctypes.Structure._fields_` (`RUF012`) ([#&#8203;22559](https://redirect.github.com/astral-sh/ruff/pull/22559))
- Many fixes are now marked unsafe if they would remove comments:
  - \[`flake8-bugbear`] [`B009`](https://redirect.github.com/astral-sh/ruff/pull/22656), [`B010`](https://redirect.github.com/astral-sh/ruff/pull/22657), [`B013`](https://redirect.github.com/astral-sh/ruff/pull/22658), [`B014`](https://redirect.github.com/astral-sh/ruff/pull/22659), [`B033`](https://redirect.github.com/astral-sh/ruff/pull/22632)
  - \[`flake8-simplify`] [`SIM910`](https://redirect.github.com/astral-sh/ruff/pull/22662), [`SIM911`](https://redirect.github.com/astral-sh/ruff/pull/22661)
  - \[`pyupgrade`] [`UP007`](https://redirect.github.com/astral-sh/ruff/pull/22772), [`UP039`](https://redirect.github.com/astral-sh/ruff/pull/22774), [`UP041`](https://redirect.github.com/astral-sh/ruff/pull/22773), [`UP045`](https://redirect.github.com/astral-sh/ruff/pull/22772)
  - \[`refurb`] [`FURB105`](https://redirect.github.com/astral-sh/ruff/pull/22767), [`FURB116`](https://redirect.github.com/astral-sh/ruff/pull/22681), [`FURB136`](https://redirect.github.com/astral-sh/ruff/pull/22680), [`FURB140`](https://redirect.github.com/astral-sh/ruff/pull/22679), [`FURB145`](https://redirect.github.com/astral-sh/ruff/pull/22670), [`FURB154`](https://redirect.github.com/astral-sh/ruff/pull/22669), [`FURB157`](https://redirect.github.com/astral-sh/ruff/pull/22668), [`FURB164`](https://redirect.github.com/astral-sh/ruff/pull/22667),[`FURB181`](https://redirect.github.com/astral-sh/ruff/pull/22666), [`FURB188`](https://redirect.github.com/astral-sh/ruff/pull/22665)
  - \[`ruff`] [`RUF019`](https://redirect.github.com/astral-sh/ruff/pull/22663), [`RUF020`](https://redirect.github.com/astral-sh/ruff/pull/22664)

##### Documentation

- Add `--exit-non-zero-on-format` to formatter exit codes section ([#&#8203;22761](https://redirect.github.com/astral-sh/ruff/pull/22761))
- Update contributing guide for adding a new rule ([#&#8203;22779](https://redirect.github.com/astral-sh/ruff/pull/22779))
- \[`FastAPI`] Document fix safety for `FAST001` ([#&#8203;22655](https://redirect.github.com/astral-sh/ruff/pull/22655))
- \[`flake8-async`] Tweak explanation to focus on latency/efficiency tradeoff (`ASYNC110`) ([#&#8203;22715](https://redirect.github.com/astral-sh/ruff/pull/22715))
- \[`pandas-vet`] Make example error out-of-the-box (`PD002`) ([#&#8203;22561](https://redirect.github.com/astral-sh/ruff/pull/22561))
- \[`refurb`] Make the example work out of box (`FURB101`) ([#&#8203;22770](https://redirect.github.com/astral-sh/ruff/pull/22770))
- \[`refurb`] Make the example work out of box (`FURB103`) ([#&#8203;22769](https://redirect.github.com/astral-sh/ruff/pull/22769))

##### Contributors

- [@&#8203;alejsdev](https://redirect.github.com/alejsdev)
- [@&#8203;ntBre](https://redirect.github.com/ntBre)
- [@&#8203;caiquejjx](https://redirect.github.com/caiquejjx)
- [@&#8203;chirizxc](https://redirect.github.com/chirizxc)
- [@&#8203;denyszhak](https://redirect.github.com/denyszhak)
- [@&#8203;sjyangkevin](https://redirect.github.com/sjyangkevin)
- [@&#8203;MeGaGiGaGon](https://redirect.github.com/MeGaGiGaGon)
- [@&#8203;leandrobbraga](https://redirect.github.com/leandrobbraga)
- [@&#8203;MichaReiser](https://redirect.github.com/MichaReiser)
- [@&#8203;carljm](https://redirect.github.com/carljm)
- [@&#8203;amyreese](https://redirect.github.com/amyreese)
- [@&#8203;zsol](https://redirect.github.com/zsol)
- [@&#8203;harupy](https://redirect.github.com/harupy)

### [`v0.14.13`](https://redirect.github.com/astral-sh/ruff/blob/HEAD/CHANGELOG.md#01413)

Released on 2026-01-15.

This is a follow-up release to 0.14.12. Because of an issue publishing the WASM packages, there is no GitHub release or Git tag for 0.14.12, although the package was published to PyPI. The contents of the 0.14.13 release are identical to 0.14.12.

### [`v0.14.12`](https://redirect.github.com/astral-sh/ruff/blob/HEAD/CHANGELOG.md#01412)

Released on 2026-01-15.

##### Preview features

- \[`flake8-blind-except`] Allow more logging methods (`BLE001`) ([#&#8203;22057](https://redirect.github.com/astral-sh/ruff/pull/22057))
- \[`ruff`] Respect `lint.pydocstyle.property-decorators` in `RUF066` ([#&#8203;22515](https://redirect.github.com/astral-sh/ruff/pull/22515))

##### Bug fixes

- Fix configuration path in `--show-settings` ([#&#8203;22478](https://redirect.github.com/astral-sh/ruff/pull/22478))
- Respect `fmt: skip` for multiple statements on the same logical line ([#&#8203;22119](https://redirect.github.com/astral-sh/ruff/pull/22119))

##### Rule changes

- \[`pydocstyle`] Update Rust crate imperative to v1.0.7 (`D401`) ([#&#8203;22519](https://redirect.github.com/astral-sh/ruff/pull/22519))
- \[`isort`] Insert imports in alphabetical order (`I002`) ([#&#8203;22493](https://redirect.github.com/astral-sh/ruff/pull/22493))

##### Documentation

- Add llms.txt support for documentation ([#&#8203;22463](https://redirect.github.com/astral-sh/ruff/pull/22463))
- Use prek in documentation and CI ([#&#8203;22505](https://redirect.github.com/astral-sh/ruff/pull/22505))
- \[`flake8-pytest-style`] Add `check` parameter example to `PT017` docs ([#&#8203;22546](https://redirect.github.com/astral-sh/ruff/pull/22546))
- \[`ruff`] Make example error out-of-the-box (`RUF103`) ([#&#8203;22558](https://redirect.github.com/astral-sh/ruff/pull/22558))
- \[`ruff`] document `RUF100` trailing comment fix behavior ([#&#8203;22479](https://redirect.github.com/astral-sh/ruff/pull/22479))

##### Other changes

- wasm: Require explicit logging initialization ([#&#8203;22587](https://redirect.github.com/astral-sh/ruff/pull/22587))

##### Contributors

- [@&#8203;terror](https://redirect.github.com/terror)
- [@&#8203;harupy](https://redirect.github.com/harupy)
- [@&#8203;Jkhall81](https://redirect.github.com/Jkhall81)
- [@&#8203;dhruvmanila](https://redirect.github.com/dhruvmanila)
- [@&#8203;lubaskinc0de](https://redirect.github.com/lubaskinc0de)
- [@&#8203;zanieb](https://redirect.github.com/zanieb)
- [@&#8203;MeGaGiGaGon](https://redirect.github.com/MeGaGiGaGon)
- [@&#8203;charliermarsh](https://redirect.github.com/charliermarsh)
- [@&#8203;renovate](https://redirect.github.com/renovate)
- [@&#8203;dylwil3](https://redirect.github.com/dylwil3)
- [@&#8203;MichaReiser](https://redirect.github.com/MichaReiser)
- [@&#8203;11happy](https://redirect.github.com/11happy)

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

