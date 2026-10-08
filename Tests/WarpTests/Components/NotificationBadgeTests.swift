import Testing
import SwiftUI
import UIKit
@testable import Warp

@Suite
struct NotificationBadgeTests {
    // MARK: - Text Formatting

    @Test
    func testTextForCount1() {
        let text = NotificationBadgeStyle.text(for: .count(1), maxCount: 99)
        #expect(text == "1")
    }

    @Test
    func testTextForCount99() {
        let text = NotificationBadgeStyle.text(for: .count(99), maxCount: 99)
        #expect(text == "99")
    }

    @Test
    func testTextForCount100DefaultMax() {
        let text = NotificationBadgeStyle.text(for: .count(100), maxCount: 99)
        #expect(text == "99+")
    }

    @Test
    func testTextForCustomMaxCount() {
        let text = NotificationBadgeStyle.text(for: .count(10), maxCount: 9)
        #expect(text == "9+")
    }

    @Test
    func testTextForMaxCount0Clamped() {
        let text = NotificationBadgeStyle.text(for: .count(2), maxCount: 0)
        #expect(text == "1+")
    }

    @Test
    func testTextForDot() {
        let text = NotificationBadgeStyle.text(for: .dot, maxCount: 99)
        #expect(text == nil)
    }

    // MARK: - Visibility

    @Test
    func testCount0NotVisible() {
        let visible = NotificationBadgeStyle.isVisible(.count(0))
        #expect(visible == false)
    }

    @Test
    func testNegativeCountNotVisible() {
        let visible = NotificationBadgeStyle.isVisible(.count(-5))
        #expect(visible == false)
    }

    @Test
    func testPositiveCountVisible() {
        let visible = NotificationBadgeStyle.isVisible(.count(1))
        #expect(visible == true)
    }

    @Test
    func testDotVisible() {
        let visible = NotificationBadgeStyle.isVisible(.dot)
        #expect(visible == true)
    }

    // MARK: - Accessibility Values

    @Test
    func testAccessibilityValueForCount() {
        let value = NotificationBadgeStyle.accessibilityValue(for: .count(3), maxCount: 99)
        #expect(value != nil)
        #expect(value?.contains("3") == true)
        #expect(value?.contains("unread") == true)
    }

    @Test
    func testAccessibilityValueForCappedCount() {
        let value = NotificationBadgeStyle.accessibilityValue(for: .count(150), maxCount: 99)
        #expect(value != nil)
        #expect(value?.contains("150") == true)
        #expect(value?.contains("unread") == true)
    }

    @Test
    func testAccessibilityValueForDot() {
        let value = NotificationBadgeStyle.accessibilityValue(for: .dot, maxCount: 99)
        #expect(value != nil)
        #expect(value?.contains("notification") == true)
    }

    @Test
    func testAccessibilityValueForCount0() {
        let value = NotificationBadgeStyle.accessibilityValue(for: .count(0), maxCount: 99)
        #expect(value == nil)
    }

    // MARK: - Color Mapping

    @Test(arguments: [UIUserInterfaceStyle.light, .dark])
    func testBackgroundColorReturnsTokenColors(style: UIUserInterfaceStyle) {
        let token = FinnTokenProvider()

        let defaultColor = Self.rgba(NotificationBadgeStyle.backgroundColor(for: .default, token: token), style)
        let primaryColor = Self.rgba(NotificationBadgeStyle.backgroundColor(for: .primary, token: token), style)

        #expect(defaultColor == Self.rgba(token.backgroundNotification, style))
        #expect(primaryColor == Self.rgba(token.backgroundPrimary, style))
        #expect(defaultColor != primaryColor)
    }

    // Tokens create a new dynamic Color on every access, so compare resolved components.
    private static func rgba(_ color: Color, _ style: UIUserInterfaceStyle) -> [CGFloat] {
        let resolved = UIColor(color).resolvedColor(with: UITraitCollection(userInterfaceStyle: style))
        var (red, green, blue, alpha): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
        #expect(resolved.getRed(&red, green: &green, blue: &blue, alpha: &alpha), "colour must resolve to RGB")
        return [red, green, blue, alpha].map { ($0 * 255).rounded() }
    }

    // MARK: - Sizing

    // Count widths depend on the brand font, and other suites change the global `Warp.Theme`
    // while these run, so width checks are relative (pill vs circle) rather than exact.

    /// Dot diameters from the Figma "Notification badge" set (node 37526:66798).
    @MainActor
    @Test
    func testDotMatchesFigmaSize() {
        #expect(Self.fittingSize(Warp.NotificationBadge(.dot, size: .medium)) == CGSize(width: 16, height: 16))
        #expect(Self.fittingSize(Warp.NotificationBadge(.dot, size: .small)) == CGSize(width: 10, height: 10))
    }

    /// Count heights from the same Figma set: Medium 24pt, Small 16pt, whatever the brand font.
    @MainActor
    @Test
    func testCountBadgeHeightMatchesFigma() {
        for (size, expectedHeight) in [(Warp.NotificationBadgeSize.medium, CGFloat(24)), (.small, 16)] {
            for count in [1, 67, 150] {
                let badgeSize = Self.fittingSize(Warp.NotificationBadge(.count(count), size: size))
                #expect(badgeSize.height == expectedHeight)
                #expect(badgeSize.width >= expectedHeight, "A count badge is never narrower than a circle")
            }
        }
    }

    /// A tight stack must not squeeze a count badge below its text, or "99+" spills out of a circle.
    @MainActor
    @Test
    func testCountBadgeDoesNotShrinkBelowItsContent() {
        for (size, expectedHeight) in [(Warp.NotificationBadgeSize.medium, CGFloat(24)), (.small, 16)] {
            let squeezed = Self.fittingSize(Warp.NotificationBadge(.count(150), size: size), in: CGSize(width: 1, height: 1))

            #expect(squeezed.width > squeezed.height, "\"99+\" must stay a pill, wider than it is tall")
            #expect(squeezed.height == expectedHeight)
        }
    }

    @MainActor
    private static func fittingSize(
        _ badge: Warp.NotificationBadge,
        in proposal: CGSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
    ) -> CGSize {
        UIHostingController(rootView: badge).sizeThatFits(in: proposal)
    }

    // MARK: - Plurals

    @Test(arguments: [
        ("sv", "1 oläst", "2 olästa"),
        ("nb-NO", "1 ulest", "2 uleste"),
        ("da", "1 ulæst", "2 ulæste"),
        ("fi", "1 lukematon", "2 lukematonta"),
        ("en", "1 unread", "2 unread")
    ])
    func testAccessibilityValuePlurals(language: String, one: String, other: String) throws {
        let path = try #require(NotificationBadgeStyle.bundle.path(forResource: language, ofType: "lproj"))
        let bundle = try #require(Bundle(path: path))

        #expect(NotificationBadgeStyle.accessibilityValue(for: .count(1), maxCount: 99, bundle: bundle) == one)
        #expect(NotificationBadgeStyle.accessibilityValue(for: .count(2), maxCount: 99, bundle: bundle) == other)
    }
}
