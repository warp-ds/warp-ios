import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite @MainActor
struct NotificationBadgeSnapshotTests {

    static let typeProvider = Warp.NotificationBadgeType.allCases
    static let sizeProvider = Warp.NotificationBadgeSize.allCases
    static let contentProvider: [Warp.NotificationBadgeContent] = [.dot, .count(1), .count(67), .count(150)]
    static let allArgumentsCombined = combine(typeProvider, sizeProvider, contentProvider)

    @Test(arguments: Warp.Brand.allCases)
    func testNotificationBadgeSnapshotsLight(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description).light"
        Warp.Theme = brand

        let badgeViews = Self.allArgumentsCombined.map { (type, size, content) in
            HStack {
                Text("\(type == .default ? "Default" : "Primary") · \(size == .medium ? "M" : "S") · \(Self.contentLabel(content))")
                    .font(.caption)
                    .frame(width: 140, alignment: .leading)
                Warp.NotificationBadge(content, type: type, size: size, maxCount: 99)
            }
        }

        let badgesInColumnView = VStack(alignment: .leading, spacing: 8) {
            ForEach(badgeViews.indices, id: \.self) { index in
                badgeViews[index]
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: badgesInColumnView.warpTheme(brand), as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func testNotificationBadgeSnapshotsDark(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description).dark"
        Warp.Theme = brand

        let badgeViews = Self.allArgumentsCombined.map { (type, size, content) in
            HStack {
                Text("\(type == .default ? "Default" : "Primary") · \(size == .medium ? "M" : "S") · \(Self.contentLabel(content))")
                    .font(.caption)
                    .frame(width: 140, alignment: .leading)
                Warp.NotificationBadge(content, type: type, size: size, maxCount: 99)
            }
        }

        let badgesInColumnView = VStack(alignment: .leading, spacing: 8) {
            ForEach(badgeViews.indices, id: \.self) { index in
                badgeViews[index]
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: badgesInColumnView.warpTheme(brand), as: .warpImage(traits: UITraitCollection(userInterfaceStyle: .dark), compressionQuality: .medium), named: snapshotName)
    }

    @Test
    func testNotificationBadgeDynamicTypeAccessibility1() {
        let snapshotName = ".finn.accessibility1"
        Warp.Theme = .finn

        let badgeViews = Self.allArgumentsCombined.map { (type, size, content) in
            HStack {
                Text("\(type == .default ? "Def" : "Pri") · \(size == .medium ? "M" : "S") · \(Self.contentLabel(content))")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                Warp.NotificationBadge(content, type: type, size: size, maxCount: 99)
            }
        }

        let badgesInColumnView = VStack(alignment: .leading, spacing: 8) {
            ForEach(badgeViews.indices, id: \.self) { index in
                badgeViews[index]
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)
        .environment(\.dynamicTypeSize, .accessibility1)

        assertSnapshot(of: badgesInColumnView.warpTheme(.finn), as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    @Test
    func testNotificationBadgeDynamicTypeAccessibility5() {
        let snapshotName = ".finn.accessibility5"
        Warp.Theme = .finn

        let badgeViews = Self.allArgumentsCombined.map { (type, size, content) in
            HStack {
                Text("\(type == .default ? "Def" : "Pri") · \(size == .medium ? "M" : "S") · \(Self.contentLabel(content))")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                Warp.NotificationBadge(content, type: type, size: size, maxCount: 99)
            }
        }

        let badgesInColumnView = VStack(alignment: .leading, spacing: 8) {
            ForEach(badgeViews.indices, id: \.self) { index in
                badgeViews[index]
            }
        }
        .padding(16)
        .frame(width: ViewImageConfig.iPhone13.size!.width)
        .environment(\.dynamicTypeSize, .accessibility5)

        assertSnapshot(of: badgesInColumnView.warpTheme(.finn), as: .warpImage(compressionQuality: .medium), named: snapshotName)
    }

    private static func contentLabel(_ content: Warp.NotificationBadgeContent) -> String {
        switch content {
        case .dot:
            return "Dot"
        case .count(let count):
            return "\(count)"
        }
    }
}
