import Foundation
import SwiftUI

extension Warp {
    public struct StepIndicatorItem: Identifiable, Equatable {
        enum StepLocation {
            case first(nextProgress: Warp.StepIndicatorItem.Progress?)
            case middle(previousProgress: Warp.StepIndicatorItem.Progress, nextProgress: Warp.StepIndicatorItem.Progress)
            case last(previousProgress: Warp.StepIndicatorItem.Progress)
        }
        
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

        public let id = UUID()
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

        static var mockNotStarted: Self {
            .init(
                title: "Not Started",
                description: "Not Started - Descripion",
                progress: .notStarted
            )
        }

        static var mockInProgress: Self {
            .init(
                title: "In Progress",
                description: "In Progress - Descripion",
                progress: .inProgress
            )
        }

        static var mockCompleted: Self {
            .init(
                title: "Completed",
                description: "Completed - Descripion",
                progress: .completed
            )
        }
    }

    
}
