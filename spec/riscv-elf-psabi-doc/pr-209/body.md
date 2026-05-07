Some APIs use enum types in their definitions. The C specification does not
define the size of the integer type used for storing and passing enum type
variables.

Provide a definition matching GCC's default behavior.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
