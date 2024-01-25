import Foundation

extension Warp {
    /// States of TextField view.
    public enum TextFieldState: Equatable, Comparable {
        /// None active TextField.
        case normal

        /// Focused TextField.
        case active

        /// Disabled TextField.
        case disabled

        /// TextField that associated validation has failed.
        case error

        /// Read only TextField.
        case readOnly
        
        /// Flag indicating is TextField interactive.
        var isDisabled: Bool {
            return self == .disabled
        }
    }
}
