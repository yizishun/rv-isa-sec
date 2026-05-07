Resolves #1689.

This PR adds the ability to tag normative rules to track extension dependencies, as suggested in #1689.

**Changes:**
- Modified `extension_requirement` in [spec/schemas/schema_defs.json](cci:7://file:///Users/krrishbiswas/Desktop/LFX/riscv-unified-db/spec/schemas/schema_defs.json:0:0-0:0) to include an optional `cert_normative_rules` array. 
- Added an optional `note` string field to allow arbitrary context to be recorded explaining why a dependency exists.

By adding `cert_normative_rules`, extensions can now reference the specific normative rule ID that mandates the dependency directly in their `requirements` block.

