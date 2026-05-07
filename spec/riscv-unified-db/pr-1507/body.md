This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [tapioca](https://redirect.github.com/Shopify/tapioca) | `"= 0.16.11"` → `"= 0.17.10"` | ![age](https://developer.mend.io/api/mc/badges/age/rubygems/tapioca/0.17.10?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/rubygems/tapioca/0.16.11/0.17.10?slim=true) |

---

### Release Notes

<details>
<summary>Shopify/tapioca (tapioca)</summary>

### [`v0.17.10`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.10)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.10 -->

#### What's Changed

##### 🐛 Bug Fixes

- Stop generating RBI for insert/upsert related methods by [@&#8203;st0012](https://redirect.github.com/st0012) in [#&#8203;2446](https://redirect.github.com/Shopify/tapioca/pull/2446)

##### 🛠 Other Changes

- Add optional CI step to run Sorbet with Prism by [@&#8203;thomasmarshall](https://redirect.github.com/thomasmarshall) in [#&#8203;2427](https://redirect.github.com/Shopify/tapioca/pull/2427)

#### New Contributors

- [@&#8203;thomasmarshall](https://redirect.github.com/thomasmarshall) made their first contribution in [#&#8203;2427](https://redirect.github.com/Shopify/tapioca/pull/2427)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.9...v0.17.10>

### [`v0.17.9`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.9)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.9 -->

#### What's Changed

##### ✨ Enhancements

- Bump Rails versions we work with by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2421](https://redirect.github.com/Shopify/tapioca/pull/2421)

##### 🐛 Bug Fixes

- Fix dsl compiler for Google::Protobuf::RepeatedField by [@&#8203;rwstauner](https://redirect.github.com/rwstauner) in [#&#8203;2406](https://redirect.github.com/Shopify/tapioca/pull/2406)
- Bump minimum versions of RBI and Spoom dependencies by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2420](https://redirect.github.com/Shopify/tapioca/pull/2420)
- Fully qualify references to top-level `Module` by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2424](https://redirect.github.com/Shopify/tapioca/pull/2424)

#### New Contributors

- [@&#8203;rwstauner](https://redirect.github.com/rwstauner) made their first contribution in [#&#8203;2410](https://redirect.github.com/Shopify/tapioca/pull/2410)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.8...v0.17.9>

### [`v0.17.8`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.8)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.8 -->

#### What's Changed

##### ✨ Enhancements

- Prevent gems from calling `exit` or `abort` during gem load by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2387](https://redirect.github.com/Shopify/tapioca/pull/2387)
- Print currently compiling gems. Add verbose attribute to gem command. by [@&#8203;cub8](https://redirect.github.com/cub8) in [#&#8203;2395](https://redirect.github.com/Shopify/tapioca/pull/2395)

##### 🐛 Bug Fixes

- Generate Active Model attributes in an included `GeneratedAttributeMethods` module by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2356](https://redirect.github.com/Shopify/tapioca/pull/2356)
- Fix RBS comment prefix in YardDoc listener by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2364](https://redirect.github.com/Shopify/tapioca/pull/2364)
- Fix rbi deleted when route\_dsl runs on files affected by other compilers by [@&#8203;domingo2000](https://redirect.github.com/domingo2000) in [#&#8203;2358](https://redirect.github.com/Shopify/tapioca/pull/2358)
- Use `Bundler.load.specs` instead of reading `Gemfile.lock` by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2363](https://redirect.github.com/Shopify/tapioca/pull/2363)
- Sort YARD comments that have the same tag name by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2375](https://redirect.github.com/Shopify/tapioca/pull/2375)
- use ActiveRecordColumnTypeHelper for primary key types by [@&#8203;bobcats](https://redirect.github.com/bobcats) in [#&#8203;2377](https://redirect.github.com/Shopify/tapioca/pull/2377)
- Do not mixin Kernel for modules by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2394](https://redirect.github.com/Shopify/tapioca/pull/2394)

#### New Contributors

- [@&#8203;domingo2000](https://redirect.github.com/domingo2000) made their first contribution in [#&#8203;2358](https://redirect.github.com/Shopify/tapioca/pull/2358)
- [@&#8203;bobcats](https://redirect.github.com/bobcats) made their first contribution in [#&#8203;2377](https://redirect.github.com/Shopify/tapioca/pull/2377)
- [@&#8203;cub8](https://redirect.github.com/cub8) made their first contribution in [#&#8203;2395](https://redirect.github.com/Shopify/tapioca/pull/2395)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.7...v0.17.8>

### [`v0.17.7`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.7)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.7 -->

#### What's Changed

##### 🐛 Bug Fixes

- Use `Kernel.caller_locations` in `Runtime::Trackers::MethodDefinition` by [@&#8203;ebarajas](https://redirect.github.com/ebarajas) in [#&#8203;2347](https://redirect.github.com/Shopify/tapioca/pull/2347)
- Ensure Dsl::Compiler extends T::Generic in server add-on by [@&#8203;vinistock](https://redirect.github.com/vinistock) in [#&#8203;2350](https://redirect.github.com/Shopify/tapioca/pull/2350)

#### New Contributors

- [@&#8203;drewhoffer](https://redirect.github.com/drewhoffer) made their first contribution in [#&#8203;2322](https://redirect.github.com/Shopify/tapioca/pull/2322)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.6...v0.17.7>

### [`v0.17.6`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.6)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.6 -->

#### What's Changed

##### ✨ Enhancements

- use primary key type for ActiveRecord::Calculations#ids return type by [@&#8203;ebarajas](https://redirect.github.com/ebarajas) in [#&#8203;2271](https://redirect.github.com/Shopify/tapioca/pull/2271)

##### 🐛 Bug Fixes

- Fix single delegated\_type by [@&#8203;ngan](https://redirect.github.com/ngan) in [#&#8203;2335](https://redirect.github.com/Shopify/tapioca/pull/2335)
- Fix handling of anonymous types in generic arguments by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2342](https://redirect.github.com/Shopify/tapioca/pull/2342)
- Fix invalid byte sequence error by [@&#8203;alex-tan](https://redirect.github.com/alex-tan) in [#&#8203;2338](https://redirect.github.com/Shopify/tapioca/pull/2338)

#### New Contributors

- [@&#8203;ngan](https://redirect.github.com/ngan) made their first contribution in [#&#8203;2335](https://redirect.github.com/Shopify/tapioca/pull/2335)
- [@&#8203;ebarajas](https://redirect.github.com/ebarajas) made their first contribution in [#&#8203;2271](https://redirect.github.com/Shopify/tapioca/pull/2271)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.5...v0.17.6>

### [`v0.17.5`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.5)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.5 -->

#### What's Changed

##### 🐛 Bug Fixes

- Wrap loading DSL compilers in notification handler by [@&#8203;vinistock](https://redirect.github.com/vinistock) in [#&#8203;2329](https://redirect.github.com/Shopify/tapioca/pull/2329)

#### New Contributors

- [@&#8203;allcre](https://redirect.github.com/allcre) made their first contribution in [#&#8203;2331](https://redirect.github.com/Shopify/tapioca/pull/2331)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.4...v0.17.5>

### [`v0.17.4`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.4)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.4 -->

#### What's Changed

##### ✨ Enhancements

- Add support for cursor parameter on ActiveRecord's batch methods in Rails 8.0 by [@&#8203;lavoiesl](https://redirect.github.com/lavoiesl) in [#&#8203;2315](https://redirect.github.com/Shopify/tapioca/pull/2315)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.3...v0.17.4>

### [`v0.17.3`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.3)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.3 -->

#### What's Changed

##### 🐛 Bug Fixes

- Do not load DSL compilers before extensions in add-on mode by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2317](https://redirect.github.com/Shopify/tapioca/pull/2317)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.2...v0.17.3>

### [`v0.17.2`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.2)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.2 -->

#### What's Changed

##### ✨ Enhancements

- Stop generating more methods than necessary by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;293](https://redirect.github.com/Shopify/tapioca/pull/293)
- Eager load autoloads that are registered before the RBS rewriter is loaded by [@&#8203;paracycle](https://redirect.github.com/paracycle) in [#&#8203;2300](https://redirect.github.com/Shopify/tapioca/pull/2300)

##### 🐛 Bug Fixes

- Ignore `@requires_ancestor` in `YardDoc` listener by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2288](https://redirect.github.com/Shopify/tapioca/pull/2288)
- Skip RBS comments in YardDoc listener by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2310](https://redirect.github.com/Shopify/tapioca/pull/2310)
- Only call `load_iseq` if it's defined by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2309](https://redirect.github.com/Shopify/tapioca/pull/2309)

##### 🛠 Other Changes

- Mention ability to supply local annotations in README by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2297](https://redirect.github.com/Shopify/tapioca/pull/2297)
- Add a readme entry for the add-on functionality by [@&#8203;KaanOzkan](https://redirect.github.com/KaanOzkan) in [#&#8203;2296](https://redirect.github.com/Shopify/tapioca/pull/2296)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.1...v0.17.2>

### [`v0.17.1`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.1)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.1 -->

#### What's Changed

##### 🐛 Bug Fixes

- Load the runtime patches before Spoom by [@&#8203;Morriar](https://redirect.github.com/Morriar) in [#&#8203;2287](https://redirect.github.com/Shopify/tapioca/pull/2287)

#### New Contributors

- [@&#8203;rxbchen](https://redirect.github.com/rxbchen) made their first contribution in [#&#8203;2273](https://redirect.github.com/Shopify/tapioca/pull/2273)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.17.0...v0.17.1>

### [`v0.17.0`](https://redirect.github.com/Shopify/tapioca/releases/tag/v0.17.0)

<!-- Release notes generated using configuration in .github/release.yml at v0.17.0 -->

#### What's Changed

##### ✨ Enhancements

- Add support for `ActiveSupport` classes in `Sidekiq::Worker` methods by [@&#8203;iMacTia](https://redirect.github.com/iMacTia) in [#&#8203;2104](https://redirect.github.com/Shopify/tapioca/pull/2104)
- Add `from` and `to` kwargs types to generated `saved_change_to_attribute?` and `will_save_change_to_attribute?` methods by [@&#8203;dewski](https://redirect.github.com/dewski) in [#&#8203;2243](https://redirect.github.com/Shopify/tapioca/pull/2243)
- Add support for RBS signature comments by [@&#8203;Morriar](https://redirect.github.com/Morriar) in [#&#8203;2236](https://redirect.github.com/Shopify/tapioca/pull/2236)

##### 🐛 Bug Fixes

- Fix `fetch_annotation` signature by [@&#8203;Morriar](https://redirect.github.com/Morriar) in [#&#8203;2213](https://redirect.github.com/Shopify/tapioca/pull/2213)
- Fix check shims to allow methods with different parameters by [@&#8203;Morriar](https://redirect.github.com/Morriar) in [#&#8203;2245](https://redirect.github.com/Shopify/tapioca/pull/2245)
- Use Zeitwerk::Loader.all\_dirs to load all directories by [@&#8203;st0012](https://redirect.github.com/st0012) in [#&#8203;2283](https://redirect.github.com/Shopify/tapioca/pull/2283)

#### New Contributors

- [@&#8203;iMacTia](https://redirect.github.com/iMacTia) made their first contribution in [#&#8203;2104](https://redirect.github.com/Shopify/tapioca/pull/2104)
- [@&#8203;dewski](https://redirect.github.com/dewski) made their first contribution in [#&#8203;2243](https://redirect.github.com/Shopify/tapioca/pull/2243)

**Full Changelog**: <https://github.com/Shopify/tapioca/compare/v0.16.11...v0.17.0>

</details>

---

### Configuration

📅 **Schedule**: Branch creation - At 12:00 AM through 04:59 AM and 10:00 PM through 11:59 PM, Monday through Friday ( * 0-4,22-23 * * 1-5 ), Only on Sunday and Saturday ( * * * * 0,6 ) in timezone America/Los_Angeles, Automerge - At any time (no schedule defined).

🚦 **Automerge**: Enabled.

♻ **Rebasing**: Whenever PR is behind base branch, or you tick the rebase/retry checkbox.

🔕 **Ignore**: Close this PR and you won't be reminded about this update again.

---

 - [ ] <!-- rebase-check -->If you want to rebase/retry this PR, check this box

---

This PR was generated by [Mend Renovate](https://mend.io/renovate/). View the [repository job log](https://developer.mend.io/github/riscv/riscv-unified-db).
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45Mi4xIiwidXBkYXRlZEluVmVyIjoiNDMuOC41IiwidGFyZ2V0QnJhbmNoIjoibWFpbiIsImxhYmVscyI6WyJkZXBlbmRlbmNpZXMiXX0=-->

