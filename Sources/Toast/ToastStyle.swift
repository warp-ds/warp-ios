import Foundation

extension Warp {
    public enum ToastStyle: Equatable, CaseIterable {
        /// Indicate a severe problem or error.
        case error

        /// Indicating a successful action or completing a task.
        case success

        /// Indicate that something is not working as expected.
        case warning
    }
}
