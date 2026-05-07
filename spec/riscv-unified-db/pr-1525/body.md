Fixes #1523

The MISALIGNED_AMO parameter was missing from RVI20 CRD because the profile only listed the A extension without explicitly including its sub-extensions Zaamo and Zalrsc.

This change adds explicit optional entries for Zaamo and Zalrsc extensions to ensure their parameters (MISALIGNED_AMO and LRSC_MISALIGNED_BEHAVIOR) are exposed in the generated CRD config.
