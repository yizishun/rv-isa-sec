## Summary
This PR fixes a typo in the CRD (Certification Requirements Document) template where 'Option Extensions' was displayed instead of 'Optional Extensions'.

## Changes
- Changed `to_s` to `to_s_concise` in `backends/proc_crd/templates/proc_crd.adoc.erb`
- This affects both the section header and the description text

## Before
- Section header: 'Option Extensions'
- Text: '...has X option extensions'

## After
- Section header: 'Optional Extensions'
- Text: '...has X optional extensions'

Fixes #1389

@lfx
