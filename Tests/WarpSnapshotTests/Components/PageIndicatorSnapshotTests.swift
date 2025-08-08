import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct PageIndicatorSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllPageIndicators(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let pageIndicator = Warp.PageIndicator(
            pageCount: 4,
            selectedPage: .constant(0)
        )
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: pageIndicator, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
