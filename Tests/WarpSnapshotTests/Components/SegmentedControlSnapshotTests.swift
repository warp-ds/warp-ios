import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SegmentedControlSnapshotTests {

    static let itemCountProvider = [3, 5]
    static let selectedIndexProvider = [0, 1]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        itemCountProvider,
        selectedIndexProvider
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllSegmentedControls(brand: Warp.Brand, itemCount: Int, selectedIndex: Int) {
        let snapshotName = [
            ".\(brand.description)",
            "\(itemCount)Items",
            "selected\(selectedIndex)"
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let items: [Warp.SegmentedControl.Item] = (0..<itemCount).map { index in
            let titles = [
                "First",
                "Second",
                "Third",
                "Very Long Tab Title",
                "Tab"
            ]
            return .init(
                identifier: "tab\(index)",
                title: titles[index % titles.count]
            )
        }

        let segmentedControl = Warp.SegmentedControl(
            items: items,
            selectedIdentifier: .constant(items[min(selectedIndex, items.count - 1)].identifier)
        )
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(
            of: segmentedControl,
            as: .warpImage(compressionQuality: .medium),
            named: snapshotName
        )
    }
}
