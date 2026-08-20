import SwiftUI

@available(iOS 26.0, *)
private struct WarpNavigationBarButtonModifier: ViewModifier {
    @Environment(\.warpTheme) private var theme

    private var token: TokenProvider { theme.token }
    private var colors: ColorProvider { theme.colors }

    let style: Warp.NavigationBarButtonStyle

    func body(content: Content) -> some View {
        switch style {
        case .default:
            content
                .tint(token.icon)
                .font(Warp.Typography.body.font)
        case .primary:
            content
                .buttonStyle(.glassProminent)
                .tint(colors.buttonPrimaryBackground)
                .font(Warp.Typography.title4.font)
        }
    }
}

extension Button {

    /// Applies Warp design style to a button with Liquid Glass styling.
    ///
    /// This modifier styles the button with the appropriate colors, fonts, and Liquid Glass effects for
    /// navigation bar placement. The primary style uses the `.glassProminent` button style for a glass appearance.
    ///
    /// **Availability:** iOS 26+.
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
    @available(iOS 26.0, *)
    public func warpNavigationBarButton(style: Warp.NavigationBarButtonStyle = .default) -> some View {
        modifier(WarpNavigationBarButtonModifier(style: style))
    }
}
