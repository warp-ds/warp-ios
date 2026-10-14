import Testing
@testable import Warp

/// Parent of every suite that changes the global `Warp.Theme`.
///
/// Suites run in parallel, and `.serialized` on a single suite only orders that suite's own tests.
/// Nesting all theme-changing suites here (as `extension ThemeMutatingTests`) runs them one at a
/// time, and each test gets the theme it started with back when it ends.
///
/// Suites outside this parent must not change `Warp.Theme`; pass a brand explicitly instead.
@Suite(.serialized, .restoresWarpTheme)
enum ThemeMutatingTests {}

/// Puts `Warp.Theme` back after each test, so a brand set by one test never leaks into the next.
struct RestoresWarpThemeTrait: SuiteTrait, TestTrait, TestScoping {
    var isRecursive: Bool { true }

    func provideScope(
        for test: Test,
        testCase: Test.Case?,
        performing function: @Sendable () async throws -> Void
    ) async throws {
        let previousTheme = Warp.Theme
        defer { Warp.Theme = previousTheme }
        try await function()
    }
}

extension Trait where Self == RestoresWarpThemeTrait {
    static var restoresWarpTheme: Self { Self() }
}
