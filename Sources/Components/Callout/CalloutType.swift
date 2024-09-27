import SwiftUI

extension Warp {
    public enum CalloutType {
        case inline
        case popover(onTapped: @MainActor @Sendable () -> Void)

        var onTapped: (@MainActor @Sendable () -> Void)? {
            switch self {
            case .inline:
                return nil
            case .popover(let onTapped):
                return onTapped
            }
        }
    }
}
