This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [pytest](https://redirect.github.com/pytest-dev/pytest) ([changelog](https://docs.pytest.org/en/stable/changelog.html)) | `==8.3.4` → `==8.4.2` | ![age](https://developer.mend.io/api/mc/badges/age/pypi/pytest/8.4.2?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/pypi/pytest/8.3.4/8.4.2?slim=true) |

---

### Release Notes

<details>
<summary>pytest-dev/pytest (pytest)</summary>

### [`v8.4.2`](https://redirect.github.com/pytest-dev/pytest/releases/tag/8.4.2)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/8.4.1...8.4.2)

### pytest 8.4.2 (2025-09-03)

#### Bug fixes

- [#&#8203;13478](https://redirect.github.com/pytest-dev/pytest/issues/13478): Fixed a crash when using `console_output_style`{.interpreted-text role="confval"} with `times` and a module is skipped.

- [#&#8203;13530](https://redirect.github.com/pytest-dev/pytest/issues/13530): Fixed a crash when using `pytest.approx`{.interpreted-text role="func"} and `decimal.Decimal`{.interpreted-text role="class"} instances with the `decimal.FloatOperation`{.interpreted-text role="class"} trap set.

- [#&#8203;13549](https://redirect.github.com/pytest-dev/pytest/issues/13549): No longer evaluate type annotations in Python `3.14` when inspecting function signatures.

  This prevents crashes during module collection when modules do not explicitly use `from __future__ import annotations` and import types for annotations within a `if TYPE_CHECKING:` block.

- [#&#8203;13559](https://redirect.github.com/pytest-dev/pytest/issues/13559): Added missing \[int]{.title-ref} and \[float]{.title-ref} variants to the \[Literal]{.title-ref} type annotation of the \[type]{.title-ref} parameter in `pytest.Parser.addini`{.interpreted-text role="meth"}.

- [#&#8203;13563](https://redirect.github.com/pytest-dev/pytest/issues/13563): `pytest.approx`{.interpreted-text role="func"} now only imports `numpy` if NumPy is already in `sys.modules`. This fixes unconditional import behavior introduced in \[8.4.0]{.title-ref}.

#### Improved documentation

- [#&#8203;13577](https://redirect.github.com/pytest-dev/pytest/issues/13577): Clarify that `pytest_generate_tests` is discovered in test modules/classes; other hooks must be in `conftest.py` or plugins.

#### Contributor-facing changes

- [#&#8203;13480](https://redirect.github.com/pytest-dev/pytest/issues/13480): Self-testing: fixed a few test failures when run with `-Wdefault` or a similar override.
- [#&#8203;13547](https://redirect.github.com/pytest-dev/pytest/issues/13547): Self-testing: corrected expected message for `test_doctest_unexpected_exception` in Python `3.14`.
- [#&#8203;13684](https://redirect.github.com/pytest-dev/pytest/issues/13684): Make pytest's own testsuite insensitive to the presence of the `CI` environment variable -- by `ogrisel`{.interpreted-text role="user"}.

### [`v8.4.1`](https://redirect.github.com/pytest-dev/pytest/releases/tag/8.4.1)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/8.4.0...8.4.1)

### pytest 8.4.1 (2025-06-17)

#### Bug fixes

- [#&#8203;13461](https://redirect.github.com/pytest-dev/pytest/issues/13461): Corrected `_pytest.terminal.TerminalReporter.isatty` to support
  being called as a method. Before it was just a boolean which could
  break correct code when using `-o log_cli=true`).

- [#&#8203;13477](https://redirect.github.com/pytest-dev/pytest/issues/13477): Reintroduced `pytest.PytestReturnNotNoneWarning`{.interpreted-text role="class"} which was removed by accident in pytest \[8.4]{.title-ref}.

  This warning is raised when a test functions returns a value other than `None`, which is often a mistake made by beginners.

  See `return-not-none`{.interpreted-text role="ref"} for more information.

- [#&#8203;13497](https://redirect.github.com/pytest-dev/pytest/issues/13497): Fixed compatibility with `Twisted 25+`.

#### Improved documentation

- [#&#8203;13492](https://redirect.github.com/pytest-dev/pytest/issues/13492): Fixed outdated warning about `faulthandler` not working on Windows.

### [`v8.4.0`](https://redirect.github.com/pytest-dev/pytest/releases/tag/8.4.0)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/8.3.5...8.4.0)

### pytest 8.4.0 (2025-06-02)

#### Removals and backward incompatible breaking changes

- [#&#8203;11372](https://redirect.github.com/pytest-dev/pytest/issues/11372): Async tests will now fail, instead of warning+skipping, if you don't have any suitable plugin installed.

- [#&#8203;12346](https://redirect.github.com/pytest-dev/pytest/issues/12346): Tests will now fail, instead of raising a warning, if they return any value other than None.

- [#&#8203;12874](https://redirect.github.com/pytest-dev/pytest/issues/12874): We dropped support for Python 3.8 following its end of life (2024-10-07).

- [#&#8203;12960](https://redirect.github.com/pytest-dev/pytest/issues/12960): Test functions containing a yield now cause an explicit error. They have not been run since pytest 4.0, and were previously marked as an expected failure and deprecation warning.

  See `the docs <yield tests deprecated>`{.interpreted-text role="ref"} for more information.

#### Deprecations (removal in next major release)

- [#&#8203;10839](https://redirect.github.com/pytest-dev/pytest/issues/10839): Requesting an asynchronous fixture without a \[pytest\_fixture\_setup]{.title-ref} hook that resolves it will now give a DeprecationWarning. This most commonly happens if a sync test requests an async fixture. This should have no effect on a majority of users with async tests or fixtures using async pytest plugins, but may affect non-standard hook setups or `autouse=True`. For guidance on how to work around this warning see `sync-test-async-fixture`{.interpreted-text role="ref"}.

#### New features

- [#&#8203;11538](https://redirect.github.com/pytest-dev/pytest/issues/11538): Added `pytest.RaisesGroup`{.interpreted-text role="class"} as an equivalent to `pytest.raises`{.interpreted-text role="func"} for expecting `ExceptionGroup`{.interpreted-text role="exc"}. Also adds `pytest.RaisesExc`{.interpreted-text role="class"} which is now the logic behind `pytest.raises`{.interpreted-text role="func"} and used as parameter to `pytest.RaisesGroup`{.interpreted-text role="class"}. `RaisesGroup` includes the ability to specify multiple different expected exceptions, the structure of nested exception groups, and flags for emulating `except* <except_star>`{.interpreted-text role="ref"}. See `assert-matching-exception-groups`{.interpreted-text role="ref"} and docstrings for more information.

- [#&#8203;12081](https://redirect.github.com/pytest-dev/pytest/issues/12081): Added `capteesys`{.interpreted-text role="fixture"} to capture AND pass output to next handler set by `--capture=`.

- [#&#8203;12504](https://redirect.github.com/pytest-dev/pytest/issues/12504): `pytest.mark.xfail`{.interpreted-text role="func"} now accepts `pytest.RaisesGroup`{.interpreted-text role="class"} for the `raises` parameter when you expect an exception group. You can also pass a `pytest.RaisesExc`{.interpreted-text role="class"} if you e.g. want to make use of the `check` parameter.

- [#&#8203;12713](https://redirect.github.com/pytest-dev/pytest/issues/12713): New \[--force-short-summary]{.title-ref} option to force condensed summary output regardless of verbosity level.

  This lets users still see condensed summary output of failures for quick reference in log files from job outputs, being especially useful if non-condensed output is very verbose.

- [#&#8203;12749](https://redirect.github.com/pytest-dev/pytest/issues/12749): pytest traditionally collects classes/functions in the test module namespace even if they are imported from another file.

  For example:

  ```python
  ```

### contents of src/domain.py

```
class Testament: ...
```

### contents of tests/test\_testament.py

````
from domain import Testament

def test_testament(): ...
```

In this scenario with the default options, pytest will collect the class [Testament]{.title-ref} from [tests/test_testament.py]{.title-ref} because it starts with [Test]{.title-ref}, even though in this case it is a production class being imported in the test module namespace.

This behavior can now be prevented by setting the new `collect_imported_tests`{.interpreted-text role="confval"} configuration option to `false`, which will make pytest collect classes/functions from test files **only** if they are defined in that file.

\-- by `FreerGit`{.interpreted-text role="user"}
````

- [#&#8203;12765](https://redirect.github.com/pytest-dev/pytest/issues/12765): Thresholds to trigger snippet truncation can now be set with `truncation_limit_lines`{.interpreted-text role="confval"} and `truncation_limit_chars`{.interpreted-text role="confval"}.

  See `truncation-params`{.interpreted-text role="ref"} for more information.

- [#&#8203;13125](https://redirect.github.com/pytest-dev/pytest/issues/13125): `console_output_style`{.interpreted-text role="confval"} now supports `times` to show execution time of each test.

- [#&#8203;13192](https://redirect.github.com/pytest-dev/pytest/issues/13192): `pytest.raises`{.interpreted-text role="func"} will now raise a warning when passing an empty string to `match`, as this will match against any value. Use `match="^$"` if you want to check that an exception has no message.

- [#&#8203;13192](https://redirect.github.com/pytest-dev/pytest/issues/13192): `pytest.raises`{.interpreted-text role="func"} will now print a helpful string diff if matching fails and the match parameter has `^` and `$` and is otherwise escaped.

- [#&#8203;13192](https://redirect.github.com/pytest-dev/pytest/issues/13192): You can now pass `with pytest.raises(check=fn): <pytest.raises>`{.interpreted-text role="func"}, where `fn` is a function which takes a raised exception and returns a boolean. The `raises` fails if no exception was raised (as usual), passes if an exception is raised and `fn` returns `True` (as well as `match` and the type matching, if specified, which are checked before), and propagates the exception if `fn` returns `False` (which likely also fails the test).

- [#&#8203;13228](https://redirect.github.com/pytest-dev/pytest/issues/13228): `hidden-param`{.interpreted-text role="ref"} can now be used in `id` of `pytest.param`{.interpreted-text role="func"} or in
  `ids` of `Metafunc.parametrize <pytest.Metafunc.parametrize>`{.interpreted-text role="py:func"}.
  It hides the parameter set from the test name.

- [#&#8203;13253](https://redirect.github.com/pytest-dev/pytest/issues/13253): New flag: `--disable-plugin-autoload <disable_plugin_autoload>`{.interpreted-text role="ref"} which works as an alternative to `PYTEST_DISABLE_PLUGIN_AUTOLOAD`{.interpreted-text role="envvar"} when setting environment variables is inconvenient; and allows setting it in config files with `addopts`{.interpreted-text role="confval"}.

#### Improvements in existing functionality

- [#&#8203;10224](https://redirect.github.com/pytest-dev/pytest/issues/10224): pytest's `short` and `long` traceback styles (`how-to-modifying-python-tb-printing`{.interpreted-text role="ref"})
  now have partial `657`{.interpreted-text role="pep"} support and will show specific code segments in the
  traceback.

  ```pytest
  ================================= FAILURES =================================
  _______________________ test_gets_correct_tracebacks _______________________

  test_tracebacks.py:12: in test_gets_correct_tracebacks
      assert manhattan_distance(p1, p2) == 1
             ^^^^^^^^^^^^^^^^^^^^^^^^^^
  test_tracebacks.py:6: in manhattan_distance
      return abs(point_1.x - point_2.x) + abs(point_1.y - point_2.y)
                             ^^^^^^^^^
  E   AttributeError: 'NoneType' object has no attribute 'x'
  ```

  \-- by `ammaraskar`{.interpreted-text role="user"}

- [#&#8203;11118](https://redirect.github.com/pytest-dev/pytest/issues/11118): Now `pythonpath`{.interpreted-text role="confval"} configures \[$PYTHONPATH]{.title-ref} earlier than before during the initialization process, which now also affects plugins loaded via the \[-p]{.title-ref} command-line option.

  \-- by `millerdev`{.interpreted-text role="user"}

- [#&#8203;11381](https://redirect.github.com/pytest-dev/pytest/issues/11381): The `type` parameter of the `parser.addini` method now accepts \["int"]{.title-ref} and `"float"` parameters, facilitating the parsing of configuration values in the configuration file.

  Example:

  ```python
  def pytest_addoption(parser):
      parser.addini("int_value", type="int", default=2, help="my int value")
      parser.addini("float_value", type="float", default=4.2, help="my float value")
  ```

  The \[pytest.ini]{.title-ref} file:

  ```ini
  [pytest]
  int_value = 3
  float_value = 5.4
  ```

- [#&#8203;11525](https://redirect.github.com/pytest-dev/pytest/issues/11525): Fixtures are now clearly represented in the output as a "fixture object", not as a normal function as before, making it easy for beginners to catch mistakes such as referencing a fixture declared in the same module but not requested in the test function.

  \-- by `the-compiler`{.interpreted-text role="user"} and `glyphack`{.interpreted-text role="user"}

- [#&#8203;12426](https://redirect.github.com/pytest-dev/pytest/issues/12426): A warning is now issued when `pytest.mark.usefixtures ref`{.interpreted-text role="ref"} is used without specifying any fixtures. Previously, empty usefixtures markers were silently ignored.

- [#&#8203;12707](https://redirect.github.com/pytest-dev/pytest/issues/12707): Exception chains can be navigated when dropped into Pdb in Python 3.13+.

- [#&#8203;12736](https://redirect.github.com/pytest-dev/pytest/issues/12736): Added a new attribute \[name]{.title-ref} with the fixed value \["pytest tests"]{.title-ref} to the root tag \[testsuites]{.title-ref} of the junit-xml generated by pytest.

  This attribute is part of many junit-xml specifications and is even part of the \[junit-10.xsd]{.title-ref} specification that pytest's implementation is based on.

- [#&#8203;12943](https://redirect.github.com/pytest-dev/pytest/issues/12943): If a test fails with an exceptiongroup with a single exception, the contained exception will now be displayed in the short test summary info.

- [#&#8203;12958](https://redirect.github.com/pytest-dev/pytest/issues/12958): A number of `unraisable <unraisable>`{.interpreted-text role="ref"} enhancements:

  - Set the unraisable hook as early as possible and unset it as late as possible, to collect the most possible number of unraisable exceptions.
  - Call the garbage collector just before unsetting the unraisable hook, to collect any straggling exceptions.
  - Collect multiple unraisable exceptions per test phase.
  - Report the `tracemalloc`{.interpreted-text role="mod"} allocation traceback (if available).
  - Avoid using a generator based hook to allow handling `StopIteration`{.interpreted-text role="class"} in test failures.
  - Report the unraisable exception as the cause of the `pytest.PytestUnraisableExceptionWarning`{.interpreted-text role="class"} exception if raised.
  - Compute the `repr` of the unraisable object in the unraisable hook so you get the latest information if available, and should help with resurrection of the object.

- [#&#8203;13010](https://redirect.github.com/pytest-dev/pytest/issues/13010): `pytest.approx`{.interpreted-text role="func"} now can compare collections that contain numbers and non-numbers mixed.

- [#&#8203;13016](https://redirect.github.com/pytest-dev/pytest/issues/13016): A number of `threadexception <unraisable>`{.interpreted-text role="ref"} enhancements:

  - Set the excepthook as early as possible and unset it as late as possible, to collect the most possible number of unhandled exceptions from threads.
  - Collect multiple thread exceptions per test phase.
  - Report the `tracemalloc`{.interpreted-text role="mod"} allocation traceback (if available).
  - Avoid using a generator based hook to allow handling `StopIteration`{.interpreted-text role="class"} in test failures.
  - Report the thread exception as the cause of the `pytest.PytestUnhandledThreadExceptionWarning`{.interpreted-text role="class"} exception if raised.
  - Extract the `name` of the thread object in the excepthook which should help with resurrection of the thread.

- [#&#8203;13031](https://redirect.github.com/pytest-dev/pytest/issues/13031): An empty parameter set as in `pytest.mark.parametrize([], ids=idfunc)` will no longer trigger a call to `idfunc` with internal objects.

- [#&#8203;13115](https://redirect.github.com/pytest-dev/pytest/issues/13115): Allows supplying `ExceptionGroup[Exception]` and `BaseExceptionGroup[BaseException]` to `pytest.raises` to keep full typing on `ExceptionInfo <pytest.ExceptionInfo>`{.interpreted-text role="class"}:

  ```python
  with pytest.raises(ExceptionGroup[Exception]) as exc_info:
      some_function()
  ```

  Parametrizing with other exception types remains an error - we do not check the types of child exceptions and thus do not permit code that might look like we do.

- [#&#8203;13122](https://redirect.github.com/pytest-dev/pytest/issues/13122): The `--stepwise` mode received a number of improvements:

  - It no longer forgets the last failed test in case pytest is executed later without the flag.

    This enables the following workflow:

    1. Execute pytest with `--stepwise`, pytest then stops at the first failing test;
    2. Iteratively update the code and run the test in isolation, without the `--stepwise` flag (for example in an IDE), until it is fixed.
    3. Execute pytest with `--stepwise` again and pytest will continue from the previously failed test, and if it passes, continue on to the next tests.

    Previously, at step 3, pytest would start from the beginning, forgetting the previously failed test.

    This change however might cause issues if the `--stepwise` mode is used far apart in time, as the state might get stale, so the internal state will be reset automatically in case the test suite changes (for now only the number of tests are considered for this, we might change/improve this on the future).

  - New `--stepwise-reset`/`--sw-reset` flag, allowing the user to explicitly reset the stepwise state and restart the workflow from the beginning.

- [#&#8203;13308](https://redirect.github.com/pytest-dev/pytest/issues/13308): Added official support for Python 3.14.

- [#&#8203;13380](https://redirect.github.com/pytest-dev/pytest/issues/13380): Fix `ExceptionGroup`{.interpreted-text role="class"} traceback filtering to exclude pytest internals.

- [#&#8203;13415](https://redirect.github.com/pytest-dev/pytest/issues/13415): The author metadata of the BibTex example is now correctly formatted with last names following first names.
  An example of BibLaTex has been added.
  BibTex and BibLaTex examples now clearly indicate that what is cited is software.

  \-- by `willynilly`{.interpreted-text role="user"}

- [#&#8203;13420](https://redirect.github.com/pytest-dev/pytest/issues/13420): Improved test collection performance by optimizing path resolution used in `FSCollector`.

- [#&#8203;13457](https://redirect.github.com/pytest-dev/pytest/issues/13457): The error message about duplicate parametrization no longer displays an internal stack trace.

- [#&#8203;4112](https://redirect.github.com/pytest-dev/pytest/issues/4112): Using `pytest.mark.usefixtures <pytest.mark.usefixtures ref>`{.interpreted-text role="ref"} on `pytest.param`{.interpreted-text role="func"} now produces an error instead of silently doing nothing.

- [#&#8203;5473](https://redirect.github.com/pytest-dev/pytest/issues/5473): Replace \[:]{.title-ref} with \[;]{.title-ref} in the assertion rewrite warning message so it can be filtered using standard Python warning filters before calling `pytest.main`{.interpreted-text role="func"}.

-

```
[#&#8203;6985](https://redirect.github.com/pytest-dev/pytest/issues/6985): Improved `pytest.approx`{.interpreted-text role="func"} to enhance the readability of value ranges and tolerances between 0.001 and 1000.
```

````
:   -   The [repr]{.title-ref} method now provides clearer output for values within those ranges, making it easier to interpret the results.

    -   Previously, the output for those ranges of values and tolerances was displayed in scientific notation (e.g., [42 ± 1.0e+00]{.title-ref}). The updated method now presents the tolerance as a decimal for better readability (e.g., [42 ± 1]{.title-ref}).

        Example:

        **Previous Output:**

        ``` console
        >>> pytest.approx(42, abs=1)
        42 ± 1.0e+00
        ```

        **Current Output:**

        ``` console
        >>> pytest.approx(42, abs=1)
        42 ± 1
        ```

    \-- by `fazeelghafoor`{.interpreted-text role="user"}
````

- [#&#8203;7683](https://redirect.github.com/pytest-dev/pytest/issues/7683): The formerly optional `pygments` dependency is now required, causing output always to be source-highlighted (unless disabled via the `--code-highlight=no` CLI option).

#### Bug fixes

- [#&#8203;10404](https://redirect.github.com/pytest-dev/pytest/issues/10404): Apply filterwarnings from config/cli as soon as possible, and revert them as late as possible
  so that warnings as errors are collected throughout the pytest run and before the
  unraisable and threadexcept hooks are removed.

  This allows very late warnings and unraisable/threadexcept exceptions to fail the test suite.

  This also changes the warning that the lsof plugin issues from PytestWarning to the new warning PytestFDWarning so it can be more easily filtered.

- [#&#8203;11067](https://redirect.github.com/pytest-dev/pytest/issues/11067): The test report is now consistent regardless if the test xfailed via `pytest.mark.xfail <pytest.mark.xfail ref>`{.interpreted-text role="ref"} or `pytest.fail`{.interpreted-text role="func"}.

  Previously, *xfailed* tests via the marker would have the string `"reason: "` prefixed to the message, while those *xfailed* via the function did not. The prefix has been removed.

- [#&#8203;12008](https://redirect.github.com/pytest-dev/pytest/issues/12008): In `11220`{.interpreted-text role="pr"}, an unintended change in reordering was introduced by changing the way indices were assigned to direct params. More specifically, before that change, the indices of direct params to metafunc's callspecs were assigned after all parametrizations took place. Now, that change is reverted.

- [#&#8203;12863](https://redirect.github.com/pytest-dev/pytest/issues/12863): Fix applying markers, including `pytest.mark.parametrize <pytest.mark.parametrize ref>`{.interpreted-text role="ref"} when placed above \[[@&#8203;staticmethod](https://redirect.github.com/staticmethod)]{.title-ref} or \[[@&#8203;classmethod](https://redirect.github.com/classmethod)]{.title-ref}.

- [#&#8203;12929](https://redirect.github.com/pytest-dev/pytest/issues/12929): Handle StopIteration from test cases, setup and teardown correctly.

- [#&#8203;12938](https://redirect.github.com/pytest-dev/pytest/issues/12938): Fixed `--durations-min` argument not respected if `-vv` is used.

- [#&#8203;12946](https://redirect.github.com/pytest-dev/pytest/issues/12946): Fixed missing help for `pdb`{.interpreted-text role="mod"} commands wrapped by pytest -- by `adamchainz`{.interpreted-text role="user"}.

- [#&#8203;12981](https://redirect.github.com/pytest-dev/pytest/issues/12981): Prevent exceptions in `pytest.Config.add_cleanup`{.interpreted-text role="func"} callbacks preventing further cleanups.

- [#&#8203;13047](https://redirect.github.com/pytest-dev/pytest/issues/13047): Restore `pytest.approx`{.interpreted-text role="func"} handling of equality checks between \[bool]{.title-ref} and \[numpy.bool\_]{.title-ref} types.

  Comparing \[bool]{.title-ref} and \[numpy.bool\_]{.title-ref} using `pytest.approx`{.interpreted-text role="func"} accidentally changed in version \[8.3.4]{.title-ref} and \[8.3.5]{.title-ref} to no longer match:

  ```pycon
  >>> import numpy as np
  >>> from pytest import approx
  >>> [np.True_, np.True_] == pytest.approx([True, True])
  False
  ```

  This has now been fixed:

  ```pycon
  >>> [np.True_, np.True_] == pytest.approx([True, True])
  True
  ```

- [#&#8203;13119](https://redirect.github.com/pytest-dev/pytest/issues/13119): Improved handling of invalid regex patterns for filter warnings by providing a clear error message.

- [#&#8203;13175](https://redirect.github.com/pytest-dev/pytest/issues/13175): The diff is now also highlighted correctly when comparing two strings.

- [#&#8203;13248](https://redirect.github.com/pytest-dev/pytest/issues/13248): Fixed an issue where passing a `scope` in `Metafunc.parametrize <pytest.Metafunc.parametrize>`{.interpreted-text role="py:func"} with `indirect=True`
  could result in other fixtures being unable to depend on the parametrized fixture.

- [#&#8203;13291](https://redirect.github.com/pytest-dev/pytest/issues/13291): Fixed `repr` of `attrs` objects in assertion failure messages when using `attrs>=25.2`.

- [#&#8203;13312](https://redirect.github.com/pytest-dev/pytest/issues/13312): Fixed a possible `KeyError` crash on PyPy during collection of tests involving higher-scoped parameters.

- [#&#8203;13345](https://redirect.github.com/pytest-dev/pytest/issues/13345): Fix type hints for `pytest.TestReport.when`{.interpreted-text role="attr"} and `pytest.TestReport.location`{.interpreted-text role="attr"}.

- [#&#8203;13377](https://redirect.github.com/pytest-dev/pytest/issues/13377): Fixed handling of test methods with positional-only parameter syntax.

  Now, methods are supported that formally define `self` as positional-only
  and/or fixture parameters as keyword-only, e.g.:

  ```python
  class TestClass:

      def test_method(self, /, *, fixture): ...
  ```

  Before, this caused an internal error in pytest.

- [#&#8203;13384](https://redirect.github.com/pytest-dev/pytest/issues/13384): Fixed an issue where pytest could report negative durations.

- [#&#8203;13420](https://redirect.github.com/pytest-dev/pytest/issues/13420): Added `lru_cache` to `nodes._check_initialpaths_for_relpath`.

- [#&#8203;9037](https://redirect.github.com/pytest-dev/pytest/issues/9037): Honor `disable_test_id_escaping_and_forfeit_all_rights_to_community_support`{.interpreted-text role="confval"} when escaping ids in parametrized tests.

#### Improved documentation

- [#&#8203;12535](https://redirect.github.com/pytest-dev/pytest/issues/12535): \[This
  example]{.title-ref}<<https://docs.pytest.org/en/latest/example/simple.html#making-test-result-information-available-in-fixtures>>
  showed `print` statements that do not exactly reflect what the
  different branches actually do. The fix makes the example more precise.

- [#&#8203;13218](https://redirect.github.com/pytest-dev/pytest/issues/13218): Pointed out in the `pytest.approx`{.interpreted-text role="func"} documentation that it considers booleans unequal to numeric zero or one.

- [#&#8203;13221](https://redirect.github.com/pytest-dev/pytest/issues/13221): Improved grouping of CLI options in the `--help` output.

- [#&#8203;6649](https://redirect.github.com/pytest-dev/pytest/issues/6649): Added `~pytest.TerminalReporter`{.interpreted-text role="class"} to the `api-reference`{.interpreted-text role="ref"} documentation page.

- [#&#8203;8612](https://redirect.github.com/pytest-dev/pytest/issues/8612): Add a recipe for handling abstract test classes in the documentation.

  A new example has been added to the documentation to demonstrate how to use a mixin class to handle abstract
  test classes without manually setting the `__test__` attribute for subclasses.
  This ensures that subclasses of abstract test classes are automatically collected by pytest.

#### Packaging updates and notes for downstreams

- [#&#8203;13317](https://redirect.github.com/pytest-dev/pytest/issues/13317): Specified minimum allowed versions of `colorama`, `iniconfig`,
  and `packaging`; and bumped the minimum allowed version
  of `exceptiongroup` for `python_version<'3.11'` from a release
  candidate to a full release.

#### Contributor-facing changes

- [#&#8203;12017](https://redirect.github.com/pytest-dev/pytest/issues/12017): Mixed internal improvements:

  - Migrate formatting to f-strings in some tests.
  - Use type-safe constructs in JUnitXML tests.
  - Moved`MockTiming` into `_pytest.timing`.

  \-- by `RonnyPfannschmidt`{.interpreted-text role="user"}

- [#&#8203;12647](https://redirect.github.com/pytest-dev/pytest/issues/12647): Fixed running the test suite with the `hypothesis` pytest plugin.

#### Miscellaneous internal changes

- [#&#8203;6649](https://redirect.github.com/pytest-dev/pytest/issues/6649): Added `~pytest.TerminalReporter`{.interpreted-text role="class"} to the public pytest API, as it is part of the signature of the `pytest_terminal_summary`{.interpreted-text role="hook"} hook.

### [`v8.3.5`](https://redirect.github.com/pytest-dev/pytest/releases/tag/8.3.5)

[Compare Source](https://redirect.github.com/pytest-dev/pytest/compare/8.3.4...8.3.5)

### pytest 8.3.5 (2025-03-02)

#### Bug fixes

- [#&#8203;11777](https://redirect.github.com/pytest-dev/pytest/issues/11777): Fixed issue where sequences were still being shortened even with `-vv` verbosity.
- [#&#8203;12888](https://redirect.github.com/pytest-dev/pytest/issues/12888): Fixed broken input when using Python 3.13+ and a `libedit` build of Python, such as on macOS or with uv-managed Python binaries from the `python-build-standalone` project. This could manifest e.g. by a broken prompt when using `Pdb`, or seeing empty inputs with manual usage of `input()` and suspended capturing.
- [#&#8203;13026](https://redirect.github.com/pytest-dev/pytest/issues/13026): Fixed `AttributeError`{.interpreted-text role="class"} crash when using `--import-mode=importlib` when top-level directory same name as another module of the standard library.
- [#&#8203;13053](https://redirect.github.com/pytest-dev/pytest/issues/13053): Fixed a regression in pytest 8.3.4 where, when using `--import-mode=importlib`, a directory containing py file with the same name would cause an `ImportError`
- [#&#8203;13083](https://redirect.github.com/pytest-dev/pytest/issues/13083): Fixed issue where pytest could crash if one of the collected directories got removed during collection.

#### Improved documentation

- [#&#8203;12842](https://redirect.github.com/pytest-dev/pytest/issues/12842): Added dedicated page about using types with pytest.

  See `types`{.interpreted-text role="ref"} for detailed usage.

#### Contributor-facing changes

- [#&#8203;13112](https://redirect.github.com/pytest-dev/pytest/issues/13112): Fixed selftest failures in `test_terminal.py` with Pygments >= 2.19.0
- [#&#8203;13256](https://redirect.github.com/pytest-dev/pytest/issues/13256): Support for Towncrier versions released in 2024 has been re-enabled
  when building Sphinx docs -- by `webknjaz`{.interpreted-text role="user"}.

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

