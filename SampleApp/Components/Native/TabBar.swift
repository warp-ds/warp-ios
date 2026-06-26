import SwiftUI
import UIKit
import Warp

/// One tab's badge state in the demo.
enum DemoTabBadge: Equatable {
    case count(Int)
    case dot
}

struct WarpTabBarControllerWrapper: UIViewControllerRepresentable {
    @Environment(\.warpTheme) private var theme
    /// index -> badge; absent index means no badge.
    var badges: [Int: DemoTabBadge]

    func makeUIViewController(context: Context) -> UITabBarController {
        Warp.Theme = theme
        return WarpStyledTabBarController(brand: theme)
    }

    func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        // Brand is synced at creation only (see makeUIViewController). Badges ARE
        // reactive: apply the SwiftUI-driven state to each tab item every update.
        let items = uiViewController.viewControllers?.map { $0.tabBarItem } ?? []
        for (index, item) in items.enumerated() {
            guard let item else { continue }
            switch badges[index] {
            case .count(let value): item.warpSetBadge(count: value)
            case .dot:              item.warpSetBadgeDot()
            case .none:             item.warpClearBadge()
            }
        }
    }
}

private final class WarpStyledTabBarController: UITabBarController {
    private let brand: Warp.Brand

    init(brand: Warp.Brand) {
        self.brand = brand
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) is not supported") }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Mirrors the ios-app main tab bar: same titles + the same icon assets
        // (copied from ios-app's TabBar module into the SampleApp catalogs).
        viewControllers = [
            frontpageViewController(),
            tabViewController(title: "Notifications", normalImage: "tabbarNotifications", activeImage: "tabbarNotificationsActive"),
            tabViewController(title: "New ad",       normalImage: "tabbarAdin",          activeImage: "tabbarAdinActive"),
            tabViewController(title: "Messages",     normalImage: "tabbarMessaging",     activeImage: "tabbarMessagingActive"),
            tabViewController(title: "My page",      normalImage: "tabbarProfile",       activeImage: "tabbarProfileActive"),
        ]

        // Demonstrates both forms of the API working together:
        // - warpConfigureAppearanceProxy() sets the global UITabBar.appearance()
        //   proxy. In a real app, call it once at launch (e.g. in App.init) so
        //   every UITabBar in the app gets brand styling for free.
        // - warpStyle() applies full styling to this specific instance,
        //   including the compact-only unselectedItemTintColor rule and the
        //   trait observer (neither of which the proxy form covers).
        UITabBar.warpConfigureAppearanceProxy()
        warpStyle()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Mirrors the ios-app pattern: iOS 26 appearance config takes full effect
        // only after the bar is fully laid out, so warpStyle() runs in both lifecycle
        // hooks. The instance dedup-guards trait observers so this is safe.
        warpStyle()
    }

    private func frontpageViewController() -> UIViewController {
        // FINN overrides the Frontpage tab with its branded logo — mirrors ios-app's
        // `homeOverriddenImages`, gated to the FINN target. ios-app tints the unselected
        // glyph with the icon token but uses the selected logo AS-IS (it's a full-colour
        // image with light/dark variants), so the colour shows when selected:
        //   TabBarImages(image: image.withTintColor(.icon, …), selectedImage: selectedImage)
        // All other brands use the generic home icon.
        guard brand == .finn else {
            return tabViewController(title: "Frontpage", normalImage: "tabbarHome", activeImage: "tabbarHomeActive")
        }
        let vc = ScrollableContentViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Frontpage",
            image: UIImage(named: "tabbarFrontpageFINN")?.warpTabBarItemTinted(state: .normal),
            selectedImage: UIImage(named: "tabbarFrontpageFINNActive")
        )
        return vc
    }

    private func tabViewController(title: String, normalImage: String, activeImage: String) -> UIViewController {
        // Mirrors ios-app's TabBarItem+Extensions.swift: a separate outline (normal)
        // and filled (selected/"Active") template asset per tab, each tinted with the
        // right Warp token via `warpTabBarItemTinted(state:)`
        // (`withTintColor(_:renderingMode: .alwaysOriginal)`). The icons are the real
        // ios-app tab icons, copied into the SampleApp catalogs as template images.
        let vc = ScrollableContentViewController()
        vc.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(named: normalImage)?.warpTabBarItemTinted(state: .normal),
            selectedImage: UIImage(named: activeImage)?.warpTabBarItemTinted(state: .selected)
        )
        return vc
    }
}

/// Renders a tall scrollable column of Warp-token-colored rows so the tab
/// bar's Liquid Glass effect (iOS 26+) refracts brand-aware content as the
/// user scrolls. Each row is labelled with the token name powering it.
private final class ScrollableContentViewController: UIViewController {
    /// Pairs of `(tokenName, color)` shown on the row's background + label.
    /// Resolved at row-creation time so brand changes pick up correctly when
    /// the demo is re-entered.
    private static func rowPalette() -> [(name: String, color: UIColor)] {
        [
            ("backgroundNotification", Warp.UIToken.backgroundNotification),
            ("backgroundPrimary",      Warp.UIToken.backgroundPrimary),
            ("backgroundPositive",     Warp.UIToken.backgroundPositive),
            ("backgroundNegative",     Warp.UIToken.backgroundNegative),
            ("backgroundWarning",      Warp.UIToken.backgroundWarning),
            ("backgroundInfo",         Warp.UIToken.backgroundInfo),
            ("backgroundSecondary",    Warp.UIToken.backgroundSecondary),
            ("backgroundInverted",     Warp.UIToken.backgroundInverted),
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Warp.UIToken.background

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        // Bar overlap is fine here — that's the point: content scrolls under the
        // bar so the Liquid Glass refraction is visible.
        scrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(scrollView)

        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stack)

        let palette = Self.rowPalette()
        // 40 rows is enough to require scrolling on every device size.
        for index in 0..<40 {
            let entry = palette[index % palette.count]
            stack.addArrangedSubview(makeRow(name: entry.name, color: entry.color))
        }

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stack.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 16),
            stack.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            stack.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: 16),
            stack.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor, constant: -32),
        ])
    }

    private func makeRow(name: String, color: UIColor) -> UIView {
        let row = UIView()
        row.backgroundColor = color
        row.layer.cornerRadius = 12
        row.translatesAutoresizingMaskIntoConstraints = false
        row.heightAnchor.constraint(equalToConstant: 88).isActive = true

        let label = UILabel()
        label.text = name
        label.font = .preferredFont(forTextStyle: .headline)
        // `iconInverted` reads well on most Warp background tokens which tend
        // to be vivid/dark; falls back gracefully for the few lighter tokens.
        label.textColor = Warp.UIToken.iconInverted
        label.translatesAutoresizingMaskIntoConstraints = false
        row.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: row.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: row.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: row.trailingAnchor, constant: -16),
        ])
        return row
    }}
