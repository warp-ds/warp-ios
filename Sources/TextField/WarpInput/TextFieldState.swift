import Foundation

extension Warp {
    /// States of TextField view.
    public enum TextFieldState: Equatable, Comparable, Hashable {
        /// None active TextField.
        case normal(Warp.TextField.InformationState)

        /// Focused TextField.
        case active(Warp.TextField.InformationState)

        /// Disabled TextField.
        case disabled

        /// Read only TextField.
        case readOnly
        
        /// Flag indicating is TextField interactive.
        var isDisabled: Bool {
            return self == .disabled || self == .readOnly
        }
        
        var helperText: String? {
            switch self {
                case .normal(let informationState), .active(let informationState):
                    return informationState.helperText

                default:
                    return nil
            }
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
