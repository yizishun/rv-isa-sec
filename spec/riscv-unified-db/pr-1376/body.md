## Summary

Mock/test data (like the `mock` instruction from the `Xmock` extension) was appearing in generated artifacts such as `encoding.h`. This is problematic because downstream consumers like Spike, ACTs, and the Sail model should not include test-only data in their production artifacts.

## Problem

As reported in the issue:
```bash
$ ./do gen:c_header
$ grep -i mock gen/c_header/encoding.out.h
#define MATCH_MOCK 0x200000b
#define MASK_MOCK 0xfe00707f
DECLARE_INSN(mock, MATCH_MOCK, MASK_MOCK)
```

Mock instructions should not appear in standard artifacts and should be filtered out by default.

## Solution

This PR adds filtering logic to exclude mock items by default:

1. **New helper function `is_mock_item()`** in `generator.py` that detects mock items by:
   - Name containing 'mock' (case-insensitive)
   - Being defined by an extension containing 'mock' in its name

2. **New `exclude_mock` parameter** added to:
   - `load_instructions()` - defaults to `True`
   - `load_csrs()` - defaults to `True`

3. **New `--include-mock` CLI flag** added to all generators:
   - `c_header/generate_encoding.py`
   - `Go/go_generator.py`
   - `sverilog/sverilog_generator.py`

4. **Logging** to report how many mock items were filtered

## Usage

By default, mock items are now excluded:
```bash
./do gen:c_header  # mock items filtered out
```

To include mock items (for testing purposes):
```bash
python3 backends/generators/c_header/generate_encoding.py --include-mock
```

## Test plan

- [x] Pre-commit hooks pass (black, pyupgrade, etc.)
- [x] Code follows existing patterns in the codebase
- [ ] Manual testing: run `gen:c_header` and verify no mock items in output
- [ ] Manual testing: run with `--include-mock` and verify mock items present

Closes #1148
