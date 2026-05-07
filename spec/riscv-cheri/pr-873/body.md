We don't have any compelling data for the top 2 bits of the 10-bit immediate, so instead of waiting for it to be rejected by ARC we may as well trim it up-front.
The 8-bit immediate covers all the CHERIoT use cases, and almost all of the FreeBSD use cases too.


