import SwiftUI

extension Warp {
    public enum CalloutType {
        case inline
        case popover(onTapped: (() -> Void)?)

        var onTapped: (() -> Void)? {
            switch self {
            case .inline:
                return nil
            case .popover(let onTapped):
                return onTapped
            }
        }
    }
}
