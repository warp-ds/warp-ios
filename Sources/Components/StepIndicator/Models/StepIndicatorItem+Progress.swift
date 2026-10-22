import Foundation
import SwiftUI

public extension Warp.StepIndicatorItem {
    enum Progress {
        /// The state of the component when the task or process has not yet been completed.
        case incomplete

        ///  The state of the component when the task or process is in progress, the state shows the user his current step.
        case inProgress

        /// The state of the component when the task or process has been completed.
        case complete

        /// The state of the component when the task or process failed, was canceled or is invalid.
        /// Overrides both `.complete` and `.inProgress` visuals.
        case error

        func fillColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
            switch self {
            case .incomplete, .error:
                colorProvider.token.background
            case .inProgress, .complete:
                colorProvider.token.backgroundPrimary
            }
        }

        func borderColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
            switch self {
            case .incomplete, .error:
                colorProvider.token.border
            case .inProgress, .complete:
                colorProvider.token.borderPrimary
            }
        }

        var accessibilityLabel: String {
            switch self {
            case .incomplete: "Incomplete"
            case .inProgress: "In Progress"
            case .complete: "Complete"
            case .error: Warp.Strings.stepIndicatorStateError.localized
            }
        }
    }
}
