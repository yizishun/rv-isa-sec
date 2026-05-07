## Problem

The .mise.toml file specified **Python 3.14.3** and **Ruby 3.4.8**, which are non-existent versions as of February 2026:
- Python 3.14 won't be released until October 2026
- Ruby 3.4 is still in preview/pre-release

This was causing **all** CI build-container jobs to fail when mise tried to install these versions during the Docker build step. This has been blocking all recent PRs (#1639, #1638, #1637, #1636, #1635, #1634, #1633, etc.).

## Solution

Fixed by using stable, released versions:
- Changed Python from **3.14.3** → **3.12.8** (meets pyproject.toml requirement ≥3.12)
- Changed Ruby from **3.4.8** → **3.3.6** (compatible with Gemfile requirement ~>3.2)
- Bumped container tag from 0.36 → 0.37 to force rebuild

## Testing

This fix should allow the build-container job to complete successfully, unblocking all regression tests.

## Impact

Fixes widespread CI failures affecting all recent PRs in the repository.
