import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct RangeSliderSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotRangeSliders(brand: Warp.Brand) {
        let snapshotName = "\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let combinedView = VStack {
            Spacer(minLength: 40)
            VStack {
                Text("RangeSlider with integers")
                  .font(.headline)
                Warp.RangeSlider(
                      range: .constant(20.0...80.0),
                      bounds: 0.0...100.0,
                      step: 1.0,
                      showRange: true
                  )
                  .padding()
                  .frame(width: 300)
            }

            // With list of strings
            VStack {
                Text("RangeSlider with strings")
                  .font(.headline)
                let items = ["One", "Two", "Three", "Four", "Five"]
                let selectedItems = Binding.constant(["Two", "Four"])
                Warp.RangeSlider(
                      selectedItems: selectedItems,
                      items: items,
                      showRange: true
                  )
                  .padding()
                  .frame(width: 300)
            }

            // With text indicators
            VStack {
                Text("RangeSlider with disabled indicators")
                  .font(.headline)
                Warp.RangeSlider(
                      range: .constant(30.0...70.0),
                      bounds: 0.0...100.0,
                      step: 1.0
                  )
                  .padding()
                  .frame(width: 300)
            }

            // Disabled state
            VStack {
                Text("Disabled RangeSlider")
                  .font(.headline)
                Warp.RangeSlider(
                      range: .constant(40.0...60.0),
                      bounds: 0.0...100.0,
                      step: 1.0,
                      enabled: false
                  )
                  .padding()
                  .frame(width: 300)
            }

            Spacer(minLength: 40)
        }
          .padding()

        assertSnapshot(of: combinedView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
