import Foundation

extension Warp {

    public enum SnackbarType: Equatable, Hashable {
        /// Positive message. Example: Item added
        case positive

        /// Warning message. Example: Internet disconnected
        case warning

        /// Negative message. Example: Internal server error
        case negative

        /// Info message. Example: Generic information
        case info

        /// Neutral message without icon. Example: Generic information
        case neutral

        /// Neutral message with custom icon. Example: Generic information with custom icon
        case neutralIcon(Warp.Icon)
    }
}

extension Warp.SnackbarType: CaseIterable {
    public static var allCases: [Warp.SnackbarType] {
        [.positive, .warning, .negative, .info, .neutral, .neutralIcon(.info)]
    }
}
