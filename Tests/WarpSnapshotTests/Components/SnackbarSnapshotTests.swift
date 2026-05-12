import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SnackbarSnapshotTests {

    static let snackbarStyles = Warp.Snackbar.`Type`.allCases
    static let showCloseButtonOptions = [true, false]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        snackbarStyles,
        showCloseButtonOptions
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllSnackbars(brand: Warp.Brand, type: Warp.Snackbar.Type, showCloseButton: Bool) {
        let snapshotName = [
            ".\(brand.description)",
            "\(type.description)Style"
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let snackbarView = EmptyView()
            .warpSnackbar(
                type: type,
                title: "Here's a snackbar of type \(type.description)",
                duration: .infinite,
                showCloseButton: showCloseButton,
                isPresented: .constant(true)
            )

        assertSnapshot(
            of: snackbarView,
            as: .warpImage(layout: .device(config: .iPhone13), compressionQuality: .high),
            named: snapshotName
        )
    }
}

private extension Warp.Snackbar.Type {
    var description: String {
        switch self {
        case .success: return "Success"
        case .error: return "Error"
        case .warning: return "Warning"
        }
    }
}

