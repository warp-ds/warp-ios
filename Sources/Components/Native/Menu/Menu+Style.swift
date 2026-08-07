import SwiftUI

extension View {
    /// Applies Warp design tokens (color, font) to a `SwiftUI.Menu` or `ContextMenu` trigger.
    ///
    /// Use this modifier on any `SwiftUI.Menu` label view to apply consistent Warp brand
    /// colors and typography.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// SwiftUI.Menu("Options") {
    ///     Warp.MenuButton("Share", icon: .shareIOS) { share() }
    ///     Warp.MenuButton("Delete", icon: .delete, style: .destructive) { delete() }
    /// }
    /// .warpMenuButton(style: .primary)
    /// ```
    ///
    /// - Parameter style: The visual style to apply. Defaults to `.default`.
    /// - Returns: A view with Warp menu button styling applied.
    public func warpMenuButton(style: Warp.MenuButtonStyle = .default) -> some View {
        modifier(WarpMenuButtonModifier(style: style))
    }
}

private struct WarpMenuButtonModifier: ViewModifier {
    let style: Warp.MenuButtonStyle

    func body(content: Content) -> some View {
        switch style {
        case .default:
            content
                .tint(Warp.Color.token.icon)
                .font(Warp.Typography.body.font)
        case .destructive:
            content
                .tint(Warp.Color.token.iconNegative)
                .font(Warp.Typography.body.font)
        }
    }
}

extension Warp {
    /// A leaf menu action item with optional Warp icon and style.
    ///
    /// Use `Warp.MenuButton` inside a `Warp.Menu` or `.contextMenu` to create
    /// action items that use Warp icons instead of SF Symbols.
    ///
    /// Note: iOS menu items render text with system-controlled color and font.
    /// Only the icon color is controllable via Warp tokens.
    /// Destructive text color is applied automatically by the system via `ButtonRole`.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Warp.Menu("Actions") {
    ///     Warp.MenuButton("Share", icon: .shareIOS) { share() }
    ///     Warp.MenuButton("Delete", icon: .delete, style: .destructive) { delete() }
    /// }
    /// ```
    public struct MenuButton: View {
        let title: String
        let icon: Warp.Icon?
        let style: Warp.MenuButtonStyle
        let action: () -> Void

        /// Creates a leaf menu action item with an optional Warp icon and style.
        ///
        /// - Parameters:
        ///   - title: The text label for the menu item.
        ///   - icon: Optional Warp icon displayed alongside the title.
        ///   - style: The visual style and semantic role. Defaults to `.default`.
        ///   - action: The closure to execute when the item is selected.
        public init(
            _ title: String,
            icon: Warp.Icon? = nil,
            style: Warp.MenuButtonStyle = .default,
            action: @escaping () -> Void
        ) {
            self.title = title
            self.icon = icon
            self.style = style
            self.action = action
        }

        public var body: some View {
            SwiftUI.Button(role: style.buttonRole, action: action) {
                warpMenuItemLabel(title: title, icon: icon, style: style)
            }
        }
    }

    /// A menu container with optional Warp icon.
    ///
    /// Use `Warp.Menu` as a top-level trigger or nested submenu inside another `Warp.Menu`.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Warp.Menu("Actions") {
    ///     Warp.MenuButton("Share", icon: .shareIOS) { share() }
    ///     Warp.Menu("More", icon: .dots) {
    ///         Warp.MenuButton("Bookmark", icon: .bookmark) { bookmark() }
    ///         Warp.MenuButton("Archive", icon: .archiveBox) { archive() }
    ///     }
    ///     Warp.MenuButton("Delete", icon: .delete, style: .destructive) { delete() }
    /// }
    /// ```
    public struct Menu<Content: View>: View {
        let title: String
        let icon: Warp.Icon?
        let content: Content

        /// Creates a menu container with an optional Warp icon.
        ///
        /// - Parameters:
        ///   - title: The text label for the menu trigger row.
        ///   - icon: Optional Warp icon displayed alongside the title.
        ///   - content: The child items displayed in the menu.
        public init(
            _ title: String,
            icon: Warp.Icon? = nil,
            @ViewBuilder content: () -> Content
        ) {
            self.title = title
            self.icon = icon
            self.content = content()
        }

        public var body: some View {
            SwiftUI.Menu {
                content
            } label: {
                warpMenuItemLabel(title: title, icon: icon, style: .default)
            }
        }
    }
}

@ViewBuilder
private func warpMenuItemLabel(title: String, icon: Warp.Icon?, style: Warp.MenuButtonStyle) -> some View {
    SwiftUI.Label {
        SwiftUI.Text(title)
    } icon: {
        if let icon {
            Warp.IconView(icon, size: .small, color: style.iconColor)
        }
    }
}

private extension Warp.MenuButtonStyle {
    var buttonRole: ButtonRole? {
        switch self {
        case .destructive: .destructive
        default: nil
        }
    }

    var iconColor: Color {
        switch self {
        case .default: Color(Warp.Color.token.icon)
        case .destructive: Color(Warp.Color.token.iconNegative)
        }
    }
}
