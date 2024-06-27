import Foundation
import SwiftUI

extension Warp {
    public struct StepIndicatorItem: Identifiable, Equatable {
        public let id = UUID()
        public let title: String
        public let description: String
        public let progress: Progress

        public init(
            title: String,
            description: String,
            progress: Progress = .incomplete
        ) {
            self.title = title
            self.description = description
            self.progress = progress
        }
    }
}

extension Warp.StepIndicatorItem {
    static var mockNotStarted: Self {
        .init(
            title: "Not Started",
            description: "Not Started - Descripion",
            progress: .incomplete
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
            progress: .complete
        )
    }
}
