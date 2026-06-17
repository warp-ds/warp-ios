import SwiftUI

extension Warp {
    /// Styling options for toolbar items displayed in a navigation bar.
    public enum ToolbarItemStyle {
        /// Default style for navigation bar toolbar items.
        /// Uses Warp's icon color for text and body typography. Suitable for secondary or action buttons.
        case `default`

        /// Primary style for navigation bar toolbar items.
        /// Uses Warp's primary button styling with iOS 26+ prominent appearance (glass effect).
        /// Suitable for primary actions that require visual emphasis.
        case primary
    }

    /// A Warp-styled toolbar item for use in navigation bars.
    ///
    /// This struct provides a consistent, theme-aware toolbar item that automatically applies
    /// Warp design tokens for typography, colors, and styling. On iOS 26+, the primary style
    /// uses prominent button appearance with glass effect.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// .toolbar {
    ///     Warp.ToolbarItem(
    ///         title: "Save",
    ///         icon: .save,
    ///         placement: .topBarTrailing,
    ///         style: .primary
    ///     ) {
    ///         save()
    ///     }
    /// }
    /// ```
    ///
    /// Or with just an icon:
    ///
    /// ```swift
    /// .toolbar {
    ///     Warp.ToolbarItem(
    ///         icon: .close,
    ///         placement: .topBarLeading
    ///     ) {
    ///         dismiss()
    ///     }
    /// }
    /// ```
    ///
    /// Or with just a title:
    ///
    /// ```swift
    /// .toolbar {
    ///     Warp.ToolbarItem(
    ///         title: "Done",
    ///         placement: .topBarTrailing
    ///     ) {
    ///         done()
    ///     }
    /// }
    /// ```
    public struct ToolbarItem: ToolbarContent {
        let title: String?
        let icon: Warp.Icon?
        let placement: ToolbarItemPlacement
        let style: ToolbarItemStyle
        let action: () -> Void

        /// Creates a Warp toolbar item with optional title and icon.
        ///
        /// - Parameters:
        ///   - title: Optional text to display in the toolbar item.
        ///   - icon: Optional Warp icon to display.
        ///   - placement: The placement of the toolbar item. Defaults to `.automatic`.
        ///   - style: The visual style of the toolbar item. Defaults to `.default`.
        ///   - action: The action to perform when the toolbar item is tapped.
        public init(
            title: String? = nil,
            icon: Warp.Icon? = nil,
            placement: ToolbarItemPlacement = .automatic,
            style: ToolbarItemStyle = .default,
            action: @escaping () -> Void
        ) {
            self.title = title
            self.icon = icon
            self.placement = placement
            self.style = style
            self.action = action
        }

        public var body: some ToolbarContent {
            SwiftUI.ToolbarItem(placement: placement) {
                WarpToolbarButton(
                    title: title,
                    icon: icon,
                    style: style,
                    action: action
                )
            }
        }
    }
}

private struct WarpToolbarButton: View {
    let title: String?
    let icon: Warp.Icon?
    let style: Warp.ToolbarItemStyle
    let action: () -> Void

    @Environment(\.warpTheme) private var theme

    private var colorProvider: ColorProvider {
        theme.colors
    }

    var body: some View {
        Group {
            switch style {
            case .default:
                SwiftUI.Button(action: action) {
                    buttonContent
                }
                .tint(colorProvider.token.icon)
            case .primary:
                SwiftUI.Button(action: action) {
                    buttonContent
                }
                .buttonStyle(.borderedProminent)
                .tint(colorProvider.buttonPrimaryBackground)
            }
        }
        .buttonBorderShape(.capsule)
    }

    @ViewBuilder
    private var buttonContent: some View {
        HStack(spacing: Warp.Spacing.spacing100) {
            if let icon {
                Warp.IconView(icon, size: .default)
            }
            if let title {
                Warp.Text(title, style: .body)
            }
        }
    }
}
