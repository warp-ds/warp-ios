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
            return self == .disabled || self == .readOnly
        }
    }
}

extension Warp.TextField {
    public enum InformationState: Hashable, Equatable, Comparable {
        case none

        case error(String)

        case helper(String)

        var helperText: String? {
            switch self {
                case .none:
                    return nil

                case let .error(error):
                    return error

                case let .helper(helpText):
                    return helpText
            }
        }
    }
}
