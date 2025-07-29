import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct PillSnapshotTests {

    static let pillStyles = Warp.PillStyle.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllPillsInColumn(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let pillViews = Self.pillStyles.map { pillStyle in
            createView(for: pillStyle)
        }

        let pillsInColumnView = VStack {
            ForEach(pillViews.indices, id: \.self) { index in
                pillViews[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: pillsInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private func createView(for style: Warp.PillStyle) -> some View {
        let name = String(describing: style)
        let capitalizedName = name.capitalized

        return GroupBox(
            content: {
                VStack {
                    HStack {
                        Warp.Pill(text: String(describing: style), style: style)
                        Warp.Pill(text: String(describing: style), style: style)
                    }
                    HStack {
                        Warp.Pill(text: String(describing: style), icon: .plus, style: style)
                        Warp.Pill(text: String(describing: style), icon: .plus, style: style)
                    }
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}
