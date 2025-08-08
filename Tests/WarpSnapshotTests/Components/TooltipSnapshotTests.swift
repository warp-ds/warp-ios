import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct TooltipSnapshotTests {

    static let tooltipEdges = Edge.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllTooltips(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let tooltips = Self.tooltipEdges.map { edge in
            Warp.Tooltip(
                title: "Tooltip at \(edge.description) edge",
                arrowEdge: edge
            )
        }

        let tooltipsInColumnView = VStack {
            ForEach(tooltips.indices, id: \.self) { index in
                tooltips[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: tooltipsInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}

private extension Edge {
    var description: String {
        switch self {
        case .top: return "Top"
        case .bottom: return "Bottom"
        case .leading: return "Leading"
        case .trailing: return "Trailing"
        }
    }
}
