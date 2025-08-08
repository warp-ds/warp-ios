import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ButtonSnapshotTests {

    static let buttonTypes = Warp.ButtonType.allCases
    static let buttonSizes = Warp.ButtonSize.allCases
    static let leadingIconProvider: [Warp.Icon?] = [
        nil,
        Warp.Icon.plus
    ]
    static let trailingIconProvider: [Warp.Icon?] = [
        nil,
        Warp.Icon.arrowUp
    ]
    static let isEnabledProvider: [Bool] = [
        true,
        false
    ]
    static let fullWidthProvider: [Bool] = [
        false,
        true
    ]
    static let isLoadingProvider: [Bool] = [
        false,
        true
    ]

    @Test(arguments: combine(Warp.Brand.allCases, Self.buttonTypes))
    func snapshotAllButtons(brand: Warp.Brand, buttonType: Warp.ButtonType) {
        let snapshotName = [
            ".\(brand.description)",
            "\(buttonType.description)"
        ].compactMap { $0 }.joined(separator: ".")
        // Set the theme to the current brand
        Warp.Theme = brand

        let configurations = combine(
            Self.buttonSizes,
            Self.leadingIconProvider,
            Self.trailingIconProvider,
            Self.isEnabledProvider,
            Self.fullWidthProvider,
            Self.isLoadingProvider
        )

        let buttons = configurations.map { buttonSize, leadingIcon, trailingIcon, isEnabled, fullWidth, isLoading in
            let buttonTitle = [
                "\(buttonType.description.capitalized)",
                (fullWidth ? "full width" : nil),
                (buttonSize == .small ? "small" : nil),
                (leadingIcon != nil ? "leading icon" : nil),
                (trailingIcon != nil ? "trailing icon" : nil),
                (isEnabled ? nil : "disabled"),
                (isLoading ? "loading" : nil)
            ].compactMap { $0 }.joined(separator: " ")

            return Warp.Button(
                title: buttonTitle,
                leadingIcon: leadingIcon,
                trailingIcon: trailingIcon,
                action: {},
                type: buttonType,
                size: buttonSize,
                isEnabled: isEnabled,
                fullWidth: fullWidth,
                isLoading: isLoading
            )
        }

        let buttonsInColumnView = VStack(alignment: .leading) {
            ForEach(buttons.indices, id: \.self) { index in
                buttons[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13ProMax.size!.width)

        assertSnapshot(of: buttonsInColumnView, as: .warpImage(compressionQuality: .high), named: snapshotName)
    }
}

private extension Warp.ButtonType {
    var description: String {
        switch self {
        case .primary: return "primary"
        case .secondary: return "secondary"
        case .quiet: return "quiet"
        case .critical: return "destructive"
        case .criticalQuiet: return "criticalQuiet"
        case .utility: return "utility"
        case .utilityQuiet: return "utilityQuiet"
        case .utilityOverlay: return "utilityOverlay"
        }
    }
}
