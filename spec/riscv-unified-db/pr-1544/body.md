This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [pytest](https://redirect.github.com/pytest-dev/pytest) ([changelog](https://docs.pytest.org/en/stable/changelog.html)) | `==8.4.2` → `==9.0.2` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/pytest/9.0.2?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/pytest/8.4.2/9.0.2?slim=true) |

---

### Release Notes

<details>
<summary>pytest-dev/pytest (pytest)</summary>

### [`v9.0.2`](https://redirect.github.com/pytest-dev/pytest/releases/tag/9.0.2)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/9.0.1...9.0.2)

### pytest 9.0.2 (2025-12-06)

#### Bug fixes

- [#&#8203;13896](https://redirect.github.com/pytest-dev/pytest/issues/13896): The terminal progress feature added in pytest 9.0.0 has been disabled by default, except on Windows, due to compatibility issues with some terminal emulators.

  You may enable it again by passing `-p terminalprogress`. We may enable it by default again once compatibility improves in the future.

  Additionally, when the environment variable `TERM` is `dumb`, the escape codes are no longer emitted, even if the plugin is enabled.

- [#&#8203;13904](https://redirect.github.com/pytest-dev/pytest/issues/13904): Fixed the TOML type of the `tmp_path_retention_count` settings in the API reference from number to string.

- [#&#8203;13946](https://redirect.github.com/pytest-dev/pytest/issues/13946): The private `config.inicfg` attribute was changed in a breaking manner in pytest 9.0.0.
  Due to its usage in the ecosystem, it is now restored to working order using a compatibility shim.
  It will be deprecated in pytest 9.1 and removed in pytest 10.

- [#&#8203;13965](https://redirect.github.com/pytest-dev/pytest/issues/13965): Fixed quadratic-time behavior when handling `unittest` subtests in Python 3.10.

#### Improved documentation

- [#&#8203;4492](https://redirect.github.com/pytest-dev/pytest/issues/4492): The API Reference now contains cross-reference-able documentation of `pytest's command-line flags <command-line-flags>`.

### [`v9.0.1`](https://redirect.github.com/pytest-dev/pytest/releases/tag/9.0.1)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/9.0.0...9.0.1)

### pytest 9.0.1 (2025-11-12)

#### Bug fixes

- [#&#8203;13895](https://redirect.github.com/pytest-dev/pytest/issues/13895): Restore support for skipping tests via `raise unittest.SkipTest`.
- [#&#8203;13896](https://redirect.github.com/pytest-dev/pytest/issues/13896): The terminal progress plugin added in pytest 9.0 is now automatically disabled when iTerm2 is detected, it generated desktop notifications instead of the desired functionality.
- [#&#8203;13904](https://redirect.github.com/pytest-dev/pytest/issues/13904): Fixed the TOML type of the verbosity settings in the API reference from number to string.
- [#&#8203;13910](https://redirect.github.com/pytest-dev/pytest/issues/13910): Fixed <span class="title-ref">UserWarning: Do not expect file\_or\_dir</span> on some earlier Python 3.12 and 3.13 point versions.

#### Packaging updates and notes for downstreams

- [#&#8203;13933](https://redirect.github.com/pytest-dev/pytest/issues/13933): The tox configuration has been adjusted to make sure the desired
  version string can be passed into its `package_env` through
  the `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYTEST` environment
  variable as a part of the release process -- by `webknjaz`.

#### Contributor-facing changes

- [#&#8203;13891](https://redirect.github.com/pytest-dev/pytest/issues/13891), [#&#8203;13942](https://redirect.github.com/pytest-dev/pytest/issues/13942): The CI/CD part of the release automation is now capable of
  creating GitHub Releases without having a Git checkout on
  disk -- by `bluetech` and `webknjaz`.
- [#&#8203;13933](https://redirect.github.com/pytest-dev/pytest/issues/13933): The tox configuration has been adjusted to make sure the desired
  version string can be passed into its `package_env` through
  the `SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PYTEST` environment
  variable as a part of the release process -- by `webknjaz`.

### [`v9.0.0`](https://redirect.github.com/pytest-dev/pytest/releases/tag/9.0.0)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/8.4.2...9.0.0)

### pytest 9.0.0 (2025-11-05)

#### New features

- [#&#8203;1367](https://redirect.github.com/pytest-dev/pytest/issues/1367): **Support for subtests** has been added.

  `subtests <subtests>` are an alternative to parametrization, useful in situations where the parametrization values are not all known at collection time.

  Example:

  ```python
  def contains_docstring(p: Path) -> bool:
      """Return True if the given Python file contains a top-level docstring."""
      ...

  def test_py_files_contain_docstring(subtests: pytest.Subtests) -> None:
      for path in Path.cwd().glob("*.py"):
          with subtests.test(path=str(path)):
              assert contains_docstring(path)
  ```

  Each assert failure or error is caught by the context manager and reported individually, giving a clear picture of all files that are missing a docstring.

  In addition, `unittest.TestCase.subTest` is now also supported.

  This feature was originally implemented as a separate plugin in [pytest-subtests](https://redirect.github.com/pytest-dev/pytest-subtests), but since then has been merged into the core.

  > \[!NOTE]
  > This feature is experimental and will likely evolve in future releases. By that we mean that we might change how subtests are reported on failure, but the functionality and how to use it are stable.

- [#&#8203;13743](https://redirect.github.com/pytest-dev/pytest/issues/13743): Added support for **native TOML configuration files**.

  While pytest, since version 6, supports configuration in `pyproject.toml` files under `[tool.pytest.ini_options]`,
  it does so in an "INI compatibility mode", where all configuration values are treated as strings or list of strings.
  Now, pytest supports the native TOML data model.

  In `pyproject.toml`, the native TOML configuration is under the `[tool.pytest]` table.

  ```toml
  # pyproject.toml
  [tool.pytest]
  minversion = "9.0"
  addopts = ["-ra", "-q"]
  testpaths = [
      "tests",
      "integration",
  ]
  ```

  The `[tool.pytest.ini_options]` table remains supported, but both tables cannot be used at the same time.

  If you prefer to use a separate configuration file, or don't use `pyproject.toml`, you can use `pytest.toml` or `.pytest.toml`:

  ```toml
  # pytest.toml or .pytest.toml
  [pytest]
  minversion = "9.0"
  addopts = ["-ra", "-q"]
  testpaths = [
      "tests",
      "integration",
  ]
  ```

  The documentation now (sometimes) shows configuration snippets in both TOML and INI formats, in a tabbed interface.

  See `config file formats` for full details.

- [#&#8203;13823](https://redirect.github.com/pytest-dev/pytest/issues/13823): Added a **"strict mode"** enabled by the `strict` configuration option.

  When set to `true`, the `strict` option currently enables

  - `strict_config`
  - `strict_markers`
  - `strict_parametrization_ids`
  - `strict_xfail`

  The individual strictness options can be explicitly set to override the global `strict` setting.

  The previously-deprecated `--strict` command-line flag now enables strict mode.

  If pytest adds new strictness options in the future, they will also be enabled in strict mode.
  Therefore, you should only enable strict mode if you use a pinned/locked version of pytest,
  or if you want to proactively adopt new strictness options as they are added.

  See `strict mode` for more details.

- [#&#8203;13737](https://redirect.github.com/pytest-dev/pytest/issues/13737): Added the `strict_parametrization_ids` configuration option.

  When set, pytest emits an error if it detects non-unique parameter set IDs,
  rather than automatically making the IDs unique by adding <span class="title-ref">0</span>, <span class="title-ref">1</span>, ... to them.
  This can be particularly useful for catching unintended duplicates.

- [#&#8203;13072](https://redirect.github.com/pytest-dev/pytest/issues/13072): Added support for displaying test session **progress in the terminal tab** using the [OSC 9;4;](https://conemu.github.io/en/AnsiEscapeCodes.html#ConEmu_specific_OSC) ANSI sequence.
  When pytest runs in a supported terminal emulator like ConEmu, Gnome Terminal, Ptyxis, Windows Terminal, Kitty or Ghostty,
  you'll see the progress in the terminal tab or window,
  allowing you to monitor pytest's progress at a glance.

  This feature is automatically enabled when running in a TTY. It is implemented as an internal plugin. If needed, it can be disabled as follows:

  - On a user level, using `-p no:terminalprogress` on the command line or via an environment variable `PYTEST_ADDOPTS='-p no:terminalprogress'`.
  - On a project configuration level, using `addopts = "-p no:terminalprogress"`.

- [#&#8203;478](https://redirect.github.com/pytest-dev/pytest/issues/478): Support PEP420 (implicit namespace packages) as <span class="title-ref">--pyargs</span> target when `consider_namespace_packages` is <span class="title-ref">true</span> in the config.

  Previously, this option only impacted package imports, now it also impacts tests discovery.

- [#&#8203;13678](https://redirect.github.com/pytest-dev/pytest/issues/13678): Added a new `faulthandler_exit_on_timeout` configuration option set to "false" by default to let <span class="title-ref">faulthandler</span> interrupt the <span class="title-ref">pytest</span> process after a timeout in case of deadlock.

  Previously, a <span class="title-ref">faulthandler</span> timeout would only dump the traceback of all threads to stderr, but would not interrupt the <span class="title-ref">pytest</span> process.

  \-- by `ogrisel`.

- [#&#8203;13829](https://redirect.github.com/pytest-dev/pytest/issues/13829): Added support for configuration option aliases via the `aliases` parameter in `Parser.addini() <pytest.Parser.addini>`.

  Plugins can now register alternative names for configuration options,
  allowing for more flexibility in configuration naming and supporting backward compatibility when renaming options.
  The canonical name always takes precedence if both the canonical name and an alias are specified in the configuration file.

#### Improvements in existing functionality

- [#&#8203;13330](https://redirect.github.com/pytest-dev/pytest/issues/13330): Having pytest configuration spread over more than one file (for example having both a `pytest.ini` file and `pyproject.toml` with a `[tool.pytest.ini_options]` table) will now print a warning to make it clearer to the user that only one of them is actually used.

  \-- by `sgaist`

- [#&#8203;13574](https://redirect.github.com/pytest-dev/pytest/issues/13574): The single argument `--version` no longer loads the entire plugin infrastructure, making it faster and more reliable when displaying only the pytest version.

  Passing `--version` twice (e.g., `pytest --version --version`) retains the original behavior, showing both the pytest version and plugin information.

  > \[!NOTE]
  > Since `--version` is now processed early, it only takes effect when passed directly via the command line. It will not work if set through other mechanisms, such as `PYTEST_ADDOPTS` or `addopts`.

- [#&#8203;13823](https://redirect.github.com/pytest-dev/pytest/issues/13823): Added `strict_xfail` as an alias to the `xfail_strict` option,
  `strict_config` as an alias to the `--strict-config` flag,
  and `strict_markers` as an alias to the `--strict-markers` flag.
  This makes all strictness options consistently have configuration options with the prefix `strict_`.

- [#&#8203;13700](https://redirect.github.com/pytest-dev/pytest/issues/13700): <span class="title-ref">--junitxml</span> no longer prints the <span class="title-ref">generated xml file</span> summary at the end of the pytest session when <span class="title-ref">--quiet</span> is given.

- [#&#8203;13732](https://redirect.github.com/pytest-dev/pytest/issues/13732): Previously, when filtering warnings, pytest would fail if the filter referenced a class that could not be imported. Now, this only outputs a message indicating the problem.

- [#&#8203;13859](https://redirect.github.com/pytest-dev/pytest/issues/13859): Clarify the error message for <span class="title-ref">pytest.raises()</span> when a regex <span class="title-ref">match</span> fails.

- [#&#8203;13861](https://redirect.github.com/pytest-dev/pytest/issues/13861): Better sentence structure in a test's expected error message. Previously, the error message would be "expected exception must be \<expected>, but got \<actual>". Now, it is "Expected \<expected>, but got \<actual>".

#### Removals and backward incompatible breaking changes

- [#&#8203;12083](https://redirect.github.com/pytest-dev/pytest/issues/12083): Fixed a bug where an invocation such as <span class="title-ref">pytest a/ a/b</span> would cause only tests from <span class="title-ref">a/b</span> to run, and not other tests under <span class="title-ref">a/</span>.

  The fix entails a few breaking changes to how such overlapping arguments and duplicates are handled:

  1. <span class="title-ref">pytest a/b a/</span> or <span class="title-ref">pytest a/ a/b</span> are equivalent to <span class="title-ref">pytest a</span>; if an argument overlaps another arguments, only the prefix remains.
  2. <span class="title-ref">pytest x.py x.py</span> is equivalent to <span class="title-ref">pytest x.py</span>; previously such an invocation was taken as an explicit request to run the tests from the file twice.

  If you rely on these behaviors, consider using `--keep-duplicates <duplicate-paths>`, which retains its existing behavior (including the bug).

- [#&#8203;13719](https://redirect.github.com/pytest-dev/pytest/issues/13719): Support for Python 3.9 is dropped following its end of life.

- [#&#8203;13766](https://redirect.github.com/pytest-dev/pytest/issues/13766): Previously, pytest would assume it was running in a CI/CD environment if either of the environment variables <span class="title-ref">$CI</span> or <span class="title-ref">$BUILD\_NUMBER</span> was defined;
  now, CI mode is only activated if at least one of those variables is defined and set to a *non-empty* value.

- [#&#8203;13779](https://redirect.github.com/pytest-dev/pytest/issues/13779): **PytestRemovedIn9Warning deprecation warnings are now errors by default.**

  Following our plan to remove deprecated features with as little disruption as
  possible, all warnings of type `PytestRemovedIn9Warning` now generate errors
  instead of warning messages by default.

  **The affected features will be effectively removed in pytest 9.1**, so please consult the
  `deprecations` section in the docs for directions on how to update existing code.

  In the pytest `9.0.X` series, it is possible to change the errors back into warnings as a
  stopgap measure by adding this to your `pytest.ini` file:

  ```ini
  [pytest]
  filterwarnings =
      ignore::pytest.PytestRemovedIn9Warning
  ```

  But this will stop working when pytest `9.1` is released.

  **If you have concerns** about the removal of a specific feature, please add a
  comment to `13779`.

#### Deprecations (removal in next major release)

- [#&#8203;13807](https://redirect.github.com/pytest-dev/pytest/issues/13807): `monkeypatch.syspath_prepend() <pytest.MonkeyPatch.syspath_prepend>` now issues a deprecation warning when the prepended path contains legacy namespace packages (those using `pkg_resources.declare_namespace()`).
  Users should migrate to native namespace packages (`420`).
  See `monkeypatch-fixup-namespace-packages` for details.

#### Bug fixes

- [#&#8203;13445](https://redirect.github.com/pytest-dev/pytest/issues/13445): Made the type annotations of `pytest.skip` and friends more spec-complaint to have them work across more type checkers.

- [#&#8203;13537](https://redirect.github.com/pytest-dev/pytest/issues/13537): Fixed a bug in which `ExceptionGroup` with only `Skipped` exceptions in teardown was not handled correctly and showed as error.

- [#&#8203;13598](https://redirect.github.com/pytest-dev/pytest/issues/13598): Fixed possible collection confusion on Windows when short paths and symlinks are involved.

- [#&#8203;13716](https://redirect.github.com/pytest-dev/pytest/issues/13716): Fixed a bug where a nonsensical invocation like `pytest x.py[a]` (a file cannot be parametrized) was silently treated as `pytest x.py`. This is now a usage error.

- [#&#8203;13722](https://redirect.github.com/pytest-dev/pytest/issues/13722): Fixed a misleading assertion failure message when using `pytest.approx` on mappings with differing lengths.

- [#&#8203;13773](https://redirect.github.com/pytest-dev/pytest/issues/13773): Fixed the static fixture closure calculation to properly consider transitive dependencies requested by overridden fixtures.

- [#&#8203;13816](https://redirect.github.com/pytest-dev/pytest/issues/13816): Fixed `pytest.approx` which now returns a clearer error message when comparing mappings with different keys.

- [#&#8203;13849](https://redirect.github.com/pytest-dev/pytest/issues/13849): Hidden `.pytest.ini` files are now picked up as the config file even if empty.
  This was an inconsistency with non-hidden `pytest.ini`.

- [#&#8203;13865](https://redirect.github.com/pytest-dev/pytest/issues/13865): Fixed <span class="title-ref">--show-capture</span> with <span class="title-ref">--tb=line</span>.

- [#&#8203;13522](https://redirect.github.com/pytest-dev/pytest/issues/13522): Fixed `pytester` in subprocess mode ignored all :attr\`pytester.plugins \<pytest.Pytester.plugins>\` except the first.

  Fixed `pytester` in subprocess mode silently ignored non-str `pytester.plugins <pytest.Pytester.plugins>`.
  Now it errors instead.
  If you are affected by this, specify the plugin by name, or switch the affected tests to use `pytester.runpytest_inprocess <pytest.Pytester.runpytest_inprocess>` explicitly instead.

#### Packaging updates and notes for downstreams

- [#&#8203;13791](https://redirect.github.com/pytest-dev/pytest/issues/13791): Minimum requirements on `iniconfig` and `packaging` were bumped to `1.0.1` and `22.0.0`, respectively.

#### Contributor-facing changes

- [#&#8203;12244](https://redirect.github.com/pytest-dev/pytest/issues/12244): Fixed self-test failures when <span class="title-ref">TERM=dumb</span>.
- [#&#8203;12474](https://redirect.github.com/pytest-dev/pytest/issues/12474): Added scheduled GitHub Action Workflow to run Sphinx linkchecks in repo documentation.
- [#&#8203;13621](https://redirect.github.com/pytest-dev/pytest/issues/13621): pytest's own testsuite now handles the `lsof` command hanging (e.g. due to unreachable network filesystems), with the affected selftests being skipped after 10 seconds.
- [#&#8203;13638](https://redirect.github.com/pytest-dev/pytest/issues/13638): Fixed deprecated `gh pr new` command in `scripts/prepare-release-pr.py`.
  The script now uses `gh pr create` which is compatible with GitHub CLI v2.0+.
- [#&#8203;13695](https://redirect.github.com/pytest-dev/pytest/issues/13695): Flush <span class="title-ref">stdout</span> and <span class="title-ref">stderr</span> in <span class="title-ref">Pytester.run</span> to avoid truncated outputs in <span class="title-ref">test\_faulthandler.py::test\_timeout</span> on CI -- by `ogrisel`.
- [#&#8203;13771](https://redirect.github.com/pytest-dev/pytest/issues/13771): Skip <span class="title-ref">test\_do\_not\_collect\_symlink\_siblings</span> on Windows environments without symlink support to avoid false negatives.
- [#&#8203;13841](https://redirect.github.com/pytest-dev/pytest/issues/13841): `tox>=4` is now required when contributing to pytest.
- [#&#8203;13625](https://redirect.github.com/pytest-dev/pytest/issues/13625): Added missing docstrings to `pytest_addoption()`, `pytest_configure()`, and `cacheshow()` functions in `cacheprovider.py`.

#### Miscellaneous internal changes

- [#&#8203;13830](https://redirect.github.com/pytest-dev/pytest/issues/13830): Configuration overrides (`-o`/`--override-ini`) are now processed during startup rather than during `config.getini() <pytest.Config.getini>`.

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

