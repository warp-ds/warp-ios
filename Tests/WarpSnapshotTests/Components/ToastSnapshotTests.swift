import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct ToastSnapshotTests {

    static let toastStyles = Warp.ToastStyle.allCases
    static let toastEdges = Warp.ToastEdge.allCases
    static let showCloseButtonOptions = [true, false]
    static let allArgumentsCombined = combine(
        Warp.Brand.allCases,
        toastStyles,
        toastEdges,
        showCloseButtonOptions
    )

    @Test(arguments: Self.allArgumentsCombined)
    func snapshotAllToasts(brand: Warp.Brand, style: Warp.ToastStyle, edge: Warp.ToastEdge, showCloseButton: Bool) {
        let snapshotName = [
            ".\(brand.description)",
            "\(style.description)Style",
            "\(edge.description)Edge"
        ].compactMap { $0 }.joined(separator: ".")

        // Set the theme to the current brand
        Warp.Theme = brand

        let toastView = EmptyView()
            .warpToast(
                style: style,
                title: "Here's a toast of type \(style.description) located at the \(edge.description) edge",
                edge: edge,
                duration: .infinite,
                showCloseButton: showCloseButton,
                isPresented: .constant(true)
            )

        assertSnapshot(
            of: toastView,
            as: .warpImage(layout: .device(config: .iPhone13), compressionQuality: .high),
            named: snapshotName
        )
    }
}

private extension Warp.ToastStyle {
    var description: String {
        switch self {
        case .success: return "Success"
        case .error: return "Error"
        case .warning: return "Warning"
        }
    }
}

private extension Warp.ToastEdge {
    var description: String {
        switch self {
        case .top: return "Top"
        case .bottom: return "Bottom"
        }
    }
}
