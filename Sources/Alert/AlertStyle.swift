import Foundation

extension Warp {
    /// <#Description#>
    public enum AlertStyle: Equatable {
        /// Display messages to provide user with general information.
        case info

        /// Indicate that something is not working as expected.
        case warning

        /// Indicate a severe problem or error.
        case critical

        /// Indicating a successful action or completing a task.
        case success
    }
}
