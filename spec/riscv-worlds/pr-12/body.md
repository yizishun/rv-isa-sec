Sorry this took a couple of days longer than expected, it took me a while to settle on a visual representation that showed the distinguishing characteristics of the extensions without taking up too much space nor getting too cramped.

A few notes:
* I've incorporated Krste's suggestion of "two platform inputs" for the per-hart WID authorizations. I've called them `pwidlist` (for M-mode) and `plwidlist` (for S/U-modes).
* I realized (when constructing the diagrams) that the platform's default WID, especially in the no-extensions-enabled case, is in essence a third "platform input", so I called that `pwid`. This way, if you see a variable starting with a `p`, it's clearly a platform-defined input/mechanism, and anything starting with a `m` or an `s` is clearly a CSR.
* I've tried to make explicit that Smwid (introducing the `mwid` CSR) is optional relative to all the other extensions (except Smlwidlist). I have also varied the diagrams for the subsequent extensions so that some show Smwid+Smlwidlist enabled and some show neither enabled.
* The current document doesn't show any CSR details, just the summary table, so I have stuck with that. We'll need to follow up with CSR details.
* I took the liberty of adding the `:imagesdir:` attribute at the top of the adoc file to allow the github viewer to show inline images, even though that change isn't strictly-speaking related to the `mwid/mlwidlist` change.
* I've tried to avoid word-smithing, and I've retained most of the original language - there are probably improvements we could make but I didn't want to mix editorial changes in with this patch.
