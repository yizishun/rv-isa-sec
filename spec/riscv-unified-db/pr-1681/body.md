In the `build-container` job, check whether the image tag already exists in `ghcr.io/riscv/udb` before rebuilding from scratch. If the tag is found, pull and export it directly; otherwise fall through to the existing Buildx build path.

This avoids redundant multi-minute container builds on PRs that do not touch the Dockerfile or container tag.
