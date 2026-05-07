## Summary

Two improvements to the container publishing workflow (`.github/workflows/container.yml`):

### 1. Skip build when tag already exists

A new `check-tag` job runs first and queries both Docker Hub and GHCR for the tag recorded in `bin/.container-tag`. If the tag is already present in both registries the `build-docker-container` and `merge-docker-container` jobs are skipped entirely, saving runner time on re-runs or accidental re-triggers.

### 2. No intermediate pushes to the container registry

Previously the per-platform build jobs pushed each platform image to the registry by digest (`push-by-digest=true`), meaning untagged intermediate blobs were written to Docker Hub and GHCR on every build.

Now:
- Each platform builds with `push: false` and exports to a local tarball (`type=docker,dest=...`).
- The tarball is uploaded as a GitHub Actions artifact (`image-amd64` / `image-arm64`, 1-day retention).
- The `merge-docker-container` job downloads both tarballs, loads them, pushes platform-specific tagged images (e.g. `:0.41-amd64`), and then uses `docker buildx imagetools create` to assemble the final multi-platform manifest under the versioned tag.
- **Only the final versioned manifest (and its two platform-backing images) ever lands in the registry.**
