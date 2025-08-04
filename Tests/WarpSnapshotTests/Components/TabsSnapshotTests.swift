import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct TabsSnapshotTests {

    static let isScrollableProvider = [false, true]
    static let hasIconProvider = [false, true]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        isScrollableProvider,
        hasIconProvider
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllTabs(brand: Warp.Brand, isScrollable: Bool, hasIcons: Bool) {
        let snapshotName = [
            ".\(brand.description)",
            isScrollable ? "Scrollable" : nil,
            hasIcons ? "Icon" : nil
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let tabItems = [
            Warp.TabItem(title: "Tab 1", icon: .listSort),
            Warp.TabItem(title: "Longer Tab Title", icon: .listSort),
            Warp.TabItem(title: "Tab 3", icon: .listSort),
            Warp.TabItem(title: "Tab 4", icon: .listSort)
        ]

        let tabs = Warp.Tabs(
            tabs: tabItems.map { hasIcons ? $0 : .init(title: $0.title) },
            selectedIndex: .constant(0),
            scrollable: isScrollable
        )
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: tabs, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
