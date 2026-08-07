import Foundation

extension Warp {
    /// Styling options for Menu and ContextMenu items.
    ///
    /// Only cases with SwiftUI `ButtonRole` support are included.
    /// Text color in menus is always OS-controlled; only icon color and `ButtonRole` are affected.
    public enum MenuButtonStyle {
        /// Standard menu item with Warp icon color.
        case `default`

        /// Destructive action — system renders text in red via `ButtonRole.destructive`.
        case destructive
    }
}
