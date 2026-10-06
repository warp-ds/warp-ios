import SwiftUI

/// Internal, UI-agnostic logic for notification badge rendering, kept separate from the
/// SwiftUI view so later UIKit integrations (segmented control, tab bar) can reuse it.
enum NotificationBadgeStyle {
    /// The bundle holding the localized strings. Tests use it to look up a specific localization.
    static let bundle: Bundle = .module

    /// Metrics for a given size variant.
    struct Metrics {
        let dotDiameter: CGFloat
        let height: CGFloat
        let horizontalPadding: CGFloat
        let textStyle: Warp.TextStyle
        let relativeTo: Font.TextStyle
    }

    /// Returns metrics for the given size.
    static func metrics(for size: Warp.NotificationBadgeSize) -> Metrics {
        switch size {
        case .medium:
            return Metrics(
                dotDiameter: 16,
                height: 24,
                horizontalPadding: 7,
                textStyle: .title4,
                relativeTo: .callout
            )
        case .small:
            return Metrics(
                dotDiameter: 10,
                height: 16,
                horizontalPadding: 4,
                textStyle: .detailStrong,
                relativeTo: .caption
            )
        }
    }

    /// Returns the text to display, or nil for a dot or hidden badge.
    static func text(for content: Warp.NotificationBadgeContent, maxCount: Int) -> String? {
        switch content {
        case .dot:
            return nil
        case .count(let count):
            guard count > 0 else { return nil }
            let clampedMax = max(1, maxCount)
            return count > clampedMax ? "\(clampedMax)+" : "\(count)"
        }
    }

    /// Returns whether the badge is visible.
    static func isVisible(_ content: Warp.NotificationBadgeContent) -> Bool {
        switch content {
        case .dot:
            return true
        case .count(let count):
            return count > 0
        }
    }

    /// Returns the background color for the given type.
    static func backgroundColor(for type: Warp.NotificationBadgeType, token: TokenProvider) -> Color {
        switch type {
        case .default:
            return token.backgroundNotification
        case .primary:
            return token.backgroundPrimary
        }
    }

    /// Returns a localized accessibility value for the badge content.
    static func accessibilityValue(
        for content: Warp.NotificationBadgeContent,
        maxCount: Int,
        bundle: Bundle = NotificationBadgeStyle.bundle
    ) -> String? {
        switch content {
        case .dot:
            return NSLocalizedString("warp.notificationBadge.new", bundle: bundle, comment: "")
        case .count(let count):
            guard count > 0 else { return nil }
            let format = NSLocalizedString("warp.notificationBadge.unreadCount", bundle: bundle, comment: "")
            return String.localizedStringWithFormat(format, count)
        }
    }
}
