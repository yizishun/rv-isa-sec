This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [ruff](https://docs.astral.sh/ruff) ([source](https://redirect.github.com/astral-sh/ruff), [changelog](https://redirect.github.com/astral-sh/ruff/blob/main/CHANGELOG.md)) | `==0.14.14` → `==0.15.0` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/ruff/0.15.0?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/ruff/0.14.14/0.15.0?slim=true) |

---

### Release Notes

<details>
<summary>astral-sh/ruff (ruff)</summary>

### [`v0.15.0`](https://redirect.github.com/astral-sh/ruff/blob/HEAD/CHANGELOG.md#0150)

[Compare Source](https://redirect.github.com/astral-sh/ruff/compare/0.14.14...0.15.0)

Released on 2026-02-03.

Check out the [blog post](https://astral.sh/blog/ruff-v0.15.0) for a migration
guide and overview of the changes!

##### Breaking changes

- Ruff now formats your code according to the 2026 style guide. See the formatter section below or in the blog post for a detailed list of changes.

- The linter now supports block suppression comments. For example, to suppress `N803` for all parameters in this function:

  ```python
  # ruff: disable[N803]
  def foo(
      legacyArg1,
      legacyArg2,
      legacyArg3,
      legacyArg4,
  ): ...
  # ruff: enable[N803]
  ```

  See the [documentation](https://docs.astral.sh/ruff/linter/#block-level) for more details.

- The `ruff:alpine` Docker image is now based on Alpine 3.23 (up from 3.21).

- The `ruff:debian` and `ruff:debian-slim` Docker images are now based on Debian 13 "Trixie" instead of Debian 12 "Bookworm."

- Binaries for the `ppc64` (64-bit big-endian PowerPC) architecture are no longer included in our releases. It should still be possible to build Ruff manually for this platform, if needed.

- Ruff now resolves all `extend`ed configuration files before falling back on a default Python version.

##### Stabilization

The following rules have been stabilized and are no longer in preview:

- [`blocking-http-call-httpx-in-async-function`](https://docs.astral.sh/ruff/rules/blocking-http-call-httpx-in-async-function)
  (`ASYNC212`)
- [`blocking-path-method-in-async-function`](https://docs.astral.sh/ruff/rules/blocking-path-method-in-async-function)
  (`ASYNC240`)
- [`blocking-input-in-async-function`](https://docs.astral.sh/ruff/rules/blocking-input-in-async-function)
  (`ASYNC250`)
- [`map-without-explicit-strict`](https://docs.astral.sh/ruff/rules/map-without-explicit-strict)
  (`B912`)
- [`if-exp-instead-of-or-operator`](https://docs.astral.sh/ruff/rules/if-exp-instead-of-or-operator)
  (`FURB110`)
- [`single-item-membership-test`](https://docs.astral.sh/ruff/rules/single-item-membership-test)
  (`FURB171`)
- [`missing-maxsplit-arg`](https://docs.astral.sh/ruff/rules/missing-maxsplit-arg) (`PLC0207`)
- [`unnecessary-lambda`](https://docs.astral.sh/ruff/rules/unnecessary-lambda) (`PLW0108`)
- [`unnecessary-empty-iterable-within-deque-call`](https://docs.astral.sh/ruff/rules/unnecessary-empty-iterable-within-deque-call)
  (`RUF037`)
- [`in-empty-collection`](https://docs.astral.sh/ruff/rules/in-empty-collection) (`RUF060`)
- [`legacy-form-pytest-raises`](https://docs.astral.sh/ruff/rules/legacy-form-pytest-raises)
  (`RUF061`)
- [`non-octal-permissions`](https://docs.astral.sh/ruff/rules/non-octal-permissions) (`RUF064`)
- [`invalid-rule-code`](https://docs.astral.sh/ruff/rules/invalid-rule-code) (`RUF102`)
- [`invalid-suppression-comment`](https://docs.astral.sh/ruff/rules/invalid-suppression-comment)
  (`RUF103`)
- [`unmatched-suppression-comment`](https://docs.astral.sh/ruff/rules/unmatched-suppression-comment)
  (`RUF104`)
- [`replace-str-enum`](https://docs.astral.sh/ruff/rules/replace-str-enum) (`UP042`)

The following behaviors have been stabilized:

- The `--output-format` flag is now respected when running Ruff in `--watch` mode, and the `full` output format is now used by default, matching the regular CLI output.
- [`builtin-attribute-shadowing`](https://docs.astral.sh/ruff/rules/builtin-attribute-shadowing/) (`A003`) now detects the use of shadowed built-in names in additional contexts like decorators, default arguments, and other attribute definitions.
- [`duplicate-union-member`](https://docs.astral.sh/ruff/rules/duplicate-union-member/) (`PYI016`) now considers `typing.Optional` when searching for duplicate union members.
- [`split-static-string`](https://docs.astral.sh/ruff/rules/split-static-string/) (`SIM905`) now offers an autofix when the `maxsplit` argument is provided, even without a `sep` argument.
- [`dict-get-with-none-default`](https://docs.astral.sh/ruff/rules/dict-get-with-none-default/) (`SIM910`) now applies to more types of key expressions.
- [`super-call-with-parameters`](https://docs.astral.sh/ruff/rules/super-call-with-parameters/) (`UP008`) now has a safe fix when it will not delete comments.
- [`unnecessary-default-type-args`](https://docs.astral.sh/ruff/rules/unnecessary-default-type-args/) (`UP043`) now applies to stub (`.pyi`) files on Python versions before 3.13.

##### Formatter

This release introduces the new 2026 style guide, with the following changes:

- Lambda parameters are now kept on the same line and lambda bodies will be parenthesized to let
  them break across multiple lines ([#&#8203;21385](https://redirect.github.com/astral-sh/ruff/pull/21385))
- Parentheses around tuples of exceptions in `except` clauses will now be removed on Python 3.14 and
  later ([#&#8203;20768](https://redirect.github.com/astral-sh/ruff/pull/20768))
- A single empty line is now permitted at the beginning of function bodies ([#&#8203;21110](https://redirect.github.com/astral-sh/ruff/pull/21110))
- Parentheses are avoided for long `as` captures in `match` statements ([#&#8203;21176](https://redirect.github.com/astral-sh/ruff/pull/21176))
- Extra spaces between escaped quotes and ending triple quotes can now be omitted ([#&#8203;17216](https://redirect.github.com/astral-sh/ruff/pull/17216))
- Blank lines are now enforced before classes with decorators in stub files ([#&#8203;18888](https://redirect.github.com/astral-sh/ruff/pull/18888))

##### Preview features

- Apply formatting to Markdown code blocks ([#&#8203;22470](https://redirect.github.com/astral-sh/ruff/pull/22470), [#&#8203;22990](https://redirect.github.com/astral-sh/ruff/pull/22990), [#&#8203;22996](https://redirect.github.com/astral-sh/ruff/pull/22996))

  See the [documentation](https://docs.astral.sh/ruff/formatter/#markdown-code-formatting) for more details.

##### Bug fixes

- Fix suppression indentation matching ([#&#8203;22903](https://redirect.github.com/astral-sh/ruff/pull/22903))

##### Rule changes

- Customize where the `fix_title` sub-diagnostic appears ([#&#8203;23044](https://redirect.github.com/astral-sh/ruff/pull/23044))
- \[`FastAPI`] Add sub-diagnostic explaining why a fix was unavailable (`FAST002`) ([#&#8203;22565](https://redirect.github.com/astral-sh/ruff/pull/22565))
- \[`flake8-annotations`] Don't suggest `NoReturn` for functions raising `NotImplementedError` (`ANN201`, `ANN202`, `ANN205`, `ANN206`) ([#&#8203;21311](https://redirect.github.com/astral-sh/ruff/pull/21311))
- \[`pyupgrade`] Make fix unsafe if it deletes comments (`UP017`) ([#&#8203;22873](https://redirect.github.com/astral-sh/ruff/pull/22873))
- \[`pyupgrade`] Make fix unsafe if it deletes comments (`UP020`) ([#&#8203;22872](https://redirect.github.com/astral-sh/ruff/pull/22872))
- \[`pyupgrade`] Make fix unsafe if it deletes comments (`UP033`) ([#&#8203;22871](https://redirect.github.com/astral-sh/ruff/pull/22871))
- \[`refurb`] Do not add `abc.ABC` if already present (`FURB180`) ([#&#8203;22234](https://redirect.github.com/astral-sh/ruff/pull/22234))
- \[`refurb`] Make fix unsafe if it deletes comments (`FURB110`) ([#&#8203;22768](https://redirect.github.com/astral-sh/ruff/pull/22768))
- \[`ruff`] Add sub-diagnostics with permissions (`RUF064`) ([#&#8203;22972](https://redirect.github.com/astral-sh/ruff/pull/22972))

##### Server

- Identify notebooks by LSP `didOpen` instead of `.ipynb` file extension ([#&#8203;22810](https://redirect.github.com/astral-sh/ruff/pull/22810))

##### CLI

- Add `--color` CLI option to force colored output ([#&#8203;22806](https://redirect.github.com/astral-sh/ruff/pull/22806))

##### Documentation

- Document `-` stdin convention in CLI help text ([#&#8203;22817](https://redirect.github.com/astral-sh/ruff/pull/22817))
- \[`refurb`] Change example to `re.search` with `^` anchor (`FURB167`) ([#&#8203;22984](https://redirect.github.com/astral-sh/ruff/pull/22984))
- Fix link to Sphinx code block directives ([#&#8203;23041](https://redirect.github.com/astral-sh/ruff/pull/23041))
- \[`pydocstyle`] Clarify which quote styles are allowed (`D300`) ([#&#8203;22825](https://redirect.github.com/astral-sh/ruff/pull/22825))
- \[`flake8-bugbear`] Improve docs for `no-explicit-stacklevel` (`B028`) ([#&#8203;22538](https://redirect.github.com/astral-sh/ruff/pull/22538))

##### Other changes

- Update MSRV to 1.91 ([#&#8203;22874](https://redirect.github.com/astral-sh/ruff/pull/22874))

##### Contributors

- [@&#8203;danparizher](https://redirect.github.com/danparizher)
- [@&#8203;chirizxc](https://redirect.github.com/chirizxc)
- [@&#8203;amyreese](https://redirect.github.com/amyreese)
- [@&#8203;Jkhall81](https://redirect.github.com/Jkhall81)
- [@&#8203;cwkang1998](https://redirect.github.com/cwkang1998)
- [@&#8203;manzt](https://redirect.github.com/manzt)
- [@&#8203;11happy](https://redirect.github.com/11happy)
- [@&#8203;hugovk](https://redirect.github.com/hugovk)
- [@&#8203;caiquejjx](https://redirect.github.com/caiquejjx)
- [@&#8203;ntBre](https://redirect.github.com/ntBre)
- [@&#8203;akawd](https://redirect.github.com/akawd)
- [@&#8203;konstin](https://redirect.github.com/konstin)

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

