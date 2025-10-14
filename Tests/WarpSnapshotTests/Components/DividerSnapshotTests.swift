import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite
@MainActor
struct DividerSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotDivider(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let dividerView = VStack(spacing: 40) {
            Text(brand.description)
              .font(.headline)
            VStack(spacing: 16) {
                VStack(spacing: 30) {
                    Text("Horizontal solid divider").font(.body)
                    Warp.Divider(orientation: .horizontal, style: .solid)
                    Text("Horizontal dashed divider").font(.body)
                    Warp.Divider(orientation: .horizontal, style: .dashed)
                }
            }
            VStack(spacing: 16) {
                HStack(spacing: 30) {
                    Text("Vertical solid divider").font(.body)
                    Warp.Divider(orientation: .vertical, style: .solid)
                    Warp.Divider(orientation: .vertical, style: .dashed)
                    Text("Vertical dashed divider").font(.body)
                }
            }
              .frame(minHeight: 200)
        }
          .padding()
          .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: dividerView, as: .warpImage, named: snapshotName)
    }
}
