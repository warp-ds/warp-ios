import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct SnackbarSnapshotTests {

    static let snackbarStyles = Warp.SnackbarType.allCases
    static let showCloseButtonOptions = [true, false]
    static let actionModes: [ActionMode] = [.none, .inline, .long]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        snackbarStyles,
        showCloseButtonOptions,
        actionModes
    )

    enum ActionMode {
        case none
        case inline
        case long
    }

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllSnackbars(brand: Warp.Brand, type: Warp.SnackbarType, showCloseButton: Bool, actionMode: ActionMode) {
        let snapshotName = [
            ".\(brand.description)",
            "\(type.description)Style",
            "ShowCloseButton\(showCloseButton.description.capitalized)",
            actionMode.description
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let action = Warp.Snackbar.Action(title: "Action") {}

        let snackbarView: AnyView
        switch actionMode {
        case .none:
            snackbarView = AnyView(
                EmptyView()
                    .warpSnackbar(
                        type: type,
                        title: "Here's a snackbar of type \(type.description)",
                        action: nil,
                        duration: .long,
                        showCloseButton: showCloseButton,
                        isPresented: .constant(true)
                    )
            )
        case .inline:
            snackbarView = AnyView(
                EmptyView()
                    .warpSnackbar(
                        type: type,
                        title: "Here's a snackbar of type \(type.description)",
                        action: action,
                        duration: .long,
                        showCloseButton: showCloseButton,
                        isPresented: .constant(true)
                    )
            )
        case .long:
            snackbarView = AnyView(
                EmptyView()
                    .warpSnackbar(
                        type: type,
                        title: "Here's a snackbar of type \(type.description)",
                        longAction: action,
                        duration: .long,
                        showCloseButton: showCloseButton,
                        isPresented: .constant(true)
                    )
            )
        }

        assertSnapshot(
            of: snackbarView,
            as: .warpImage(layout: .device(config: .iPhone13), compressionQuality: .high),
            named: snapshotName
        )
    }
}

private extension SnackbarSnapshotTests.ActionMode {
    var description: String {
        switch self {
        case .none: return "NoAction"
        case .inline: return "InlineAction"
        case .long: return "LongAction"
        }
    }
}

private extension Warp.SnackbarType {
    var description: String {
        switch self {
        case .positive: return "Positive"
        case .negative: return "Negative"
        case .warning: return "Warning"
        case .info: return "Info"
        case .neutral: return "Neutral"
        }
    }
}

