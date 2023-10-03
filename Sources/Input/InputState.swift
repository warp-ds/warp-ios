import Foundation

extension Warp {
    /// <#Description#>
    public enum InputState: Equatable, Comparable {
        /// <#Description#>
        case normal

        /// <#Description#>
        case active

        /// <#Description#>
        case disabled

        /// <#Description#>
        case error

        /// <#Description#>
        case readOnly

        var isDisabled: Bool {
            return self == .disabled
        }
    }
}
