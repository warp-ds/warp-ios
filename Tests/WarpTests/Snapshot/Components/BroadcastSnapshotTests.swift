import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct BroadcastSnapshotTests {

    static let broadcastEdgeProvider = Warp.BroadcastEdge.allCases
    static let isDismissableProvider = [false, true]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        broadcastEdgeProvider,
        isDismissableProvider
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllBroadcastsInColumn(brand: Warp.Brand, edge: Warp.BroadcastEdge, isDismissable: Bool) {
        let snapshotName = [
            ".\(brand.description)",
            "\(edge.description)Edge",
            isDismissable ? "Dismissable" : nil,
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let broadCast = EmptyView()
            .warpBroadcast(
                text: "Here's a broadcast located at the \(edge.description) edge",
                edge: edge,
                isPresented: .constant(true)
            )

        assertSnapshot(
            of: broadCast,
            as: .warpImage(layout: .device(config: .iPhone13) ,compressionQuality: .high),
            named: snapshotName
        )
    }
}

fileprivate extension Warp.BroadcastEdge {
    var description: String {
        switch self {
        case .top: return "Top"
        case .bottom: return "Bottom"
        }
    }
}
