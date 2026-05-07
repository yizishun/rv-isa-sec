Overhauls tool/container management:
- Drops support for Singularity/Apptainer
- Update Python infrastructure to use modern `pyproject.toml` and install packages using `uv`. `uv` is much faster and creates venvs automatically as needed. This will make a future native option much easier.
- Use `mise` to manage `python`, `node`, and `ruby` and install a few other tools. This gives us control over all of the versions and will make a future native option easier.

This is now working locally and in CI.

supersedes #1398
fixes #1394

