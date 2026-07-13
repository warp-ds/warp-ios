import SwiftUI

extension View {
    /// Applies Warp design tokens (color, font) to a `Menu` or `ContextMenu` trigger.
    ///
    /// Use this modifier on any `Menu` label view to apply consistent Warp brand
    /// colors and typography.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Menu("Options") {
    ///     Warp.MenuItem("Share", icon: .shareIOS) { share() }
    ///     Warp.MenuItem("Delete", icon: .delete, role: .destructive) { delete() }
    /// }
    /// .warpMenuButton(style: .primary)
    /// ```
    ///
    /// Or with a custom label:
    ///
    /// ```swift
    /// Menu {
    ///     Warp.MenuItem("Edit", icon: .pencil) { edit() }
    /// } label: {
    ///     Label("More", systemImage: "ellipsis.circle")
    /// }
    /// .warpMenuButton()
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
        case .primary:
            content
                .tint(Warp.Color.buttonPrimaryBackground)
                .font(Warp.Typography.title4.font)
        case .destructive:
            content
                .tint(Warp.Color.token.iconNegative)
                .font(Warp.Typography.body.font)
        }
    }
}

extension Warp {
    /// A `Menu` item view with optional Warp icon.
    ///
    /// Use `Warp.MenuItem` inside a `Menu` or `.contextMenu` to create items
    /// that use Warp icons instead of SF Symbols.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// Menu("Actions") {
    ///     Warp.MenuItem("Share", icon: .shareIOS) { share() }
    ///     Warp.MenuItem("Bookmark", icon: .bookmark) { bookmark() }
    ///     Warp.MenuItem("Delete", icon: .delete, role: .destructive) { delete() }
    /// }
    /// ```
    ///
    /// Text-only (no icon):
    ///
    /// ```swift
    /// Warp.MenuItem("Cancel", role: .cancel) { }
    /// ```
    public struct MenuItem: View {
        let title: String
        let icon: Warp.Icon?
        let role: ButtonRole?
        let action: () -> Void

        /// Creates a menu item with an optional Warp icon.
        ///
        /// - Parameters:
        ///   - title: The text label for the menu item.
        ///   - icon: Optional Warp icon displayed alongside the title.
        ///   - role: Optional semantic role (`.destructive`, `.cancel`). Defaults to `nil`.
        ///   - action: The closure to execute when the item is selected.
        public init(
            _ title: String,
            icon: Warp.Icon? = nil,
            role: ButtonRole? = nil,
            action: @escaping () -> Void
        ) {
            self.title = title
            self.icon = icon
            self.role = role
            self.action = action
        }

        public var body: some View {
            SwiftUI.Button(role: role, action: action) {
                if let icon {
                    SwiftUI.Label {
                        SwiftUI.Text(title)
                    } icon: {
                        Warp.IconView(icon, size: .small)
                    }
                } else {
                    SwiftUI.Text(title)
                }
            }
        }
    }
}
