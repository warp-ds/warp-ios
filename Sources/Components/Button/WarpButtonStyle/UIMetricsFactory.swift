import Foundation

extension Warp.Button {
    /// Factory responsible for resolving button internal element UI drawing needs.
    struct UIMetricsFactory {
        /// Button type.
        private let type: Warp.ButtonType
        
        /// Button size.
        private let size: Warp.ButtonSize
        
        /// Button state.
        /// Flag describing is button enabled for interactions.
        private let isEnabled: Bool
        
        /// Flag describing is button is in loading state.
        private let isLoading: Bool

        init(type: Warp.ButtonType, size: Warp.ButtonSize, isEnabled: Bool, isLoading: Bool) {
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
            self.isLoading = isLoading
        }
        
        /// Button shadow.
        /// It will be determined based on button current state alongside with button type.
        var shadow: Warp.Shadow? {
            if type == .utilityOverlay, isEnabled, !isLoading {
                return .small
            }
            
            return nil
        }

        /// Button border width based on current type.
        var borderWidth: CGFloat {
            switch type {
                case .utility:
                    return 2

                default:
                    return 4
            }
        }

        /// Button corner radius based on current type.
        var cornerRadius: CGFloat {
            if type.isUtilityRelatedButton {
                return 4
            }
            
            return 8
        }
        
        /// Default padding for utility related buttons.
        private let utilityButtonDefaultPadding = 8.0

        /// Button label vertical margin.
        var verticalPadding: CGFloat {
            if type.isUtilityRelatedButton {
                return utilityButtonDefaultPadding
            }

            if size == .big {
                return 13
            }

            return 8
        }

        /// Button label horizontal margin.
        var horizontalPadding: CGFloat {
            if type.isUtilityRelatedButton {
                return utilityButtonDefaultPadding
            }

            if size == .big {
                return 16
            }

            return 12
        }
    }
}
