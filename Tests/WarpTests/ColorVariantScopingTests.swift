import Testing
import SwiftUI
import ViewInspector
@testable import Warp

@Suite @MainActor
struct ColorVariantScopingTests {

    private let recorder = ThemeRecorder()

    @Test
    func variantAppliesOnlyInsideTheWrappedView() throws {
        render {
            VStack {
                ThemeProbe(id: "inside", recorder: recorder)
                    .warpColorVariant(.premium)
                ThemeProbe(id: "outside", recorder: recorder)
            }
        }

        #expect(try recorder.context(for: "inside").variant == .premium)
        #expect(try recorder.context(for: "outside").variant == nil)
    }

    @Test
    func nilClearsAnInheritedVariant() throws {
        render {
            VStack {
                ThemeProbe(id: "cleared", recorder: recorder)
                    .warpColorVariant(nil)
                ThemeProbe(id: "inherited", recorder: recorder)
            }
            .warpColorVariant(.premium)
        }

        #expect(try recorder.context(for: "cleared").variant == nil)
        #expect(try recorder.context(for: "inherited").variant == .premium)
    }

    @Test
    func innermostVariantWins() throws {
        let inner = Warp.ColorVariant(name: "inner") { _ in }

        render {
            ThemeProbe(id: "probe", recorder: recorder)
                .warpColorVariant(inner)
                .warpColorVariant(.premium)
        }

        #expect(try recorder.context(for: "probe").variant == inner)
    }

    @Test
    func brandSetInsideAVariantKeepsTheVariant() throws {
        render {
            ThemeProbe(id: "probe", recorder: recorder)
                .warpTheme(.tori)
                .warpColorVariant(.premium)
        }

        let context = try recorder.context(for: "probe")
        #expect(context.brand == .tori)
        #expect(context.variant == .premium)
    }

    @Test
    func variantSetInsideABrandKeepsTheBrand() throws {
        render {
            ThemeProbe(id: "probe", recorder: recorder)
                .warpColorVariant(.premium)
                .warpTheme(.tori)
        }

        let context = try recorder.context(for: "probe")
        #expect(context.brand == .tori)
        #expect(context.variant == .premium)
    }

    // Root brand is set explicitly so no test depends on the `Warp.Theme` global.
    private func render(@ViewBuilder _ content: () -> some View) {
        ViewHosting.host(view: content().warpTheme(.finn))
        ViewHosting.expel()
    }
}

@MainActor
private final class ThemeRecorder {
    private var contexts: [String: WarpThemeContext] = [:]

    func record(_ context: WarpThemeContext, for id: String) {
        contexts[id] = context
    }

    // Throws rather than returning nil, so a probe that never rendered can't pass a `nil` check.
    func context(for id: String) throws -> WarpThemeContext {
        try #require(contexts[id], "probe \(id) never rendered")
    }
}

private struct ThemeProbe: View {
    @Environment(\.warpTheme) private var theme
    let id: String
    let recorder: ThemeRecorder

    var body: some View {
        let _ = recorder.record(theme, for: id)
        Color.clear.frame(width: 1, height: 1)
    }
}
