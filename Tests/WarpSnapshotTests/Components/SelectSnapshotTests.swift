import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SelectSnapshotTests {

    static let selectStyles: [Warp.TextFieldStyle] = [.default, .disabled, .readOnly, .error]

    @Test(.disabled("Disabled due to diffrences between ImageSnapshotRenderer and device look"),arguments: Warp.Brand.allCases)
    func snapshotAllSelects(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand

        let options = [
            Warp.Select.SelectorOption(id: "1", title: "Option 1"),
            Warp.Select.SelectorOption(id: "2", title: "Option 2"),
            Warp.Select.SelectorOption(id: "3", title: "Option 3")
        ]

        let selects = Self.selectStyles.map { style in
            Warp.Select(
                selectedOption: .constant(options.first),
                options: options,
                placeholder: "Select an option",
                title: "\(style.rawValue.capitalized) style",
                additionalInformation: "Additional info",
                tooltipContent: createTooltipView,
                style: style,
                helpText: "This is a Help text."
            )
        }

        let selectsInColumnView = VStack {
            ForEach(selects.indices, id: \.self) { index in
                selects[index]
            }
        }
        .padding(8)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: selectsInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }
}
