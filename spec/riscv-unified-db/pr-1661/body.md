This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [asciidoctor-pdf](https://asciidoctor.org/docs/asciidoctor-pdf) ([source](https://redirect.github.com/asciidoctor/asciidoctor-pdf), [changelog](https://redirect.github.com/asciidoctor/asciidoctor-pdf/blob/main/CHANGELOG.adoc)) | `2.3.14` → `2.3.24` | ![age](https://developer.mend.io/api/mc/badges/age/rubygems/asciidoctor-pdf/2.3.24?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/rubygems/asciidoctor-pdf/2.3.14/2.3.24?slim=true) |

---

### Release Notes

<details>
<summary>asciidoctor/asciidoctor-pdf (asciidoctor-pdf)</summary>

### [`v2.3.24`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.24)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.23...v2.3.24)

This is a minor patch release in the 2.3.x release line to optimize some behavior and to fix minor annoyances.

The most noticeable change is that the built-in prose fonts (Noto Serif and Noto Sans) now provide the checkmark glyph (U+2713) to avoid having to use the fallback font. Additionally, the minimum toclevels value is coerced to avoid creating an empty TOC.

Internally, the logic to check if a section heading fits on a page has been slightly optimized. And the `import_page` method on the converter returns true if page was imported to align with the functionality of the method it overrides.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- bypass any dry run logic if remaining height on page is less than heading font size
- update import\_page method on converter to return true if page was imported (nil otherwise), on par with the functionality of method it replaces
- limit min toclevels value so it does not cause TOC to be empty ([#&#8203;2619](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2619))
- add checkmark glyph (U+2713) to prose fonts (Noto Serif and Noto Sans) to avoid need for fallback font ([#&#8203;2617](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2617))

#### Release meta

Released on: 2025-11-15
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Side Stage by Athletic Brewing Co

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.24+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.23...v2.3.24) | [gem diff](https://my.diffend.io/gems/asciidoctor-pdf/2.3.23/2.3.24)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.23`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.23)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.22...v2.3.23)

This is the smallest of the small patch release in the 2.3.x release line to fix a problem with spacing between entries in a horizontal list caused by the fix for [#&#8203;2591](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2591).

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Bug Fixes

- fix incorrect spacing between entries in horizontal dlist when entry description crosses page boundary ([#&#8203;2614](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2614))

#### Release meta

Released on: 2025-10-25
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Oktoberfest by Athletic Brewing

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.23+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.22...v2.3.23) | [gem diff](https://my.diffend.io/gems/asciidoctor-pdf/2.3.22/2.3.23)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.22`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.22)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.21...v2.3.22)

This is a small patch release in the 2.3.x release line to fix problems with avoiding orphaned section titles and the related page number assignment.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Bug Fixes

- don't orphan section with unbreakable option that spans page boundary ([#&#8203;2608](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2608))
- correctly track start page number of section title that self-advances when section is breakable ([#&#8203;2609](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2609))

#### Release meta

Released on: 2025-10-23
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Not 5 o'clock yet

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.22+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.21...v2.3.22) | [gem diff](https://my.diffend.io/gems/asciidoctor-pdf/2.3.21/2.3.22)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.21`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.21)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.20...v2.3.21)

This is a small, but mighty patch release in the 2.3.x release line to address some AsciiDoc compliance issues and improve the overall usability of the software.

In terms of AsciiDoc compliance, the float-group enclosure is now honored for floats and see and see-also associations on index terms are now included in the index. In terms of usability, the `pdf-fontsdir` attribute has a more sensible default so it doesn't need to be set when using custom fonts in a custom theme. When text cannot be parsed, shy hyphens are removed to make the text easier to find in the source document.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- remove shy hyphens from text in log message when formatted text cannot be parsed ([#&#8203;2599](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2599))
- clear float box if next block falls outside of flaot group ([#&#8203;2596](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2596))
- resolve fonts relative to theme dir before GEM\_FONTS\_DIR if `pdf-fontsdir` not specified ([#&#8203;2349](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2349))
- add see and see-also associations on index terms to index ([#&#8203;2527](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2527))

#### Release meta

Released on: 2025-10-07
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Oktoberfest by Athletic Brewing Company

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.21+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.20...v2.3.21) | [gem diff](https://my.diffend.io/gems/asciidoctor-pdf/2.3.20/2.3.21)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.20`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.20)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.19...v2.3.20)

This is a significant patch release in the 2.3.x release line to address compatibility with Ruby 3.3 and Ruby 3.4, fix numerous bugs, and provide some welcomed improvements.

This release suppresses the warning issued by Ruby 3.3 and 3.4 about the use of Ruby's logger gem when loading Asciidoctor. It also fixes a crash when Asciidoctor PDF attempts to preload the bigdecimal gem when using Ruby 3.4.

This release include numerous bug fixes. If the font is missing the NULL character, the converter will ensure no space is allocated for it. If a resolved attribute value in the running content contains an attribute reference (recursive), the converter will not drop that line. If a bordered or shaded block gets carried over to the next column on the first page of a document that uses page columns, the block's extent will be computed correctly. If the link on an image targets an (internal) anchor, that link will resolve properly.

In terms of improvements, the big one is that a horizontal dlist is now rendered without the use of prawn-table, which means the description for an entry may exceed the height of a single page. This release also bundles the glyphs for the shift, command, option and return keys to the fallback font. The font size for sub and sup can now be set independently of one another using an extended converter. The value of the minimum font size keys in the theme accept a relative value (e.g., 0.75em). When generating a print or prepress PDF, the hide-uri-scheme attribute is honored when appending the URL to the link text.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- add symbols for shift, command, option, and return keys to the fallback font
- render horizontal dlist without using prawn-table, allowing the description to exceed the height of one page ([#&#8203;2591](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2591))
- allow relative font size for sub and sup to be set independently (support combined setting for backwards compatibility)
- allow value of `base-font-size-min` and `<category>-font-size-min` theme keys to be relative (e.g., 0.75em) ([#&#8203;2547](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2547))
- respect `hide-uri-scheme` attribute when appending URL to link text when media is print or prepress ([#&#8203;2583](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2583))

##### Bug Fixes

- always force NULL character to have 0 width, even if missing from font ([#&#8203;2585](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2585))
- don't drop line in running content if attribute reference resolves to text that contains attribute reference (not originally present)
- correctly calculate extent for block in columns that starts below doctitle ([#&#8203;2579](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2579))
- support internal link on image (value of link attribute starts with #) ([#&#8203;2572](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2572))

##### Compliance

- suppress warning about the use of Ruby's logger gem when loading Asciidoctor
- ignore error if bigdecimal gem cannot be eagerly required

#### Release meta

Released on: 2025-09-16
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Oktoberfest by Athletic Brewing

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.20+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.19...v2.3.20) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.19/v2.3.20)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.19`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.19)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.18...v2.3.19)

This is a patch release in the 2.3.x release line to fix several bugs and address another Ruby 3.3 compatibility issue.

This release backports the fix to support horizontal alignment on an AsciiDoc table cell that only contains paragraphs. It also fixes an issue where the AsciiDoc table cell would overrun the bottom of the page even when it would otherwise fit. Finally, the requirement for a custom font to provide the NULL glyph is now lifted to avoid line height calculation errors.

Regarding compatibility, this release loads the theme using a custom ThemeData class instead of OpenStruct to remove the dependency on ostruct.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- replace OpenStruct with internal ThemeData class for storing theme data ([#&#8203;2535](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2535))

##### Bug Fixes

- support horizontal alignment on AsciiDoc table cell that only contains paragraphs ([#&#8203;2358](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2358))
- don't allow AsciiDoc table cell to overrun bottom of page on which it fits ([#&#8203;2538](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2538))
- don't look for NULL glyph in fallback font as this can impact line height ([#&#8203;2541](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2541))

#### Release meta

Released on: 2024-10-11
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Duvel 6,66% by Duvel

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.19+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.18...v2.3.19) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.18/v2.3.19)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.18`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.18)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.17...v2.3.18)

This is a patch release in the 2.3.x release line to fix one bug and address one Ruby 3.3 compatibility issue.

If the page layout changes, the foreground image is now positioned correctly. The version lock on the rexml gem has been released now that the upstream issue has been resolved. The rexml upgrade does not require building native extensions in the strscan gem, but this is unavoidable since it was a change in Ruby itself.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Bug Fixes

- position foreground image correctly when page layout changes ([#&#8203;2528](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2528))

##### Compliance

- release lock on version of rexml (pulled in by asciidoctor-diagram and prawn-svg) now that incompatibility is resolved

#### Release meta

Released on: 2024-07-27
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Sidewalk Surfer by Maplewood Brewery

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.18+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.17...v2.3.18) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.17/v2.3.18)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.17`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.17)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.16...v2.3.17)

This is a patch release in the 2.3.x release line to backport an improvement that was left out of the previous release.

The /Producer field in the document info is now consistently used to credit Asciidoctor PDF and Prawn, regardless of whether the author is set. The `publisher` attribute is now mapped to the /Creator field, a field which is mapped to the author by default. The new `producer` attribute has been introduced to override the /Producer field.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- always use /Producer field in document info to credit Asciidoctor PDF and Prawn, even when author is set ([#&#8203;2510](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2510))
- map `producer` attribute to /Producer field in document info to override or default value ([#&#8203;2510](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2510))
- map `publisher` attribute to /Creator field instead of /Producer field in document info; use author as fallback ([#&#8203;2510](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2510))

#### Release meta

Released on: 2024-06-01
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: From Below by Cerebral Brewing

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.17+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.16...v2.3.17) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.16/v2.3.17)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.16`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.16)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.15...v2.3.16)

This is a patch release in the 2.3.x release line that addresses a few bugs, furthers compatibility with Ruby 3.3, and addresses a few minor annoyances.

The most critical fix in this release is to duplicate the attributes on the table when handling the breakable or unbreakable option so that the option is honored properly. This fix addresses the case when one of these options is used along with the `heading-min-height-after: auto` setting in the theme. The rexml dependency has been locked to fix an API breakage that was introduced in the latest version of rexml.

In the area of improvements, support for base64-encoded SVG images references in an SVG has been activated (unlocking new functionality in prawn-svg). If hyphens are enabled on the document, they are not applied to the URL of an autolink.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- don't hyphenate autolink when hyphenation is enabled ([#&#8203;2521](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2521)) (*[@&#8203;meonkeys](https://redirect.github.com/meonkeys)*)
- add support for base64-encoded SVG image reference in SVG ([#&#8203;2512](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2512))

##### Bug Fixes

- duplicate attributes on table when wrapping table in breakable or unbreakable container ([#&#8203;2520](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2520))

##### Compliance

- lock version of rexml (pulled in by asciidoctor-diagram and prawn-svg) to fix incompatibility

#### Release meta

Released on: 2024-05-31
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Moist Green Organic by Knotted Root Brewing Company

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.16+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.15...v2.3.16) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.15/v2.3.16)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

### [`v2.3.15`](https://redirect.github.com/asciidoctor/asciidoctor-pdf/releases/tag/v2.3.15)

[Compare Source](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.14...v2.3.15)

Back with another patch release in the 2.3.x line. This release was necessary to lock ttfunk to 1.7.0 since the transitive upgrade added a new requirement for installation which violates semantic versioning. This release also drops links from entries in the TOC so that they appear like all other entries and don't confuse the reader.

#### Distribution

- [RubyGem (asciidoctor-pdf)](https://rubygems.org/gems/asciidoctor-pdf)

#### Changelog

##### Improvements

- drop links from entries in TOC ([#&#8203;2505](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2505))

##### Compliance

- lock ttfunk to 1.7.x to avoid requiring Ruby headers (i.e., development libraries) to install gem ([#&#8203;2508](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues/2508))

#### Release meta

Released on: 2024-03-11
Released by: [@&#8203;mojavelinux](https://redirect.github.com/mojavelinux)
Release beer: Star Light by Equilibrium Brewery

Logs: [resolved issues](https://redirect.github.com/asciidoctor/asciidoctor-pdf/issues?q=is%3Aissue+label%3Av2.3.15+is%3Aclosed) | [source diff](https://redirect.github.com/asciidoctor/asciidoctor-pdf/compare/v2.3.14...v2.3.15) | [gem diff](https://my.diffend.io/gems/asciidoctor/v2.3.14/v2.3.15)

#### Credits

A very special thanks to all the **awesome** [supporters of the Asciidoctor OpenCollective campaign](https://opencollective.com/asciidoctor), who provide critical funding for the ongoing development of this project.

</details>

---

### Configuration

📅 **Schedule**: Branch creation - At 12:00 AM through 04:59 AM and 10:00 PM through 11:59 PM, Monday through Friday ( * 0-4,22-23 * * 1-5 ), Only on Sunday and Saturday ( * * * * 0,6 ) in timezone America/Los_Angeles, Automerge - At any time (no schedule defined).

🚦 **Automerge**: Disabled because a matching PR was automerged previously.

♻ **Rebasing**: Whenever PR becomes conflicted, or you tick the rebase/retry checkbox.

🔕 **Ignore**: Close this PR and you won't be reminded about this update again.

---

 - [ ] <!-- rebase-check -->If you want to rebase/retry this PR, check this box

---

This PR was generated by [Mend Renovate](https://mend.io/renovate/). View the [repository job log](https://developer.mend.io/github/riscv/riscv-unified-db).
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0My44LjUiLCJ1cGRhdGVkSW5WZXIiOiI0My44LjUiLCJ0YXJnZXRCcmFuY2giOiJtYWluIiwibGFiZWxzIjpbImRlcGVuZGVuY2llcyJdfQ==-->

