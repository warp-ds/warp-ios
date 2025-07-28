import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct BadgeSnapshotTests {

    static let iconProvider: [Warp.Icon?] = [nil, .plus]
    static let variantProvider = Warp.BadgeVariant.allCases
    static let badgePositionsProvider = Warp.BadgePosition.allCases
    static let allArgumentsCombined = combine(iconProvider, variantProvider, badgePositionsProvider)

    @Test(arguments: Warp.Brand.allCases)
    func testBadgeSnapshots(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let badgeViews = Self.allArgumentsCombined.map { (icon, variant, position) in
            Warp.Badge(
                text: "\(variant.rawValue) - \(position.rawValue)",
                icon: icon,
                variant: variant,
                position: position
            )
        }

        let badgesInColumnView = VStack {
            ForEach(badgeViews.indices, id: \.self) { index in
                badgeViews[index]
            }
        }
                .padding(8)
                // Set width to match iPhone 13 size
                .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: badgesInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
    
}
