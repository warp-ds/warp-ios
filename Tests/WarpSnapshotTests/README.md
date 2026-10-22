# Snapshot Tests

This directory contains snapshot tests for Warp components. The tests capture reference images of components and compare them against new renders to detect visual regressions.

## Pinned Setup

The record workflow (`.github/workflows/record-snapshots.yml`) records references on a pinned environment, so they are reproducible. Older references were recorded locally on other setups and are being re-recorded on this one.

| Component | Version/Configuration |
|-----------|----------------------|
| macOS runner | macos-15 (runner images can't be pinned; each run logs its image version) |
| Xcode | 26.3, build 17C529 (`/Applications/Xcode_26.3.app`) |
| Device | iPhone 17 Pro |
| iOS Runtime | iOS 26.0.1 (com.apple.CoreSimulator.SimRuntime.iOS-26-0) |
| swift-snapshot-testing | 1.19.2 |
| SnapshotTestingHEIC | 1.6.0 |

If a runner image update removes the pinned Xcode or runtime, the workflow fails with an error instead of recording on a different setup. Update the pin in the workflow's `env:` block and re-record all references.

This setup uses iOS 26 because it is the latest OS version and renders iOS 26-specific styling (`.glassProminent`, `UIBarButtonItem.Style.prominent`) that designers compare against. The iOS 18 minimum is covered by the main `WarpTests` suite.

## Changed a Component's Look?

When you modify a component's appearance, you need to update the snapshot references. **Do not commit locally recorded references.** Local environments (your Mac's Xcode version, simulator, and library versions) differ from CI, which will cause spurious failures.

Instead, use the GitHub Actions workflow to record references on the pinned setup:

1. Push your changes to a feature branch.
2. Go to **Actions → Record Snapshot References** in GitHub.
3. Click **Run workflow** and select your branch.
4. In the inputs:
   - **suites**: Enter the suite name for the component you changed (e.g., `ButtonSnapshotTests`). You can specify multiple suites separated by commas (e.g., `ButtonSnapshotTests,DividerSnapshotTests`). Leave empty to run all suites.
   - **mode**: Select `failed` to re-record only failing snapshots, or `all` to re-record all snapshots in the selected suites.
   - **push**: Check this to commit and push the new references to your branch. Leave unchecked to only download the artifact.
5. Wait for the workflow to complete. It records the references, verifies them, and (if you selected push) commits them to your branch.
6. If you did not select push, download the `snapshot-references` artifact, copy its `__Snapshots__` folders over the ones in this directory, and commit them. Don't commit `snapshot-env.txt`; it only records the setup the run used.

The workflow runs two test passes: first to record the new references (this will fail because recording causes tests to report differences), then to verify that the recorded references reproduce (this must pass). If verification fails, the references are not reproducible and should not be committed.

Two limits to know about:

- A commit pushed by the workflow does not trigger the pull request's checks (GitHub doesn't start workflows for commits made with its own token). Push another commit (`git commit --allow-empty` works) so the checks run on it before merging.
- The workflow needs write access to the repository, so it can't be dispatched on a branch in a fork. Ask a maintainer to record for you.

## Pull Request Checks

Every pull request runs the **Snapshot Tests** check, which compares all snapshot tests against the committed references on the pinned setup. When it fails, the run has two artifacts: `snapshot-failures` holds the actual renders of the failing tests, by test file, and `snapshot-tests-xcresult` opens in Xcode with each failure's reference, failure and difference images. If the change is intended, record new references as described above; if not, fix the code. The check is advisory for now, while we confirm the setup is stable.

## Bumping Library Pins

If you need to bump `swift-snapshot-testing` or `SnapshotTestingHEIC` to a newer version, that change requires its own PR with a full re-record of all snapshot references:

1. Update `Package.resolved` to the new library version.
2. Run the record workflow with `mode: all` and an empty `suites` input (to record all suites).
3. Verify the differences are expected (encoding changes, rendering differences from library updates).
4. Commit the new `Package.resolved` and all updated references together in one PR.

This ensures the library version and references stay in sync, and no references from an older library version remain in the repository.
