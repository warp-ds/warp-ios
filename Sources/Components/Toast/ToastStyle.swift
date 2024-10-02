import Foundation

extension Warp {
    public enum ToastStyle: Equatable, CaseIterable {
        /// Disruptive message describes a critical, fatal error that affects action. Example: Internal server error
        case error

        /// Positive message, which describes successful action. Example: Item added
        case success

        /// Non-critical message, which describes unsuccessful action. Example: Internet disconnected
        case warning
    }
}
