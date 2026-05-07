We introduce .note.gnu.property section to store infomations that linker or runtime system may use, and we define two bit for landing pad and shadow stack.

Those two bit will checked by loader - and use that info to enable the landing pad checking and/or shadow stack feature.
