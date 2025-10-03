import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SliderSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotSliders(brand: Warp.Brand) {
        let snapshotName = "\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let combinedView = VStack {
            Spacer(minLength: 40)
            VStack {
                Text("Slider with integers")
                  .font(.headline)
                Warp.Slider(
                      value: .constant(10),
                      range: 0...20,
                      step: 1.0,
                      showRange: true
                  )
                  .padding()
                  .frame(width: 300)
            }

            // With list of strings
            VStack {
                Text("Slider with strings")
                  .font(.headline)
                let items = ["One", "Two", "Three", "Four", "Five"]
                let selectedItems = Binding.constant("Three")
                Warp.Slider(
                      selectedItem: selectedItems,
                      items: items,
                      showRange: true
                  )
                  .padding()
                  .frame(width: 300)
            }

            // With text indicators
            VStack {
                Text("Slider with disabled indicators")
                  .font(.headline)
                Warp.Slider(
                      value: .constant(10),
                      range: 0...20,
                      step: 1.0
                  )
                  .padding()
                  .frame(width: 300)
            }

            // Disabled state
            VStack {
                Text("Disabled Slider")
                  .font(.headline)
                Warp.Slider(
                      value: .constant(10),
                      range: 0...20,
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
