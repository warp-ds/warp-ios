import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct TextAreaSnapshotTests {

    static let textAreaStyles = Warp.TextAreaStyle.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllTextAreas(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let textAreas = Self.textAreaStyles.map { style in
            Warp.TextArea(
                title:"\(style.rawValue.capitalized) style",
                additionalInformation: "Additional info",
                tooltipContent: createTooltipView,
                text: .constant(""),
                placeholder: "Enter your text here...",
                style: style,
                helpText: "This is a Help text.",
                minHeight: 120
            )
        }

        let textAreasInColumnView = VStack {
            ForEach(textAreas.indices, id: \.self) { index in
                textAreas[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: textAreasInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }
}
