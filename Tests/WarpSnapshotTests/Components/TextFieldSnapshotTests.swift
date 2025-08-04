import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct TextFieldSnapshotTests {

    static let textFieldStyles = Warp.TextFieldStyle.allCases

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllTextFields(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let textFields = Self.textFieldStyles.map { style in
            Warp.TextField(
                title: "\(style.rawValue.capitalized) style",
                additionalInformation: "Additional info",
                tooltipContent: createTooltipView,
                leftIcon: .search,
                prefix: "prefix",
                text: .constant(""),
                placeholder: "Enter your text here...",
                suffix: "suffix",
                rightIcon: .close,
                style: style,
                helpText:  "This is a Help text."
            )
        }

        let textFieldsInColumnView = VStack {
            ForEach(textFields.indices, id: \.self) { index in
                textFields[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: textFieldsInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }
}
