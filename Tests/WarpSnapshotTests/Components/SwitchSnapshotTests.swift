import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SwitchSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllSwitches(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let switches = [
            Warp.Switch(isOn: .constant(true), state: .default),
            Warp.Switch(isOn: .constant(false), state: .default),
            Warp.Switch(isOn: .constant(true), state: .disabled),
            Warp.Switch(isOn: .constant(false), state: .disabled)
        ]

        let switchesInColumnView = VStack {
            ForEach(switches.indices, id: \.self) { index in
                switches[index]
                    .padding(8)
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: switchesInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
