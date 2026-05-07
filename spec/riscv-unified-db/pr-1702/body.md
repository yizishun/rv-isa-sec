The script previously used **${H}/.cache** as fallback for **XDG_CACHE_HOME**,
but **$H** is not a standard environment variable. Changed to use **$HOME**,
which is the standard environment variable for user home directory.
This prevents the script from defaulting to '**/.cache**' when neither
variable is set, avoiding permission issues.
