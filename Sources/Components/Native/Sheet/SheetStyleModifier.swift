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
    }

    /// Background treatment for a Warp-styled sheet.
    ///
    /// The Warp Sheet spec draws two background variants, Glass and Solid. These map to OS
    /// availability rather than to a caller decision: Glass is the iOS 26+ appearance, Solid is
    /// the fallback below it. ``automatic`` resolves that split, matching the `...IfAvailable`
    /// convention used across Warp's other native components.
    public enum SheetBackground {
        /// System default — Liquid Glass on iOS 26+, `surfaceElevated100` below.
        case automatic
        /// Opaque `surfaceElevated100` on every OS version.
        case surface
        /// A caller-supplied background color.
        case color(Color)
        /// No background applied; the presented content styles its own.
        case none

        /// Resolves the color to hand to `presentationBackground`, or `nil` to leave the system
        /// appearance in place — which on iOS 26+ is Liquid Glass.
        ///
        /// `supportsLiquidGlass` is injected rather than read from `#available` inside this
        /// function so that both sides of the branch stay reachable from tests regardless of the
        /// OS the suite happens to run on.
        func resolvedColor(
            token: TokenProvider,
            supportsLiquidGlass: Bool,
            nativeGlassEffectsEnabled: Bool
        ) -> Color? {
            switch self {
            case .automatic:
                let usesGlass = supportsLiquidGlass && nativeGlassEffectsEnabled
                return usesGlass ? nil : token.surfaceElevated100
            case .surface:
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
    /// - **Background:** Resolved from ``Warp/SheetBackground``, which defaults to Liquid Glass on
    ///   iOS 26+ and `surfaceElevated100` below.
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
