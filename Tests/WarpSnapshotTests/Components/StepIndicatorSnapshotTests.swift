import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct StepIndicatorSnapshotTests {

    static let layoutOrientation: [Warp.StepIndicator.LayoutOrientation] = [.horizontal, .vertical]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        layoutOrientation
    )

    let stepsModelItems: [Warp.StepIndicatorItem] = [
        .init(
            title: "Step 1",
            description: "progress = .complete",
            progress: .complete
        ),
        .init(
            title: "Step 2",
            description: "progress = .inProgress",
            progress: .inProgress
        ),
        .init(
            title: "Step 3",
            description: "progress = .incomplete",
            progress: .incomplete
        )
    ]

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllStepIndicators(brand: Warp.Brand, orientation: Warp.StepIndicator.LayoutOrientation) throws {
        let snapshotName = [
            ".\(brand.description)",
            "\(orientation.description)",
        ].compactMap { $0 }.joined(separator: ".")
        // Set the theme to the current brand
        Warp.Theme = brand

        let stepModel = try Warp.StepIndicatorModel(from: stepsModelItems)
        let stepIndicator = Warp.StepIndicator(
            layoutOrientation: orientation,
            stepModel: stepModel
        )
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width + (orientation == .horizontal ? 70 : 0)) // Adjust for horizontal

        assertSnapshot(of: stepIndicator, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}

private extension Warp.StepIndicator.LayoutOrientation {
    var description: String {
        switch self {
        case .horizontal:
            return "Horizontal"
        case .vertical:
            return "Vertical"
        }
    }
}
