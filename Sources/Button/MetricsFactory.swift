import Foundation

extension Warp.Button {
    /// Factory responsible for resolving button internal element UI drawing needs.
    struct MetricsFactory {
        private let type: Warp.ButtonType

        private let size: Warp.ButtonSize

        private let isEnabled: Bool

        init(type: Warp.ButtonType, size: Warp.ButtonSize, isEnabled: Bool) {
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
        }

        /// Button shadow radius.
        /// It will be determined based on button current state alongside with button type.
        var shadowRadius: CGFloat {
            switch type {
                case .utilityOverlay:
                    return isEnabled ? 2: 0

                default:
                    return 0
            }
        }

        /// <#Description#>
        var shadowY: CGFloat {
            switch type {
                case .utilityOverlay:
                    return isEnabled ? 1: 0

                default:
                    return 0
            }
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
            switch type {
                case .utility:
                    return 4

                default:
                    return 8
            }
        }

        private var utilityButtonDefaultPadding: CGFloat {
            return 8
        }

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
