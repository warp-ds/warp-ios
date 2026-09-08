import SwiftUI

private struct WarpNavigationBarButtonModifier: ViewModifier {
    @Environment(\.warpTheme) private var theme

    private var token: TokenProvider { theme.token }
    private var colors: ColorProvider { theme.colors }

    let style: Warp.NavigationBarButtonStyle

    @ViewBuilder
    func body(content: Content) -> some View {
        switch style {
        case .default:
            content
                .tint(token.icon)
                .font(Warp.Typography.body.font)
        case .primary:
            prominentContent(content)
                .tint(colors.buttonPrimaryBackground)
                .font(Warp.Typography.title4.font)
        }
    }

    /// `.glassProminent` is iOS 26 only. Below it, `.borderedProminent` is the closest thing the
    /// system offers: same filled, tinted capsule, without the glass material.
    @ViewBuilder
    private func prominentContent(_ content: Content) -> some View {
        if #available(iOS 26.0, *) {
            content.buttonStyle(.glassProminent)
        } else {
            content.buttonStyle(.borderedProminent)
        }
    }
}

extension Button {

    /// Applies Warp design style to a button with Liquid Glass styling.
    ///
    /// This modifier styles the button with the appropriate colors and fonts for navigation bar
    /// placement. The primary style uses `.glassProminent` on iOS 26+ for a glass appearance, and
    /// `.borderedProminent` below it.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Button(action: { /* action */ }) {
    ///     Label("Save", systemImage: "checkmark")
    /// }
    /// .warpNavigationBarButton(style: .primary)
    /// ```
    ///
    /// - Parameter style: The style to apply to the button. Defaults to `.default`.
    /// - Returns: A button with Warp navigation bar styling applied.
    public func warpNavigationBarButton(style: Warp.NavigationBarButtonStyle = .default) -> some View {
        modifier(WarpNavigationBarButtonModifier(style: style))
    }
}
