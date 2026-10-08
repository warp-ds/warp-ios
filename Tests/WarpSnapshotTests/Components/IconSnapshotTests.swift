import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct IconSnapshotTests {

    @Test
    func snapshotRegularIcons() {
        let brand = Warp.Brand.vend
        Warp.Theme = brand
        let icons = Warp.Icon.allCases

        let allIconsInRowView = VStack(alignment: .leading) {
            ForEach(icons, id: \.self) { icon in
                HStack {
                    Text(icon.rawValue.capitalized)
                        .font(.caption)
                        .frame(width: 100, alignment: .leading)
                    Warp.IconView(icon, size: .small, color: brand.token.icon)
                    Warp.IconView(icon, size: .default, color: brand.token.icon)
                    Warp.IconView(icon, size: .large, color: brand.token.icon)
                }
            }
        }
        .padding()

        assertSnapshot(of: allIconsInRowView.warpTheme(brand), as: .warpImage(compressionQuality: .high))
    }

    @Test
    func snapshotTaxonomyIcons() {
        let brand = Warp.Brand.vend
        let icons = Warp.TaxonomyIcon.allCases

        let allIconsInRowView = VStack(alignment: .leading) {
            ForEach(icons, id: \.self) { icon in
                HStack {
                    Text(icon.assetName)
                        .font(.caption)
                        .frame(width: 150, alignment: .leading)
                    icon
                        .frame(width: Warp.IconSize.small.value, height: Warp.IconSize.small.value)
                        .foregroundColor(brand.token.icon)
                    icon
                        .frame(width: Warp.IconSize.default.value, height: Warp.IconSize.default.value)
                        .foregroundColor(brand.token.icon)
                    icon
                        .frame(width: Warp.IconSize.large.value, height: Warp.IconSize.large.value)
                        .foregroundColor(brand.token.icon)
                }
            }
        }
        .padding()

        assertSnapshot(of: allIconsInRowView.warpTheme(brand), as: .warpImage(compressionQuality: .high))
    }
}
