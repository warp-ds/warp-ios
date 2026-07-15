import SwiftUI
import UIKit

extension Warp {

    /// Defines the presentation style for a Warp-styled sheet.
    public enum SheetStyle {
        /// Half-height sheet with medium and large detents. Shows a drag indicator.
        case medium
        /// Full-height sheet with large detent only. Hides the drag indicator.
        case fullScreen
    }
}

extension Warp {

    struct SheetStyleModifier: ViewModifier {

        let style: Warp.SheetStyle

        @Environment(\.warpTheme) private var theme

        private var colorProvider: ColorProvider {
            theme.colors
        }

        func body(content: Content) -> some View {
            content
                .presentationDetents(detents)
                .presentationDragIndicator(dragIndicator)
                .presentationBackground(colorProvider.token.surfaceElevated100)
                .background {
                    SheetNavigationBarConfigurator()
                }
        }

        private var detents: Set<PresentationDetent> {
            switch style {
            case .medium:
                return [.medium, .large]
            case .fullScreen:
                return [.large]
            }
        }

        private var dragIndicator: Visibility {
            switch style {
            case .medium:
                return .visible
            case .fullScreen:
                return .hidden
            }
        }
    }
}

private struct SheetNavigationBarConfigurator: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> SheetNavigationBarConfiguratorVC {
        SheetNavigationBarConfiguratorVC()
    }

    func updateUIViewController(_ uiViewController: SheetNavigationBarConfiguratorVC, context: Context) {
        uiViewController.applyWarpStyle()
    }
}

private final class SheetNavigationBarConfiguratorVC: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyWarpStyle()
    }

    func applyWarpStyle() {
        guard let navController = findNavigationController() else { return }
        navController.navigationBar.warpStyle()
        navController.navigationBar.tintColor = Warp.UIColor.token.icon
    }

    private func findNavigationController() -> UINavigationController? {
        var current: UIViewController? = self
        while let parent = current?.parent {
            if let nav = parent as? UINavigationController {
                return nav
            }
            current = parent
        }
        return nil
    }
}

public extension View {

    /// Applies Warp design styling to a sheet presentation.
    ///
    /// Apply this modifier to the root content inside a `.sheet { }` closure.
    /// It configures:
    /// - **Font family (title):** Navigation bar title and subtitle use Warp typography tokens.
    /// - **Icons (buttons):** Back indicator uses `Warp.Icon.chevronLeft`; bar button tint uses Warp icon color.
    /// - **Background color:** Sheet background uses `surfaceElevated100`.
    /// - **Detents and drag indicator:** Configured based on the chosen ``Warp/SheetStyle``.
    ///
    /// The navigation bar automatically uses Liquid Glass styling on iOS 26+
    /// and falls back to a solid opaque appearance on earlier versions.
    ///
    /// **Usage:**
    ///
    /// ```swift
    /// .sheet(isPresented: $showSheet) {
    ///     NavigationStack {
    ///         MyContentView()
    ///             .navigationTitle("Title")
    ///     }
    ///     .warpSheetStyle(.medium)
    /// }
    /// ```
    ///
    /// - Parameter style: The sheet presentation style. Defaults to `.medium`.
    /// - Returns: A view with Warp sheet styling applied.
    func warpSheetStyle(_ style: Warp.SheetStyle = .medium) -> some View {
        modifier(Warp.SheetStyleModifier(style: style))
    }
}
