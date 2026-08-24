import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct LogoSnapshotTests {

    let logos = Warp.BrandLogo.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllLogos(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand
        let logoViews = logos.map { logo in
            Warp.Logo(for: logo)
        }

        let allLogosInColumnView = VStack {
            ForEach(logos, id: \.self) { logo in
                ForEach(logoViews.indices, id: \.self) { index in
                    logoViews[index]
                    // Group default and small logos
                    if index % 2 == 1 {
                        Divider()
                    }
                }
            }
        }

        assertSnapshot(of: allLogosInColumnView.warpTheme(brand), as: .warpImage(compressionQuality: .high), named: snapshotName)
    }
}
