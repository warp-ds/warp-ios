import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SliderSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllSliders(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let slider = Warp.Slider(
            value: .constant(0.5),
            range: 0...1
        )

        let sliderContainer = VStack {
            slider
                .padding(.bottom, 24)
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: sliderContainer, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
