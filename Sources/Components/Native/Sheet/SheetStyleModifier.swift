import SwiftUI

extension Warp {

    /// Defines the presentation style for a Warp-styled sheet.
    public enum SheetStyle {
        /// Half-height sheet with medium and large detents.
        case medium
        /// Full-height sheet with large detent only.
        case fullScreen

        var detents: Set<PresentationDetent> {
            switch self {
            case .medium:
                return [.medium, .large]
            case .fullScreen:
                return [.large]
            }
        }

        /// Whether the system may ever draw this style with Liquid Glass.
        ///
        /// iOS 26 picks glass or opaque per detent on its own: a partial-height sheet gets glass,
        /// and the same sheet turns opaque the moment it reaches full height. A `.fullScreen`
        /// sheet only ever has the large detent, so it is opaque for its whole life and there is
        /// no glass appearance to preserve.
        var mayRenderAsGlass: Bool {
            switch self {
            case .medium:
                return true
            case .fullScreen:
                return false
            }
        }
    }

    /// Background treatment for a Warp-styled sheet.
    ///
    /// The Warp Sheet spec draws two background variants, Glass and Solid. Solid is a *caller*
    /// decision, not an OS fallback: pick it when translucency would hurt legibility over a busy
    /// backdrop, or when the sheet should read as a focused task rather than an extension of the
    /// view behind it.
    ///
    /// ``automatic`` is the one that tracks the OS, and it deliberately does very little. iOS 26
    /// already switches between glass and opaque by detent without being asked, so ``automatic``
    /// stays out of the way wherever that switch can happen and only supplies a color where the
    /// presentation is opaque for its whole life.
    public enum SheetBackground {
        /// Follows the system: Liquid Glass where iOS 26 would draw it, `surfaceElevated100`
        /// wherever the presentation is opaque anyway.
        case automatic
        /// Opaque `surfaceElevated100` on every OS version. The spec's Solid variant.
        case solid
        /// A caller-supplied background color.
        case color(Color)
        /// No background applied; the presented content styles its own.
        case none

        /// Resolves the color to hand to `presentationBackground`, or `nil` to leave the system
        /// appearance in place.
        ///
        /// `supportsLiquidGlass` is injected rather than read from `#available` inside this
        /// function so that both sides of the branch stay reachable from tests regardless of the
        /// OS the suite happens to run on.
        func resolvedColor(
            token: TokenProvider,
            style: SheetStyle,
            supportsLiquidGlass: Bool,
            nativeGlassEffectsEnabled: Bool
        ) -> Color? {
            switch self {
            case .automatic:
                let usesGlass = supportsLiquidGlass
                    && nativeGlassEffectsEnabled
                    && style.mayRenderAsGlass
                return usesGlass ? nil : token.surfaceElevated100
            case .solid:
                return token.surfaceElevated100
            case .color(let color):
                return color
            case .none:
                return nil
            }
        }
    }
}

private struct WarpNativeGlassEffectsEnabledKey: EnvironmentKey {
    static let defaultValue = true
}

public extension EnvironmentValues {

    /// Whether Warp components may apply native Liquid Glass effects.
    ///
    /// Disable only when the rendering host cannot rasterize native Liquid Glass, such as
    /// offscreen snapshot hosts. Production and interactive previews should keep it enabled.
    var warpNativeGlassEffectsEnabled: Bool {
        get { self[WarpNativeGlassEffectsEnabledKey.self] }
        set { self[WarpNativeGlassEffectsEnabledKey.self] = newValue }
    }
}

extension Warp {

    struct SheetStyleModifier: ViewModifier {

        let style: Warp.SheetStyle
        let dragIndicator: Visibility
        let background: Warp.SheetBackground

        @Environment(\.warpTheme) private var theme
        @Environment(\.warpNativeGlassEffectsEnabled) private var nativeGlassEffectsEnabled

        private var token: TokenProvider { theme.token }

        func body(content: Content) -> some View {
            content
                .presentationDetents(style.detents)
                .presentationDragIndicator(dragIndicator)
                .warpPresentationBackground(
                    background.resolvedColor(
                        token: token,
                        style: style,
                        supportsLiquidGlass: Self.supportsLiquidGlass,
                        nativeGlassEffectsEnabled: nativeGlassEffectsEnabled
                    )
                )
        }

        static var supportsLiquidGlass: Bool {
            if #available(iOS 26.0, *) {
                return true
            }
            return false
        }
    }
}

private extension View {

    /// Applies `presentationBackground` only when a color is supplied, so that passing `nil`
    /// leaves the system's own sheet appearance untouched.
    @ViewBuilder
    func warpPresentationBackground(_ color: Color?) -> some View {
        if let color {
            presentationBackground(color)
        } else {
            self
        }
    }
}

public extension View {

    /// Applies Warp presentation styling to a sheet.
    ///
    /// Apply this modifier to the root content inside a `.sheet { }` closure. It configures:
    /// - **Detents:** Configured based on the chosen ``Warp/SheetStyle``.
    /// - **Drag indicator:** Visible by default, per the Warp Sheet spec, which draws the grabber
    ///   on both the medium and full-screen variants.
    /// - **Background:** Resolved from ``Warp/SheetBackground``. The default, `.automatic`, leaves
    ///   a `.medium` sheet to the system so iOS 26 can draw Liquid Glass, and paints a
    ///   `.fullScreen` sheet with `surfaceElevated100` on every OS version, since a full-height
    ///   sheet is never translucent anyway.
    ///
    /// One case is deliberately left to the system: dragging a `.medium` sheet up to full height
    /// on iOS 26 turns it opaque in Apple's color rather than the brand token. Overriding that
    /// would mean giving up glass at the medium detent, which is the appearance the spec asks for.
    /// Pass `.solid` if a sheet must stay on-brand at every height.
    ///
    /// This modifier covers sheet *presentation* only. Navigation bar styling is a separate
    /// concern: apply it to the content **inside** your `NavigationStack`, not to the sheet root,
    /// so the styling can resolve its parent `UINavigationController`.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// .sheet(isPresented: $showSheet) {
    ///     NavigationStack {
    ///         MyContentView()
    ///             .navigationTitle("Title")
    ///     }
    ///     .warpSheetStyle(.medium)
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - style: The sheet presentation style. Defaults to `.medium`.
    ///   - dragIndicator: Visibility of the grabber. Defaults to `.visible`. Pass `.hidden` for
    ///     sheets that must not be dismissed by dragging, or `.automatic` to defer to the system.
    ///   - background: The sheet background treatment. Defaults to `.automatic`.
    /// - Returns: A view with Warp sheet presentation styling applied.
    func warpSheetStyle(
        _ style: Warp.SheetStyle = .medium,
        dragIndicator: Visibility = .visible,
        background: Warp.SheetBackground = .automatic
    ) -> some View {
        modifier(
            Warp.SheetStyleModifier(
                style: style,
                dragIndicator: dragIndicator,
                background: background
            )
        )
    }
}
