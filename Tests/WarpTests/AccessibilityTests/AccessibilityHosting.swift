import SwiftUI
import UIKit

/// Hosts a SwiftUI view in a real window and waits for the accessibility tree to stabilize.
///
/// A window rather than a detached `UIHostingController` is needed because SwiftUI does not build
/// the accessibility tree for a view that was never placed in one, and `layoutIfNeeded` alone
/// leaves `accessibilityElements` empty.
@MainActor
final class AccessibilityHost<Content: View> {
    private let host: UIHostingController<Content>
    private let window: UIWindow

    init(_ view: Content) {
        host = UIHostingController(rootView: view)
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        window.rootViewController = host
        window.makeKeyAndVisible()
    }

    /// Lays out the hosted view, waits for the accessibility tree to stabilize, and returns it.
    ///
    /// SwiftUI populates accessibility lazily, after the first render rather than at layout, so
    /// a brief runloop spin is the difference between a populated tree and an empty one. This
    /// polls until the tree is both non-empty and stable (unchanged between two consecutive polls)
    /// or the timeout passes, rather than sleeping for a fixed duration.
    func elements(timeout: TimeInterval = 2) -> [NSObject] {
        host.view.setNeedsLayout()
        host.view.layoutIfNeeded()

        let deadline = Date().addingTimeInterval(timeout)
        var previous: [NSObject] = []
        var current: [NSObject] = []

        repeat {
            RunLoop.current.run(until: Date().addingTimeInterval(0.02))
            previous = current
            current = collectAccessibilityElements(from: host.view)

            if !current.isEmpty && current.count == previous.count {
                return current
            }
        } while Date() < deadline

        return current
    }

    func tearDown() {
        window.isHidden = true
        window.rootViewController = nil
    }
}

/// File-private global holding the most recent host, so only one hosted window stays live at a time.
@MainActor
private var mostRecentHost: Any?

/// Renders `view` in a real window and returns every accessibility element SwiftUI produced.
///
/// The returned elements stay valid until the next `hostedElements` call.
@MainActor
func hostedElements(_ view: some View) -> [NSObject] {
    if let previous = mostRecentHost as? AccessibilityHost<AnyView> {
        previous.tearDown()
    }

    let host = AccessibilityHost(AnyView(view))
    mostRecentHost = host
    return host.elements()
}

/// Walks both trees SwiftUI uses: the view hierarchy, and the `accessibilityElements` arrays
/// hanging off it.
///
/// Descending into `accessibilityElements` recursively matters for anything declaring
/// `.accessibilityElement(children: .contain)`, such as `ButtonGroup` and the option groups.
/// A container is a `UIAccessibilityElement` rather than a `UIView`, and its options are nested
/// inside *its* `accessibilityElements`, so a walk that only followed `subviews` would collect
/// the container and silently miss every option inside it.
@MainActor
func collectAccessibilityElements(from root: UIView) -> [NSObject] {
    var found: [NSObject] = []
    var visited = Set<ObjectIdentifier>()

    func visit(_ object: NSObject) {
        // Containers can appear under both a parent's element list and the view hierarchy, so
        // without this the same option is collected twice.
        guard visited.insert(ObjectIdentifier(object)).inserted else { return }

        if object.isAccessibilityElement {
            found.append(object)
        }
        for child in object.accessibilityElements ?? [] {
            if let child = child as? NSObject {
                visit(child)
            }
        }
        if let view = object as? UIView {
            for subview in view.subviews {
                visit(subview)
            }
        }
    }

    visit(root)
    return found
}
