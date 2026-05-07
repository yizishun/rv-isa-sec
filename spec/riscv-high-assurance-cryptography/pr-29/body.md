This PR adds the encodings for the instructions in the title, wraps the text to 80 columns in `ace-instruction-detailed.adoc`.

I haven't added more encodings because most of them go to CSRs. In that case we need to decide the CSR addresses. I have also ommited the instructions that use scalar registers instead of vector registers. That discussion is still ongoing and I don't want to commit to them just yet.
