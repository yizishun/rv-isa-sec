This PR contains the following updates:

| Package | Change | [Age](https://docs.renovatebot.com/merge-confidence/) | [Confidence](https://docs.renovatebot.com/merge-confidence/) |
|---|---|---|---|
| [prettier](https://prettier.io) ([source](https://redirect.github.com/prettier/prettier)) | [`3.4.2` → `3.8.1`](https://renovatebot.com/diffs/npm/prettier/3.4.2/3.8.1) | ![age](https://developer.mend.io/api/mc/badges/age/npm/prettier/3.8.1?slim=true) | ![confidence](https://developer.mend.io/api/mc/badges/confidence/npm/prettier/3.4.2/3.8.1?slim=true) |

---

### Release Notes

<details>
<summary>prettier/prettier (prettier)</summary>

### [`v3.8.1`](https://redirect.github.com/prettier/prettier/compare/3.8.0...fbf300f9d89820364ddc9b2efa05b92b8c01b692)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.8.0...3.8.1)

### [`v3.8.0`](https://redirect.github.com/prettier/prettier/releases/tag/3.8.0)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.7.4...3.8.0)

[diff](https://redirect.github.com/prettier/prettier/compare/3.7.4...3.8.0)

🔗 [Release note](https://prettier.io/blog/2026/01/14/3.8.0)

### [`v3.7.4`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#374)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.7.3...3.7.4)

[diff](https://redirect.github.com/prettier/prettier/compare/3.7.3...3.7.4)

##### LWC: Avoid quote around interpolations ([#&#8203;18383](https://redirect.github.com/prettier/prettier/pull/18383) by [@&#8203;kovsu](https://redirect.github.com/kovsu))

<!-- prettier-ignore -->

```html
<!-- Input -->
<div foo={bar}>   </div>

<!-- Prettier 3.7.3 (--embedded-language-formatting off) -->
<div foo="{bar}"></div>

<!-- Prettier 3.7.4 (--embedded-language-formatting off) -->
<div foo={bar}></div>
```

##### TypeScript: Fix comment inside union type gets duplicated ([#&#8203;18393](https://redirect.github.com/prettier/prettier/pull/18393) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```tsx
// Input
type Foo = (/** comment */ a | b) | c;

// Prettier 3.7.3
type Foo = /** comment */ (/** comment */ a | b) | c;

// Prettier 3.7.4
type Foo = /** comment */ (a | b) | c;
```

##### TypeScript: Fix unstable comment print in union type comments ([#&#8203;18395](https://redirect.github.com/prettier/prettier/pull/18395) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```tsx
// Input
type X = (A | B) & (
  // comment
  A | B
);

// Prettier 3.7.3 (first format)
type X = (A | B) &
  (// comment
  A | B);

// Prettier 3.7.3 (second format)
type X = (
  | A
  | B // comment
) &
  (A | B);

// Prettier 3.7.4
type X = (A | B) &
  // comment
  (A | B);
```

### [`v3.7.3`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#373)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.7.2...3.7.3)

[diff](https://redirect.github.com/prettier/prettier/compare/3.7.2...3.7.3)

##### API: Fix `prettier.getFileInfo()` change that breaks VSCode extension ([#&#8203;18375](https://redirect.github.com/prettier/prettier/pull/18375) by [@&#8203;fisker](https://redirect.github.com/fisker))

An internal refactor accidentally broke the VSCode extension plugin loading.

### [`v3.7.2`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#372)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.7.1...3.7.2)

[diff](https://redirect.github.com/prettier/prettier/compare/3.7.1...3.7.2)

##### JavaScript: Fix string print when switching quotes ([#&#8203;18351](https://redirect.github.com/prettier/prettier/pull/18351) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```jsx
// Input
console.log("A descriptor\\'s .kind must be \"method\" or \"field\".")

// Prettier 3.7.1
console.log('A descriptor\\'s .kind must be "method" or "field".');

// Prettier 3.7.2
console.log('A descriptor\\\'s .kind must be "method" or "field".');
```

##### JavaScript: Preserve quote for embedded HTML attribute values ([#&#8203;18352](https://redirect.github.com/prettier/prettier/pull/18352) by [@&#8203;kovsu](https://redirect.github.com/kovsu))

<!-- prettier-ignore -->

```tsx
// Input
const html = /* HTML */ ` <div class="${styles.banner}"></div> `;

// Prettier 3.7.1
const html = /* HTML */ ` <div class=${styles.banner}></div> `;

// Prettier 3.7.2
const html = /* HTML */ ` <div class="${styles.banner}"></div> `;
```

##### TypeScript: Fix comment in empty type literal ([#&#8203;18364](https://redirect.github.com/prettier/prettier/pull/18364) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```tsx
// Input
export type XXX = {
  // tbd
};

// Prettier 3.7.1
export type XXX = { // tbd };

// Prettier 3.7.2
export type XXX = {
  // tbd
};
```

### [`v3.7.1`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#371)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.7.0...3.7.1)

[diff](https://redirect.github.com/prettier/prettier/compare/3.7.0...3.7.1)

##### API: Fix performance regression in doc printer ([#&#8203;18342](https://redirect.github.com/prettier/prettier/pull/18342) by [@&#8203;fisker](https://redirect.github.com/fisker))

Prettier 3.7.1 can be very slow when formatting big files, the regression has been fixed.

### [`v3.7.0`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#370)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.6.2...3.7.0)

[diff](https://redirect.github.com/prettier/prettier/compare/3.6.2...3.7.0)

🔗 [Release Notes](https://prettier.io/blog/2025/11/27/3.7.0)

### [`v3.6.2`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#362)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.6.1...3.6.2)

[diff](https://redirect.github.com/prettier/prettier/compare/3.6.1...3.6.2)

##### Markdown: Add missing blank line around code block ([#&#8203;17675](https://redirect.github.com/prettier/prettier/pull/17675) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

````md
<!-- Input -->
1. Some text, and code block below, with newline after code block

   ```yaml
   ---
   foo: bar
   ```

   1. Another
   2. List

<!-- Prettier 3.6.1 -->
1. Some text, and code block below, with newline after code block

   ```yaml
   ---
   foo: bar
   ```
   1. Another
   2. List

<!-- Prettier 3.6.2 -->
1. Some text, and code block below, with newline after code block

   ```yaml
   ---
   foo: bar
   ```

   1. Another
   2. List
````

### [`v3.6.1`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#361)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.6.0...3.6.1)

[diff](https://redirect.github.com/prettier/prettier/compare/3.6.0...3.6.1)

##### TypeScript: Allow const without initializer ([#&#8203;17650](https://redirect.github.com/prettier/prettier/pull/17650), [#&#8203;17654](https://redirect.github.com/prettier/prettier/pull/17654) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```jsx
// Input
export const version: string;

// Prettier 3.6.0 (--parser=babel-ts)
SyntaxError: Unexpected token (1:21)
> 1 | export const version: string;
    |                     ^

// Prettier 3.6.0 (--parser=oxc-ts)
SyntaxError: Missing initializer in const declaration (1:14)
> 1 | export const version: string;
    |              ^^^^^^^^^^^^^^^

// Prettier 3.6.1
export const version: string;
```

##### Miscellaneous: Avoid closing files multiple times ([#&#8203;17665](https://redirect.github.com/prettier/prettier/pull/17665) by [@&#8203;43081j](https://redirect.github.com/43081j))

When reading a file to infer the interpreter from a shebang, we use the
`n-readlines` library to read the first line in order to get the shebang.

This library closes files when it reaches EOF, and we later try close the same
files again. We now close files only if `n-readlines` did not already close
them.

### [`v3.6.0`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#360)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.5.3...3.6.0)

[diff](https://redirect.github.com/prettier/prettier/compare/3.5.3...3.6.0)

🔗 [Release Notes](https://prettier.io/blog/2025/06/23/3.6.0)

### [`v3.5.3`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#353)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.5.2...3.5.3)

[diff](https://redirect.github.com/prettier/prettier/compare/3.5.2...3.5.3)

##### Flow: Fix missing parentheses in `ConditionalTypeAnnotation` ([#&#8203;17196](https://redirect.github.com/prettier/prettier/pull/17196) by [@&#8203;fisker](https://redirect.github.com/fisker))

<!-- prettier-ignore -->

```jsx
// Input
type T<U> = 'a' | ('b' extends U ? 'c' : empty);
type T<U> = 'a' & ('b' extends U ? 'c' : empty);

// Prettier 3.5.2
type T<U> = "a" | "b" extends U ? "c" : empty;
type T<U> = "a" & "b" extends U ? "c" : empty;

// Prettier 3.5.3
type T<U> = "a" | ("b" extends U ? "c" : empty);
type T<U> = "a" & ("b" extends U ? "c" : empty);
```

### [`v3.5.2`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#352)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.5.1...3.5.2)

[diff](https://redirect.github.com/prettier/prettier/compare/3.5.1...3.5.2)

##### Remove `module-sync` condition ([#&#8203;17156](https://redirect.github.com/prettier/prettier/pull/17156) by [@&#8203;fisker](https://redirect.github.com/fisker))

In Prettier 3.5.0, [we added `module-sync` condition to `package.json`](https://prettier.io/blog/2025/02/09/3.5.0#use-esm-entrypoint-for-requireesm-16958-by-tats-u), so that `require("prettier")` can use ESM version, but turns out it doesn't work if CommonJS and ESM plugins both imports builtin plugins. To solve this problem, we decide simply remove the `module-sync` condition, so `require("prettier")` will still use the CommonJS version, we'll revisit until `require(ESM)` feature is more stable.

### [`v3.5.1`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#351)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.5.0...3.5.1)

[diff](https://redirect.github.com/prettier/prettier/compare/3.5.0...3.5.1)

##### Fix CLI crash when cache for old version exists ([#&#8203;17100](https://redirect.github.com/prettier/prettier/pull/17100) by [@&#8203;sosukesuzuki](https://redirect.github.com/sosukesuzuki))

Prettier 3.5 uses a different cache format than previous versions, Prettier 3.5.0 crashes when reading existing cache file, Prettier 3.5.1 fixed the problem.

##### Support dockercompose and github-actions-workflow in VSCode ([#&#8203;17101](https://redirect.github.com/prettier/prettier/pull/17101) by [@&#8203;remcohaszing](https://redirect.github.com/remcohaszing))

Prettier now supports the `dockercompose` and `github-actions-workflow` languages in Visual Studio Code.

### [`v3.5.0`](https://redirect.github.com/prettier/prettier/blob/HEAD/CHANGELOG.md#350)

[Compare Source](https://redirect.github.com/prettier/prettier/compare/3.4.2...3.5.0)

[diff](https://redirect.github.com/prettier/prettier/compare/3.4.2...3.5.0)

🔗 [Release Notes](https://prettier.io/blog/2025/02/09/3.5.0.html)

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

