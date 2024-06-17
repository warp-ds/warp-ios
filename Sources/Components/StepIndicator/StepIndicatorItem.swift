import Foundation
import SwiftUI

extension Warp {
    public struct StepIndicatorItem {
        public enum Progress {
            case notStarted
            case inProgress
            case completed

            func fillColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
                switch self {
                case .notStarted:
                    .clear
                case .inProgress, .completed:
                    colorProvider.token.backgroundPrimary
                }
            }

            func borderColor(using colorProvider: ColorProvider) -> SwiftUI.Color {
                switch self {
                case .notStarted:
                    colorProvider.token.border
                case .inProgress, .completed:
                    colorProvider.token.borderPrimary
                }
            }
        }

        public let title: String
        public let description: String
        public let progress: Progress

        public init(
            title: String,
            description: String,
            progress: Progress = .notStarted
        ) {
            self.title = title
            self.description = description
            self.progress = progress
        }
    }
}
