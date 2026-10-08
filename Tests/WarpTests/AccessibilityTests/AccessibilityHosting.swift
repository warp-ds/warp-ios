import Testing
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
    /// a brief wait is the difference between a populated tree and an empty one. This polls until
    /// the tree is both non-empty and stable (unchanged between two consecutive polls) or the
    /// timeout passes, rather than sleeping for a fixed duration.
    ///
    /// It suspends between polls instead of spinning the runloop by hand. A synchronous spin holds
    /// the main actor for the whole wait, starving other tests that poll on it, such as the Toast
    /// and Snackbar ones, whenever the tree is slow to fill in.
    func elements(timeout: TimeInterval = 2) async -> [NSObject] {
        host.view.setNeedsLayout()
        host.view.layoutIfNeeded()

        let deadline = Date().addingTimeInterval(timeout)
        var previous: [NSObject] = []
        var current: [NSObject] = []

        repeat {
            try? await Task.sleep(for: .milliseconds(20))
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

/// Parent of every suite that hosts views, so they run one test at a time.
///
/// `hostedElements` keeps a single live host and suspends while it waits, so two hosting tests
/// interleaving would tear down each other's window.
@Suite(.serialized) @MainActor
enum AccessibilityHostingTests {}

/// File-private global holding the most recent host, so only one hosted window stays live at a time.
@MainActor
private var mostRecentHost: AccessibilityHost<AnyView>?

/// Renders `view` in a real window and returns every accessibility element SwiftUI produced.
///
/// The returned elements stay valid until the next `hostedElements` call. Callers must run inside
/// `AccessibilityHostingTests`, whose serialization stops another test tearing this host down
/// while the current one is suspended waiting for its tree.
@MainActor
func hostedElements(_ view: some View) async -> [NSObject] {
    mostRecentHost?.tearDown()

    let host = AccessibilityHost(AnyView(view))
    mostRecentHost = host
    return await host.elements()
}

/// A mutable Bool a test can hand to a view as a `Binding` and read back afterwards.
@MainActor
final class Flag {
    var value: Bool
    init(_ value: Bool) { self.value = value }
    var binding: Binding<Bool> {
        Binding(get: { self.value }, set: { self.value = $0 })
    }
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
