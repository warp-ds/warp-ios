import SwiftUI

// create a wrapper for UINavigationController to apply the Warp style
struct NavigationControllerWrapper<Content: View>: UIViewControllerRepresentable {
    let content: Content
    var rightBarButtonItems: [UIBarButtonItem]?

    init(@ViewBuilder content: () -> Content, rightBarButtonItems: [UIBarButtonItem]? = nil) {
        self.content = content()
        self.rightBarButtonItems = rightBarButtonItems
    }

    func makeUIViewController(context: Context) -> UINavigationController {
        let hostingController = UIHostingController(rootView: content)
        let navigationController = UINavigationController(rootViewController: hostingController)
        navigationController.warpLiquidGlassStyle() // Apply Warp style to the navigation controller

        if let items = rightBarButtonItems {
            hostingController.navigationItem.rightBarButtonItems = items
        }

        return navigationController
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // No need to update anything here for now
        uiViewController.navigationBar.prefersLargeTitles = true
    }
}
