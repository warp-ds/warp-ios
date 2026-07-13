import Foundation

extension Warp {
    /// Styling options for Menu and ContextMenu trigger buttons.
    public enum MenuButtonStyle {
        /// Default style — Warp icon color, body typography.
        case `default`

        /// Primary style — Warp primary brand color, title4 typography. Use for emphasis.
        case primary

        /// Destructive style — Warp negative/danger color, body typography.
        case destructive
    }
}
