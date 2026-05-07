In general, RVY ABIs try to follow the base RVI as closely as possible.
One difference are variadic functions and ones with on-stack arguments,
where the calling convention is slightly different to ensure that the
argument block can be tightly bounded to catch overflows.
