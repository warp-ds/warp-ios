# Platform support and scope

What OS versions Warp supports, what "support" obliges a component to do, and what qualifies for
moving into Warp from elsewhere.

This is a record of decisions already taken, with dates, so they can be cited instead of re-argued.
It is not a checklist and there is no approval gate here.

## Minimum iOS version

**iOS 18.** Declared in `Package.swift` and tested in CI. Change both in the same PR.

Agreed at the iOS community meeting on **2026-09-02**. The floor tracks NMP's own minimum, which
moved to iOS 18 in June 2026; Warp lagged at `.iOS(.v17)` until [#230](https://github.com/warp-ds/warp-ios/pull/230)
on 2026-09-01.

Historically NMP raises its floor about 22 months after Apple ships a version, so expect iOS 26 to
become the floor somewhere in 2027 rather than soon. Treat the pre-26 branch as roughly a year of
real usage, not a rounding error, but also not permanent.

Before assuming a version is about to be dropped, check for an in-app sunset message for it in
`ios-app`. One ships ahead of every drop.

### How the floor is tested

Since [#237](https://github.com/warp-ds/warp-ios/pull/237) on **2026-09-18**, every PR runs the
tests twice: once on the minimum (iOS 18) and once on the latest (iOS 26). The matrix is in
`.github/workflows/run-tests.yml`, and its `ios-major: "18"` leg is the second place the floor is
written down. Raising the floor in `Package.swift` without moving that leg keeps testing a
version Warp no longer supports.

Both legs run on `macos-15`, because it is the only GitHub runner image with iOS 18 and iOS 26
runtimes side by side. `macos-26` has no iOS 18 runtime and can't download one. When `macos-15`
is retired, the minimum leg needs a new home or the floor has to move. The reasoning is in the
comments at the top of the workflow.

## What "support" obliges

**A public Warp API must do something on the minimum supported version.**

An API that compiles on iOS 18 and silently does nothing there is a defect, not a scoping decision.
The consumer has no way to see it: no warning, no crash, no visual clue, and green tests.

Two honest ways to handle a feature that genuinely needs a newer OS:

- **Gate it at compile time** with `@available`, so callers below the floor get an error rather
  than silence.
- **Degrade it**, so the API does the nearest sensible thing on older versions.

What is not acceptable is a runtime `guard #available(...) else { return }` in a public entry point
that leaves the caller believing it worked.

Prefer degrading. Reach for `@available` only when there is no meaningful fallback.

### Let the system degrade itself where it already does

Check what the OS does before writing a fallback. Sheets are the worked example: iOS 26 already
renders a `.medium` detent as Liquid Glass and turns the same sheet opaque once it reaches full
height, with no API call. A hand-written version branch there fights the system rather than helping
it. See `SheetStyleModifier.swift`, which landed with
[#220](https://github.com/warp-ds/warp-ios/pull/220) (WARP-1410) on 2026-09-18.

## Designing for versions below iOS 26

Settled by **Adrian Dick** and **Jonas Olsson** on **2026-09-03**, after
[#220](https://github.com/warp-ds/warp-ios/pull/220) raised it.

There are no Figma designs for pre-26 native components and there will not be any. Instead:

- **No new frames below iOS 26.** Design optimises for the current version.
- **Port what the apps already ship** rather than inventing an appearance.
- **Write the degradation down** where the component lives, so the difference is discoverable in
  code rather than by running an old simulator.
- **Put screenshots in the PR** and let designers flag anything that looks wrong. No named approver
  and no sign-off step.
- **Useable, not perfect.** In Jonas's words, if we get complaints about something specific we can
  spend a little time making that better.

The reason it is worth this little: the number of users on iOS 18 is small and shrinking every
month, and the branch has a known end date.

### Precedents

- `GlassSegmentedControl` (`Sources/Components/Native/SegmentedControl/`) shipped with an
  `if #available(iOS 26, *)` split, an unspecced pre-26 branch, and snapshot tests across all six
  brands. It set this pattern before it was written down.
- WARP-1451 applies it to the navigation bar style modifiers. It landed on `main` directly as
  `f8dba32` and `851f41b`; [#235](https://github.com/warp-ds/warp-ios/pull/235) holds the review
  discussion and was closed on 2026-09-22 with nothing left to merge.
- WARP-1410's sheet style modifiers ([#220](https://github.com/warp-ds/warp-ios/pull/220),
  2026-09-18) apply the other half: no version branch at all, because iOS 26 already picks glass
  or opaque per detent.

## Moving implementations into Warp

Drive, FinniversKit and the NMP app modules contain UI that arguably belongs in the design system.
Some of it should move. Not all of it.

**The bar: it has to be well thought through, and either already used widely or ready to be used
widely.**

A thing clears the bar when:

- **It is proven.** Running in production across more than one app, or deliberately built to be
  general.
- **It is coherent.** A considered design, not an accretion of fixes for one team's screen. If it
  was written with a single brand or surface in mind and never validated elsewhere, it needs that
  validation before it moves, not after.
- **It is genuinely shared.** Something one app uses in one place belongs in that app.

A thing does not clear the bar merely because it is useful, or because Warp is a tidier home for
it. Being widely used is necessary but not sufficient: widely used code can still be
under-considered, and moving it unchanged would import that into the design system, where it is
much harder to fix.

### The move has to be clean

**Andrii Momot**, 2026-08-31, and it is a hard condition: code lands in Warp, the wrapper in Drive
is deleted, and Drive's call sites import Warp directly. If the result is Warp plus a forwarding
layer left behind in Drive, do not do it - docs and skills cover that case more cheaply.

Andrii softened this to case-by-case on 2026-09-01 for the navigation style modifiers specifically,
where the team wants Warp to own the behaviour outright.

### Practical notes

- **FinniversKit imports Warp, so Warp cannot import FinniversKit.** This blocks less than it
  appears to. Check what a given import is actually used for first: many FinniversKit colours and
  fonts are one-line forwards to Warp tokens, so the import often disappears by substitution rather
  than by rewriting.
- **Check the whole dependency chain before picking a pilot.** `driveStyledSheet` calls
  `presentationDetentsAutomatic`, so `AutomaticSheetSizeModifier` has to move first regardless of
  how independent it looks.

---

*Last reviewed 2026-09-30. Every claim above is dated; if a date looks old, verify before relying
on it.*
