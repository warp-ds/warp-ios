import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ButtonPillSnapshotTests {

    static let buttonPillTypes = Warp.ButtonPillType.allCases
    static let isSelectedProvider: [Bool] = [
        false,
        true
    ]

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllButtonPills(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let configurations = combine(
            Self.buttonPillTypes,
            Self.isSelectedProvider
        )
        let buttonPills = configurations.map { buttonPillType, isSelected in
            let buttonPillTitle = [
                "\(buttonPillType.description)",
                (isSelected ? "selected" : nil)
            ].compactMap { $0 }.joined(separator: " ")
            let view =  Warp.ButtonPill(
                type: buttonPillType,
                selected: .constant(isSelected)
            )
            return (title: buttonPillTitle, view: view)
        }

        let buttonPillsInColumnView = VStack(alignment: .leading) {
            ForEach(buttonPills.indices, id: \.self) { index in
                HStack {
                    buttonPills[index].view
                    Text(buttonPills[index].title)
                }
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: buttonPillsInColumnView, as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }
}

private extension Warp.ButtonPillType {
    static let allCases: [Warp.ButtonPillType] = [
        .flat,
        .overlay
    ]
    var description: String {
        switch self {
        case .flat: return "Flat"
        case .overlay: return "Overlay"
        }
    }
}
