import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct AlertSnapshotTests {

    typealias Button = Warp.Alert.ButtonConstructor

    static let alertStyle = [
        Warp.AlertStyle.info,
        Warp.AlertStyle.warning,
        Warp.AlertStyle.critical,
        Warp.AlertStyle.success
    ]

    static let linkProvider: [Warp.Alert.ButtonConstructor?] = [
        nil,
        nil,
        nil,
        (title: "Action", action: {}),
    ]

    static let buttonProvider: [Warp.Alert.ButtonConstructor?] = [
        nil,
        nil,
        nil,
        (title: "Click me!", action: {}),
    ]

    @Test(arguments: AlertSnapshotTests.alertStyle, AlertSnapshotTests.linkProvider, AlertSnapshotTests.buttonProvider, AlertSnapshotTests.buttonProvider)
    func testAlert(style: Warp.AlertStyle, link: Button?, primary: Button?, secondary: Button?) throws {
        let alert = Warp.Alert(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            link: link,
            primaryButton: primary,
            secondaryButton: secondary
        )

        let snapshotName = [
            "\(style.rawValue)Style",
            (link != nil) ? "Link" : nil,
            (primary != nil) ? "Primary" : nil,
            (secondary != nil) ? "Secondary" : nil,
            "Alert"
        ].compactMap() { $0 }.joined(separator: ".")

        assertSnapshot(of: alert, as: .warpImage, named: snapshotName)
    }
}

