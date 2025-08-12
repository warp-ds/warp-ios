import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ModalSnapshotTests {

    static let subtitleProvider: [String?] = [
        nil,
        "Use this variant to call extra attention to useful, contextual information."
    ]
    static let primaryButtonProvider: [Warp.Modal.ButtonConstructor?] = [
        nil,
        Warp.Modal.ButtonConstructor(title: "Confirm", action: {})
    ]
    static let secondaryButtonProvider: [Warp.Modal.ButtonConstructor?] = [
        nil,
        Warp.Modal.ButtonConstructor(title: "Cancel", action: {})
    ]
    static let hasCloseButtonProvider: [Bool] = [
        false,
        true
    ]
    static let allArgumentsCombined = combine(
        subtitleProvider,
        primaryButtonProvider,
        secondaryButtonProvider,
        hasCloseButtonProvider
    )

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllModalsInColumn(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand

        let modalViews = Self.allArgumentsCombined.map { subtitle, primaryButton, secondaryButton, hasCloseButton in
            Warp.Modal(
                title: "Title",
                subtitle: subtitle,
                bodyText: "Content information for your modal goes here. This is the mobile web variant that has the look and feel of a bottom sheet, which means that it must be pinned to the bottom of the page.",
                primaryButton: primaryButton,
                secondaryButton: secondaryButton,
                hasCloseButton: hasCloseButton,
                isPresented: .constant(true)
            )
        }

        let modalsInColumnView = VStack {
            ForEach(modalViews.indices, id: \.self) { index in
                modalViews[index]
            }
        }
        .padding(8)
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: modalsInColumnView, as: .warpImage(compressionQuality: .high), named: snapshotName)
    }
}
