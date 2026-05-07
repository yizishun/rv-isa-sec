# RISC-V ISA Security Analysis via Spec PR Monitoring

Experiment: Can LLM analysis of incremental RISC-V specification changes (PRs)
identify semantic gaps that traditional kernel security tools miss on RISC-V?

## Hypothesis

Unlike other ISAs with closed specifications, RISC-V specs are developed openly
on GitHub. Every incremental change is publicly reviewable via PRs. An LLM that
continuously monitors spec PRs may be able to:

1. Detect subtle ISA semantic changes that create new attack surfaces
2. Map spec changes to concrete Linux kernel code paths that need updating
3. Identify cases where the kernel code lags behind ratified spec changes

## Directory Structure

- `spec/<org>-<repo>/pr-XXXX/` - PR data (metadata, diff, comments, reviews)
- `notes/` - Analysis notes and findings
- `scripts/` - Data collection and analysis scripts
