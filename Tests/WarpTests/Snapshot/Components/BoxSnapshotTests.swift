import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct BoxSnapshotTests {

    static let boxStyle = Warp.BoxStyle.allCases
    static let badgeProvider: [Warp.Badge?] = [nil] + Warp.BadgeVariant.allCases.map { variant in
        Warp.Badge(
            text: "\(variant.rawValue.capitalized).",
            variant: variant
        )
    }
    static let linkProvider: [Warp.Box.ButtonConstructor?] = [
        nil,
        Warp.Box.ButtonConstructor(title: "Visit this link for more information.", action: {})
    ]
    static let buttonProvider: [Warp.Button?] = [nil] + Warp.ButtonType.allCases.map { type in
        Warp.Button(
            title: "\(type.rawValue.capitalized).",
            action: {}
        )
    }
    static let allArgumentsCombined = combine(
        boxStyle,
        badgeProvider,
        linkProvider,
        buttonProvider
    )

    @Test(
        .disabled("Disabled due to the sheer size of combinations, needs to restrict configurations count"),
        arguments: Warp.Brand.allCases
    )
    func snapshotAllBoxesInColumn(brand: Warp.Brand) throws {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let boxViews = Self.allArgumentsCombined.map { (style, badge, link, button) in
            Warp.Box(
                style: style,
                title: "Title",
                badge: badge,
                shouldShowToolTipImage: true,
                subtitle: "Use this variant to call extra attention to useful, contextual information.",
                link: link,
                button: button
            )
        }
        
        // Split boxViews into chunks of 12 due to sheer size of combinations
        // It looks 12 per column is a sweet spot between speed and snapshot size
        let chunkedBoxViews = boxViews.chunked(into: 12)

        for (index, boxViews) in chunkedBoxViews.enumerated() {
            let boxesInColumnView = VStack {
                ForEach(boxViews.indices, id: \.self) { index in
                    boxViews[index]
                }
            }
            .padding(8)
            // Set width to match iPhone 13 size
            .frame(width: ViewImageConfig.iPhone13.size!.width)

            assertSnapshot(of: boxesInColumnView, as: .warpImage(compressionQuality: .high), named: "\(snapshotName).part\(index)")
        }
    }
}

