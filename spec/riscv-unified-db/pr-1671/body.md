This simplifies the parameter files by making the schema (type, specified in JSON Schema) unconditional.

Where we were using conditions before (like MXLEN==32), we now perform a check via the `requirements` condition.

The conditional schemas were from before we had `requirements`, so it doesn't make sense to keep it and add complexity.
