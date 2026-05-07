This PR contains the following updates:

| Package | Update | Change |
|---|---|---|
| [actions/setup-java](https://redirect.github.com/actions/setup-java) | minor | `v4` → `v4.8.0` |

---

### Release Notes

<details>
<summary>actions/setup-java (actions/setup-java)</summary>

### [`v4.8.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.8.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.7.1...v4.8.0)

#### What's Changed

- License and Audit Fixes by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;960](https://redirect.github.com/actions/setup-java/pull/960)
- Update SapMachine URLs by [@&#8203;RealCLanger](https://redirect.github.com/RealCLanger) in [#&#8203;965](https://redirect.github.com/actions/setup-java/pull/965)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.8.0>

### [`v4.7.1`](https://redirect.github.com/actions/setup-java/releases/tag/v4.7.1)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.7.0...v4.7.1)

#### What's Changed

##### Documentation changes

- Add Documentation to Recommend Using GraalVM JDK 17 Version to 17.0.12 to Align with GFTC License Terms by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;704](https://redirect.github.com/actions/setup-java/pull/704)
- Remove duplicated GraalVM section in documentation by [@&#8203;Marcono1234](https://redirect.github.com/Marcono1234) in [#&#8203;716](https://redirect.github.com/actions/setup-java/pull/716)

##### Dependency updates:

- Upgrade [@&#8203;action/cache](https://redirect.github.com/action/cache) from 4.0.0 to 4.0.2 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;766](https://redirect.github.com/actions/setup-java/pull/766)
- Upgrade [@&#8203;actions/glob](https://redirect.github.com/actions/glob) from 0.4.0 to 0.5.0 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;744](https://redirect.github.com/actions/setup-java/pull/744)
- Upgrade ts-jest from 29.1.2 to 29.2.5 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;743](https://redirect.github.com/actions/setup-java/pull/743)
- Upgrade [@&#8203;action/cache](https://redirect.github.com/action/cache) to 4.0.3 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;773](https://redirect.github.com/actions/setup-java/pull/773)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.7.1>

### [`v4.7.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.7.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.6.0...v4.7.0)

#### What's Changed

- Configure Dependabot settings by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;722](https://redirect.github.com/actions/setup-java/pull/722)
- README Update: Added a permissions section by [@&#8203;benwells](https://redirect.github.com/benwells) in [#&#8203;723](https://redirect.github.com/actions/setup-java/pull/723)
- Upgrade `cache` from version 3.2.4 to 4.0.0 by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;724](https://redirect.github.com/actions/setup-java/pull/724)
- Upgrade `@actions/http-client` from 2.2.1 to 2.2.3 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;728](https://redirect.github.com/actions/setup-java/pull/728)
- Upgrade `actions/publish-immutable-action` from 0.0.3 to 0.0.4 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;727](https://redirect.github.com/actions/setup-java/pull/727)
- Upgrade `@types/jest` from 29.5.12 to 29.5.14 by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;729](https://redirect.github.com/actions/setup-java/pull/729)

#### New Contributors

- [@&#8203;benwells](https://redirect.github.com/benwells) made their first contribution in [#&#8203;723](https://redirect.github.com/actions/setup-java/pull/723)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.7.0>

### [`v4.6.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.6.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.5.0...v4.6.0)

#### What's Changed

**Add-ons:**

- Add Support for JetBrains Runtime by [@&#8203;gmitch215](https://redirect.github.com/gmitch215) in [#&#8203;637](https://redirect.github.com/actions/setup-java/pull/637)

```steps:
 - name: Checkout
   uses: actions/checkout@v4
 - name: Setup-java
   uses: actions/setup-java@v4
   with:
     distribution: ‘jetbrains’
     java-version: '21'
```

**Bug fixes:**

- Fix Ubuntu-latest CI failures by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;693](https://redirect.github.com/actions/setup-java/pull/693)

#### New Contributors

- [@&#8203;gmitch215](https://redirect.github.com/gmitch215) made their first contribution in [#&#8203;637](https://redirect.github.com/actions/setup-java/pull/637)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.6.0>

### [`v4.5.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.5.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.4.0...v4.5.0)

##### What's Changed

- Upgrade IA Publish by [@&#8203;Jcambass](https://redirect.github.com/Jcambass) in [#&#8203;686](https://redirect.github.com/actions/setup-java/issues/686)

##### Bug fixes:

- Improve archive extraction on windows runners without powershell core and Update micromatch dependency by [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) in [#&#8203;689](https://redirect.github.com/actions/setup-java/issues/689)
- Update workflows for GraalVM and Version Enhancements by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;699](https://redirect.github.com/actions/setup-java/issues/699)
- Refine `isGhes` logic by [@&#8203;jww3](https://redirect.github.com/jww3) in [#&#8203;697](https://redirect.github.com/actions/setup-java/issues/697)

##### New Contributors:

- [@&#8203;priyagupta108](https://redirect.github.com/priyagupta108) made their first contribution in [#&#8203;689](https://redirect.github.com/actions/setup-java/pull/689)
- [@&#8203;jww3](https://redirect.github.com/jww3) made their first contribution in [#&#8203;697](https://redirect.github.com/actions/setup-java/pull/697)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.5.0>

### [`v4.4.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.4.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.3.0...v4.4.0)

#### What's Changed

**Add-ons :**

- Add support for Oracle GraalVM by [@&#8203;fniephaus](https://redirect.github.com/fniephaus) in [#&#8203;501](https://redirect.github.com/actions/setup-java/pull/501)

```
steps:
 - name: Checkout
   uses: actions/checkout@v4
 - name: Setup-java
   uses: actions/setup-java@v4
   with:
     distribution: 'graalvm'
     java-version: '21'
```

- Add workflow file for publishing releases to immutable action package by [@&#8203;Jcambass](https://redirect.github.com/Jcambass) in [#&#8203;684](https://redirect.github.com/actions/setup-java/pull/684)

**Bug fixes :**

- Add architecture to cache key by [@&#8203;Zxilly](https://redirect.github.com/Zxilly) in [#&#8203;664](https://redirect.github.com/actions/setup-java/pull/664)
  This addresses issues with caching by adding the architecture (arch) to the cache key, ensuring that cache keys are accurate to prevent conflicts.
  Note: This change may break previous cache keys as they will no longer be compatible with the new format.
- Resolve check failures by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y) in [#&#8203;687](https://redirect.github.com/actions/setup-java/pull/687)

#### New Contributors

- [@&#8203;Jcambass](https://redirect.github.com/Jcambass) made their first contribution in [#&#8203;684](https://redirect.github.com/actions/setup-java/pull/684)
- [@&#8203;Zxilly](https://redirect.github.com/Zxilly) made their first contribution in [#&#8203;664](https://redirect.github.com/actions/setup-java/pull/664)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.4.0>

### [`v4.3.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.3.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.2.2...v4.3.0)

What's Changed

- Add support for SapMachine JDK/JRE by [@&#8203;Shegox](https://redirect.github.com/Shegox) in [#&#8203;614](https://redirect.github.com/actions/setup-java/issues/614)

```yaml
steps:
 - name: Checkout
   uses: actions/checkout@v4
 - name: Setup-java
   uses: actions/setup-java@v4
   with:
     distribution: 'sapmachine'
     java-version: '21'
```

Bug fixes :

- Fix typos on Corretto by [@&#8203;johnshajiang](https://redirect.github.com/johnshajiang) in [#&#8203;666](https://redirect.github.com/actions/setup-java/issues/666)
- IBM Semeru Enhancement on arm64 by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;677](https://redirect.github.com/actions/setup-java/issues/677)
- Resolve Basic Validation Check Failures by [@&#8203;aparnajyothi-y](https://redirect.github.com/aparnajyothi-y)  in [#&#8203;682](https://redirect.github.com/actions/setup-java/issues/682)

New Contributors :

- [@&#8203;johnshajiang](https://redirect.github.com/johnshajiang) made their first contribution in [#&#8203;666](https://redirect.github.com/actions/setup-java/issues/666)
- [@&#8203;Shegox](https://redirect.github.com/Shegox) made their first contribution in [#&#8203;614](https://redirect.github.com/actions/setup-java/issues/614)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.3.0>

### [`v4.2.2`](https://redirect.github.com/actions/setup-java/releases/tag/v4.2.2)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.2.1...v4.2.2)

##### What's Changed

#####   Bug fixes:

- Fix macos latest check failures by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;634](https://redirect.github.com/actions/setup-java/pull/634)
- Fix dragonwell distribution parsing issues by [@&#8203;Accelerator1996](https://redirect.github.com/Accelerator1996) in [#&#8203;643](https://redirect.github.com/actions/setup-java/pull/643)

##### Documentation changes

- Update advanced documentation for java-version-file by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;622](https://redirect.github.com/actions/setup-java/pull/622)

##### Dependency updates:

- Bump undici from 5.28.3 to 5.28.4 and other dependency updates by [@&#8203;dependabot](https://redirect.github.com/dependabot) in [#&#8203;616](https://redirect.github.com/actions/setup-java/pull/616)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.2.2>

### [`v4.2.1`](https://redirect.github.com/actions/setup-java/releases/tag/v4.2.1)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.2.0...v4.2.1)

#### What's Changed

- Patch for java version file to accept it from any path by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;610](https://redirect.github.com/actions/setup-java/pull/610)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.2.1>

### [`v4.2.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.2.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4.1.0...v4.2.0)

#### What's Changed

- Updated actions/httpclient version to 2.2.1 and other dependencies by [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) in [#&#8203;607](https://redirect.github.com/actions/setup-java/pull/607)
- Added .tool-versions file support  along with .java-version file by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;606](https://redirect.github.com/actions/setup-java/pull/606)

#### New Contributors

- [@&#8203;HarithaVattikuti](https://redirect.github.com/HarithaVattikuti) made their first contribution in [#&#8203;607](https://redirect.github.com/actions/setup-java/pull/607)
  **Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.2.0>

### [`v4.1.0`](https://redirect.github.com/actions/setup-java/releases/tag/v4.1.0)

[Compare Source](https://redirect.github.com/actions/setup-java/compare/v4...v4.1.0)

#### What's Changed

- Added Windows Arm64 Support for Windows Arm64 Runners by [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) in [#&#8203;595](https://redirect.github.com/actions/setup-java/pull/595)
- feat: bump actions/checkout and actions/setup-java to v4 by [@&#8203;kbdharun](https://redirect.github.com/kbdharun) in [#&#8203;533](https://redirect.github.com/actions/setup-java/pull/533)
- Handle authorization when the token is undefined by [@&#8203;peter-murray](https://redirect.github.com/peter-murray) in [#&#8203;556](https://redirect.github.com/actions/setup-java/pull/556)
- Documentation update of Java 21 by [@&#8203;Okeanos](https://redirect.github.com/Okeanos) in [#&#8203;566](https://redirect.github.com/actions/setup-java/pull/566)
- Documentation update about maven-gpg-plugin version note by [@&#8203;IvanZosimov](https://redirect.github.com/IvanZosimov) in [#&#8203;570](https://redirect.github.com/actions/setup-java/pull/570)
- Oracle JDK 21 support by [@&#8203;jdubois](https://redirect.github.com/jdubois) in [#&#8203;538](https://redirect.github.com/actions/setup-java/pull/538)
- Fix typo in configuration example by [@&#8203;Bananeweizen](https://redirect.github.com/Bananeweizen) in [#&#8203;572](https://redirect.github.com/actions/setup-java/pull/572)

#### New Contributors

- [@&#8203;kbdharun](https://redirect.github.com/kbdharun) made their first contribution in [#&#8203;533](https://redirect.github.com/actions/setup-java/pull/533)
- [@&#8203;peter-murray](https://redirect.github.com/peter-murray) made their first contribution in [#&#8203;556](https://redirect.github.com/actions/setup-java/pull/556)
- [@&#8203;jdubois](https://redirect.github.com/jdubois) made their first contribution in [#&#8203;538](https://redirect.github.com/actions/setup-java/pull/538)
- [@&#8203;Bananeweizen](https://redirect.github.com/Bananeweizen) made their first contribution in [#&#8203;572](https://redirect.github.com/actions/setup-java/pull/572)
- [@&#8203;mahabaleshwars](https://redirect.github.com/mahabaleshwars) made their first contribution in [#&#8203;595](https://redirect.github.com/actions/setup-java/pull/595)

**Full Changelog**: <https://github.com/actions/setup-java/compare/v4...v4.1.0>

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
<!--renovate-debug:eyJjcmVhdGVkSW5WZXIiOiI0Mi45Mi4xIiwidXBkYXRlZEluVmVyIjoiNDIuOTIuMSIsInRhcmdldEJyYW5jaCI6Im1haW4iLCJsYWJlbHMiOlsiZGVwZW5kZW5jaWVzIl19-->

