import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct CheckboxSnapshotTests {

    static let checkboxStyle = Warp.CheckboxStyle.allCases
    static let layoutAxis: [Axis.Set] = [.vertical, .horizontal]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        checkboxStyle,
        layoutAxis
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllCheckboxes(brand: Warp.Brand, style: Warp.CheckboxStyle, axis: Axis.Set) {
        let snapshotName = [
            ".\(brand.description)",
            "\(style.description)Style",
            "\(axis.description)",
        ].joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let options = [
            ExampleOption(title: "Option 1", isSelected: .constant(false)),
            ExampleOption(
                title: "Option 2",
                isSelected: .constant(true),
                extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary))
            ),
            ExampleOption(
                title: style == .disabled ? "Option disabled" : "Option 3",
                isSelected: .constant(false),
                extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(style == .disabled ? Warp.Token.textDisabled : Warp.Token.textSubtle))
            )
        ]

        let checkboxView = Warp.CheckboxGroup(
            title: "Title",
            helpText: "Help text",
            options: .constant(options),
            style: style,
            axis: axis
        )
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(
            of: checkboxView,
            as: .warpImage(compressionQuality: .medium),
            named: snapshotName
        )
    }
}

private extension Axis.Set {
    var description: String {
        switch self {
        case .vertical: return "Vertical"
        case .horizontal: return "Horizontal"
        default: return "Unknown"
        }
    }
}

private extension Warp.CheckboxStyle {
    var description: String {
        switch self {
        case .default: return "Default"
        case .error: return "Error"
        case .disabled: return "Disabled"
        }
    }
}

private struct ExampleOption: CheckboxOption {
    var id: String { title }
    let title: String
    var isSelected: Binding<Bool>
    var extraContent: AnyView? = nil

    static func ==(lhs: ExampleOption, rhs: ExampleOption) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
