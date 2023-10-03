import Foundation

extension Warp {
    /// <#Description#>
    public enum InputState: Equatable, Comparable {
        case normal
        case active
        case disabled
        case error
        case readOnly

        var isDisabled: Bool {
            return self == .disabled
        }
    }
}
