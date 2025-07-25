import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct AlertSnapshotTests {

    typealias ButtonConstructor = Warp.Alert.ButtonConstructor

    static let alertStyle = [
        Warp.AlertStyle.info,
        Warp.AlertStyle.warning,
        Warp.AlertStyle.critical,
        Warp.AlertStyle.success
    ]
    static let titleProvider: [String] = [
        "",
        "Title"
    ]
    static let subtitleProvider: [String] = [
        "",
        "Use this variant to call extra attention to useful, contextual information."
    ]
    static let linkProvider: [ButtonConstructor?] = [
        nil,
        (title: "Visit this link for more information", action: {}),
    ]
    static let buttonProvider: [ButtonConstructor?] = [
        nil,
        (title: "Click me!", action: {}),
    ]
    static let allArgumentsCombined = combine(
        alertStyle,
        titleProvider,
        subtitleProvider,
        linkProvider,
        buttonProvider,
        buttonProvider
    )

    @Test(arguments: Warp.Brand.allCases)
    func snapshotAllAlertsInColumn(brand: Warp.Brand) throws {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let alertViews = Self.allArgumentsCombined.map { (style, title, subtitle, link, primary, secondary) in
            Warp.Alert(
                style: style,
                title: title,
                subtitle: subtitle,
                link: link,
                primaryButton: primary,
                secondaryButton: secondary
            )
        }

        let alertsInColumnView = VStack {
            ForEach(alertViews.indices, id: \.self) { index in
                alertViews[index]
            }
        }
            .padding(8)
            // Set width to match iPhone 13 size
            .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: alertsInColumnView, as: .warpImage(compressionQuality: .high), named: snapshotName)
    }
}

