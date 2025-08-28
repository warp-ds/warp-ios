import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct IconSnapshotTests {

    @Test
    func snapshotRegularIcons() {
        Warp.Theme = .vend
        let icons = Warp.Icon.allCases

        let allIconsInRowView = VStack(alignment: .leading) {
            ForEach(icons, id: \.self) { icon in
                HStack {
                    Text(icon.rawValue.capitalized)
                        .font(.caption)
                        .frame(width: 100, alignment: .leading)
                    Warp.IconView(icon, size: .small, color: Warp.Token.icon)
                    Warp.IconView(icon, size: .default, color: Warp.Token.icon)
                    Warp.IconView(icon, size: .large, color: Warp.Token.icon)
                }
            }
        }
        .padding()

        assertSnapshot(of: allIconsInRowView, as: .warpImage(compressionQuality: .high))
    }

    @Test
    func snapshotTaxonomyIcons() {
        Warp.Theme = .vend
        let icons = Warp.TaxonomyIcon.allCases

        let allIconsInRowView = VStack(alignment: .leading) {
            ForEach(icons, id: \.self) { icon in
                HStack {
                    Text(icon.taxonomyAssetName)
                        .font(.caption)
                        .frame(width: 150, alignment: .leading)
                    icon
                        .frame(width: Warp.IconSize.small.value, height: Warp.IconSize.small.value)
                        .foregroundColor(Warp.Token.icon)
                    icon
                        .frame(width: Warp.IconSize.default.value, height: Warp.IconSize.default.value)
                        .foregroundColor(Warp.Token.icon)
                    icon
                        .frame(width: Warp.IconSize.large.value, height: Warp.IconSize.large.value)
                        .foregroundColor(Warp.Token.icon)
                }
            }
        }
        .padding()

        assertSnapshot(of: allIconsInRowView, as: .warpImage(compressionQuality: .high))
    }
}
