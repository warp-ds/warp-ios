import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ExpandableSnapshotTests {

    static let expandableStyles = Warp.ExpandableStyle.allCases
    static let isExpanded = [false, true]
    static let allArgumentsCombined = combine(
        expandableStyles,
        isExpanded
    )

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllExpandableInColumn(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let expandableViews = Self.allArgumentsCombined.map { style, isExpanded in
            Warp.Expandable(
                style: style,
                title: "\(style.rawValue.capitalized) style",
                subtitle: "Expanded - \(isExpanded ? "True" : "false")",
                isAnimated: false,
                isExpanded: isExpanded
            )
        }

        let expandableInColumnView = VStack {
            ForEach(expandableViews.indices, id: \.self) { index in
                expandableViews[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: expandableInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}
