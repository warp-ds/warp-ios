import SwiftUI

extension Warp {
    public enum CalloutType {
        public enum PopoverType {
            case dismissable(onTapped: () -> Void)
            case nondismissable
        }

        case inline
        case popover(type: PopoverType)

        var onTapped: (() -> Void)? {
            switch self {
            case .inline:
                return nil
            case .popover(let type):
                switch type {
                case .dismissable(let onTapped):
                    return onTapped
                case .nondismissable:
                    return nil
                }
            }
        }
    }
}
