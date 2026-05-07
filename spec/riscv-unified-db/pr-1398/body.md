## Summary

Adds [mise](https://mise.jdx.dev) for unified tool version management (Ruby, Node.js, Python) and fixes the Podman UID/GID compatibility issue by upgrading to npm >= 10.2.0.

## Problem Statement

When pulling container images using Podman, users encountered the following error:

`Error: potentially insufficient UIDs or GIDs available in user namespace
(requested 376884:5762 for /opt/node/node_modules/clone-stats/LICENSE.md):
Check /etc/subuid and /etc/subgid: lchown: invalid argument`


This occurred because older versions of npm (< 10.2.0) preserved UID/GID metadata from the build system, which Podman validates against the user namespace. Docker ignores this, but Podman throws an error.

## Solution

- **Introduced mise** for managing tool versions via `.mise.toml`
- **Upgraded to Node.js 22.12.0** which includes npm 10.9.0 (contains fix from [npm/cli#5998](https://github.com/npm/cli/pull/5998))
- **Added `chown -R root:root`** for node_modules as extra safety measure
- **Improved maintainability** with unified version configuration

## Changes

### New Files
- `.mise.toml` - Tool version configuration
- `.mise.local.toml.example` - Example local overrides
- `doc/mise-setup.adoc` - Comprehensive documentation
- `bin/validate-mise` - Configuration validation script
- `MISE-IMPLEMENTATION.md` - Implementation guide

### Modified Files
- `.devcontainer/Dockerfile` - Uses mise instead of manual tool installation
- `bin/.container-tag` - Bumped to `0.16`
- `container.def` - Regenerated for Singularity
- `.gitignore` - Added mise local config exclusions

### Tool Versions
- **Ruby**: 3.4.8 (with YJIT enabled)
- **Node.js**: 22.12.0
- **npm**: 10.9.0 ✅ Podman compatible
- **Python**: 3.12.12

## Benefits

✅ **Fixes Podman compatibility** - No more UID/GID errors  
✅ **Unified tool management** - Single `.mise.toml` configuration  
✅ **Easier maintenance** - No manual ruby-build compilation  
✅ **Better caching** - mise manages downloads efficiently  
✅ **Future-ready** - Easy to add more tools (Go, Rust, etc.)  
✅ **Local development** - `mise install` works outside containers  

## Testing

### Container Build
```bash
docker build -t riscvintl/udb:0.16 -f .devcontainer/Dockerfile .
```

Fixes #1394 
