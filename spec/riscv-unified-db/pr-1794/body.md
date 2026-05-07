Root cause:
- `.github/workflows/pages.yml` had an unmatched `fi` in the "Download and publish schema files" shell block.

Fix:
- Removed the stray `fi` so the step executes correctly.



Closes #1787
