Most profiles don't automatically incorporate optional extensions from "ancestors", so more extensions need to be removed after profile inheritance.

For example, in UDB, profile RVA23S64 inherits from both RVB23S64 and RVA23U64. However, in the profiles documentation it (roughly) inherits from only RVA23U64, and then only "all the mandatory unprivileged extensions". So, the optional extensions need to be handled more explicitly, and many need to be removed.

Fixes #1195 
