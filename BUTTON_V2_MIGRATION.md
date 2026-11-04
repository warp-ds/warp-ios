# Migration Guide: Button V2

This guide tracks the move of `Warp.Button` to the Button V2 design. The changes land on `main` in small steps and ship together in one release. Until that release, everything listed under **Landed** is on `main` only.

Every step is additive or a deprecation: existing call sites keep compiling and rendering as before, and the deprecated names are removed only in a later major release.

## Why?

Button V2 aligns `Warp.Button` with the new design spec (FEP-242) and with Android (`WarpButtonStyle` in warp-android) so both platforms use the same names: a `Negative` type instead of `Critical`, three sizes (Medium 48, Small 40, Extra Small 32), an icon-only button, and new types for buttons over images and surfaces.

## Landed

### 1. `critical` is renamed to `negative`

| Before (deprecated) | After |
|---|---|
| `Warp.ButtonType.critical` | `Warp.ButtonType.negative` |
| `Warp.ButtonType.criticalQuiet` | `Warp.ButtonType.negativeQuiet` |

**Before:**
```swift
Warp.Button(title: "Delete", action: delete, type: .critical)
```

**After:**
```swift
Warp.Button(title: "Delete", action: delete, type: .negative)
```

- The old names are deprecated with a `renamed:` fix-it, so Xcode can apply the rename for you.
- `.critical == .negative`, and `case .critical:` still matches in a `switch`.
- **One case does not compile any more:** a `switch` that lists every case using the old names and has no `default`. `critical` is no longer an enum case, so the switch is not exhaustive. Apply the fix-it or add `default`.
- `init(rawValue:)` still accepts `"critical"` and `"criticalQuiet"`, so stored or backend-sent strings keep decoding. `.negative.rawValue` is `"negative"`.
- The buttons look exactly the same.

## Planned

These are not on `main` yet. The list changes as the design decisions land.

- **Sizes:** `extraSmall` (32, today's `small` metrics), a new 40pt `small`, and `medium` (48) as the default. `.small` will be deprecated first so no call site silently grows from 32 to 40. Small and Extra Small keep a 44pt touch target.
- **Icon-only button** in all three sizes, with a required accessibility label.
- **New types** (`overlay`, `overlayElevated`, `overlayInvertedStatic`, `secondaryInvertedStatic`) and deprecation of the `utility` types. There is no one-to-one mapping from `utility`, so they are deprecated without a `renamed:` fix-it.
- **Loading state:** to be decided with design (deprecate or keep).
