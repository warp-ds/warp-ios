import Foundation

extension Warp {

    public enum SnackbarType: Equatable, CaseIterable {
        /// Positive message. Example: Item added
        case positive

        /// Warning message. Example: Internet disconnected
        case warning

        /// Negative message. Example: Internal server error
        case negative

        /// Neutral message. Example: Generic information
        case neutral
    }
}
