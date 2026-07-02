import Foundation

extension Warp {
    /// Styling options for buttons displayed in a navigation bar (iOS 26+).
    public enum NavigationBarButtonStyle {
        /// Default style for navigation bar buttons.
        /// Uses Warp's icon color for text and body typography. Suitable for secondary or action buttons.
        case `default`

        /// Primary style for navigation bar buttons.
        /// Uses Warp's primary background color with Liquid Glass prominent button style.
        /// Suitable for primary actions that require visual emphasis.
        case primary
    }
}
