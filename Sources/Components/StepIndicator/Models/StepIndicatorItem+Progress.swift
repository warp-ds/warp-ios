import Foundation
import SwiftUI

public extension Warp.StepIndicatorItem {
    @MainActor
    enum Progress {
        /// The state of the component when the task or process has not yet been completed.
        case incomplete

        ///  The state of the component when the task or process is in progress, the state shows the user his current step.
        case inProgress

        /// The state of the component when the task or process has been completed.
        case complete

        func fillColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
            switch self {
            case .incomplete: 
                colorProvider.stepIndicatorHandleBackground
            case .inProgress, .complete:
                colorProvider.stepIndicatorHandleBackgroundActive
            }
        }

        func borderColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
            switch self {
            case .incomplete:
                colorProvider.stepIndicatorHandleBorder
            case .inProgress, .complete:
                colorProvider.stepIndicatorHandleBorderActive
            }
        }

        var accessibilityLabel: String {
            switch self {
            case .incomplete: "Incomplete"
            case .inProgress: "In Progress"
            case .complete: "Complete"
            }
        }
    }
}
