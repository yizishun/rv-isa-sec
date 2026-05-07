fixed for these issues flagged by actionlint: 

```
❯ actionlint -ignore  "SC2102"
.github/workflows/nightly.yml:16:15: the runner of "actions/checkout@v2" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
16 |       - uses: actions/checkout@v2
   |               ^~~~~~~~~~~~~~~~~~~
.github/workflows/nightly.yml:24:9: shellcheck reported issue in this script: SC2046:warning:1:9: Quote this to prevent word splitting [shellcheck]
   |
24 |         run: test -z $(git rev-list  --after="24 hours"  ${{ github.sha }}) && echo "::set-output name=should_run::false"
   |         ^~~~
.github/workflows/nightly.yml:24:14: workflow command "set-output" was deprecated. use `echo "{name}={value}" >> $GITHUB_OUTPUT` instead: https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions [deprecated-commands]
   |
24 |         run: test -z $(git rev-list  --after="24 hours"  ${{ github.sha }}) && echo "::set-output name=should_run::false"
   |              ^~~~
.github/workflows/nightly.yml:38:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
38 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/nightly.yml:44:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
44 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/pages.yml:29:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
29 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/pages.yml:35:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
35 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:11:15: the runner of "actions/checkout@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
11 |       - uses: actions/checkout@v3
   |               ^~~~~~~~~~~~~~~~~~~
.github/workflows/regress.yml:12:15: the runner of "actions/setup-python@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
12 |       - uses: actions/setup-python@v3
   |               ^~~~~~~~~~~~~~~~~~~~~~~
.github/workflows/regress.yml:25:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
25 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:31:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
31 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:58:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
58 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:64:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
64 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:89:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
89 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:95:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
   |
95 |         uses: actions/cache@v3
   |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:118:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
    |
118 |         uses: actions/cache@v3
    |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:124:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
    |
124 |         uses: actions/cache@v3
    |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:147:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
    |
147 |         uses: actions/cache@v3
    |               ^~~~~~~~~~~~~~~~
.github/workflows/regress.yml:153:15: the runner of "actions/cache@v3" action is too old to run on GitHub Actions. update the action's version to fix this issue [action]
    |
153 |         uses: actions/cache@v3
    |               ^~~~~~~~~~~~~~~~
```
