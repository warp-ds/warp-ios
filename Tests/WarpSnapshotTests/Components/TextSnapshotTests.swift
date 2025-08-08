import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct TextSnapshotTests {

    static let textVariants = Warp.TextStyle.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotTextVariants(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let textViews = Self.textVariants.map { variant in
            Warp.Text(String(describing: variant).capitalized, style: variant)
                .padding()
        }

        let textViewsInColumn = VStack {
            ForEach(textViews.indices, id: \.self) { index in
                textViews[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: textViewsInColumn, as: .warpImage(compressionQuality: .high), named: snapshotName)
    }
}
