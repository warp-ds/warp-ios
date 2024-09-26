import Foundation

extension Warp {
    /// States of TextField view.
    @MainActor
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

        var hasError: Bool {
            switch self {
                case .normal(let informationState), .active(let informationState):
                    return informationState.isError

                default:
                    return false
            }
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
    @MainActor
    public enum InformationState: Hashable, Equatable, Comparable {
        case none

        case error(String)

        case helper(String)

        var isError: Bool {
            switch self {
                case .error:
                    return true

                default:
                    return false
            }
        }

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
