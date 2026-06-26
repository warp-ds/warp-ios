import Testing
import SnapshotTesting
import UIKit
@testable import Warp

@Suite @MainActor
struct WarpTabBarBadgeStylingSnapshotTests {

    /// Snapshots a real (window-hosted) UITabBarController's tab bar with two
    /// badged items (a count and a dot), styled via the Warp helpers. Locks the
    /// brand-red background + Warp-font + textInvertedStatic styling per brand.
    @Test(arguments: Warp.Brand.allCases)
    func snapshotStyledTabBar(brand: Warp.Brand) {
        Warp.Theme = brand
        UITabBar.warpConfigureAppearanceProxy()

        let messages = UIViewController()
        messages.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(systemName: "message.fill"), tag: 0)
        messages.tabBarItem.warpSetBadge(count: 12)

        let alerts = UIViewController()
        alerts.tabBarItem = UITabBarItem(title: "Alerts", image: UIImage(systemName: "bell.fill"), tag: 1)
        alerts.tabBarItem.warpSetBadgeDot()

        let controller = UITabBarController()
        controller.viewControllers = [messages, alerts]
        controller.tabBar.warpStyle()

        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 320, height: 200))
        window.rootViewController = controller
        window.makeKeyAndVisible()
        controller.view.layoutIfNeeded()
        controller.tabBar.setNeedsLayout()
        controller.tabBar.layoutIfNeeded()

        assertSnapshot(of: controller.tabBar, as: .image, named: ".\(brand.description)")
    }
}
