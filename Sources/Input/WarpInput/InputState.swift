import Foundation

extension Warp {
    /// States of input view.
    public enum InputState: Equatable, Comparable {
        /// None active input.
        case normal

        /// Focused input.
        case active

        /// Disabled input.
        case disabled

        /// Input that associated validation has failed.
        case error

        /// Read only input.
        case readOnly
        
        /// Flag indicating is input interactive.
        var isDisabled: Bool {
            return self == .disabled
        }
    }
}
