import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ButtonGroupSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllButtonGroups(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let columnView = VStack {
            Text("Single select")
            Warp.ButtonGroup(
                buttons: .constant(createOptions(multiSelect: false))
            )
            Text("Multi select")
            Warp.ButtonGroup(
                buttons: .constant(createOptions(multiSelect: true))
            )
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: columnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private func createOptions(multiSelect: Bool) -> [(title: String, isSelected: Bool)] {
        [
            (title: "Option 1", isSelected: true),
            (title: "Option 2", isSelected: multiSelect ? true : false),
            (title: "Option 3", isSelected: false)
        ]
    }
}
