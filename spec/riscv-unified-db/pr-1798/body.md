Switch gem releases from per-PR publishing to a fixed cadence (1st and 15th).
A scheduled GitHub Actions workflow now opens a PR that bumps versions only
for gems with detected code or data changes.

Does not create a `-pre` version immediately after each release.
As a result, repository HEAD version metadata may temporarily differ from the
latest published gems between release dates. This avoids frequent follow-up
PR conflicts and keeps the workflow simpler.
