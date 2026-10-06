import SwiftUI

extension Warp {
    /// A dot or a count signalling new or unread items.
    ///
    /// Counts above `maxCount` show as "99+" by default. Keep the default cap:
    /// larger numbers make the badge wide and rarely help the user.
    ///
    /// The badge is hidden from VoiceOver. Add `accessibilityValue` to the element
    /// it belongs to, e.g. `.accessibilityValue(badge.accessibilityValue ?? "")`.
    public struct NotificationBadge: View, Hashable {
        public static func == (lhs: Warp.NotificationBadge, rhs: Warp.NotificationBadge) -> Bool {
            lhs.content == rhs.content &&
            lhs.type == rhs.type &&
            lhs.size == rhs.size &&
            lhs.maxCount == rhs.maxCount
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(content)
            hasher.combine(type)
            hasher.combine(size)
            hasher.combine(maxCount)
        }

        private let content: NotificationBadgeContent
        private let type: NotificationBadgeType
        private let size: NotificationBadgeSize
        private let maxCount: Int

        @Environment(\.warpTheme) private var theme

        private var token: TokenProvider {
            theme.colors.token
        }

        /// Creates a notification badge.
        ///
        /// - Parameters:
        ///   - content: The content to display: `.dot` for a solid indicator, or `.count(Int)` for a number.
        ///              Counts <= 0 are not shown (the badge renders as `EmptyView`).
        ///   - type: The visual style. Defaults to `.default` (red). Use `.primary` for blue.
        ///   - size: The size variant. Defaults to `.medium` (16×16 dot, 24pt height for counts).
        ///   - maxCount: The maximum count before showing "+". Keep the default (99) so badges don't get wide.
        ///              Values below 1 are clamped to 1.
        public init(
            _ content: NotificationBadgeContent,
            type: NotificationBadgeType = .default,
            size: NotificationBadgeSize = .medium,
            maxCount: Int = 99
        ) {
            self.content = content
            self.type = type
            self.size = size
            self.maxCount = maxCount
        }

        /// Localized text for the host element, e.g. "3 unread" or "new notification"; nil when not shown.
        ///
        /// The badge itself is hidden from VoiceOver. Add this value to the element it belongs to:
        /// ```swift
        /// myView.accessibilityValue(badge.accessibilityValue ?? "")
        /// ```
        ///
        /// For counts, returns the real count even when capped (e.g. "150 unread" when "99+" is displayed).
        public var accessibilityValue: String? {
            NotificationBadgeStyle.accessibilityValue(for: content, maxCount: maxCount)
        }

        public var body: some View {
            if NotificationBadgeStyle.isVisible(content) {
                badgeView
                    .accessibilityHidden(true)
                    .dynamicTypeSize(...DynamicTypeSize.accessibility1)
            } else {
                EmptyView()
            }
        }

        @ViewBuilder
        private var badgeView: some View {
            if let text = NotificationBadgeStyle.text(for: content, maxCount: maxCount) {
                countBadge(text: text)
            } else {
                dotBadge
            }
        }

        private func countBadge(text: String) -> some View {
            let metrics = NotificationBadgeStyle.metrics(for: size)
            return CountBadgeView(
                text: text,
                metrics: metrics,
                backgroundColor: NotificationBadgeStyle.backgroundColor(for: type, token: token),
                textColor: token.textInverted
            )
        }

        private var dotBadge: some View {
            let metrics = NotificationBadgeStyle.metrics(for: size)
            return DotBadgeView(
                diameter: metrics.dotDiameter,
                backgroundColor: NotificationBadgeStyle.backgroundColor(for: type, token: token),
                relativeTo: metrics.relativeTo
            )
        }
    }
}

// MARK: - Count Badge

private struct CountBadgeView: View {
    let text: String
    let metrics: NotificationBadgeStyle.Metrics
    let backgroundColor: Color
    let textColor: Color

    @ScaledMetric private var height: CGFloat
    @ScaledMetric private var horizontalPadding: CGFloat

    init(text: String, metrics: NotificationBadgeStyle.Metrics, backgroundColor: Color, textColor: Color) {
        self.text = text
        self.metrics = metrics
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self._height = ScaledMetric(wrappedValue: metrics.height, relativeTo: metrics.relativeTo)
        self._horizontalPadding = ScaledMetric(wrappedValue: metrics.horizontalPadding, relativeTo: metrics.relativeTo)
    }

    var body: some View {
        Warp.Text(text, style: metrics.textStyle, color: textColor)
            .monospacedDigit()
            .lineLimit(1)
            .fixedSize()
            .padding(.horizontal, horizontalPadding)
            .frame(minWidth: height, minHeight: height)
            .background(
                Capsule()
                    .fill(backgroundColor)
            )
    }
}

// MARK: - Dot Badge

private struct DotBadgeView: View {
    let diameter: CGFloat
    let backgroundColor: Color
    let relativeTo: Font.TextStyle

    @ScaledMetric private var scaledDiameter: CGFloat

    init(diameter: CGFloat, backgroundColor: Color, relativeTo: Font.TextStyle) {
        self.diameter = diameter
        self.backgroundColor = backgroundColor
        self.relativeTo = relativeTo
        self._scaledDiameter = ScaledMetric(wrappedValue: diameter, relativeTo: relativeTo)
    }

    var body: some View {
        Circle()
            .fill(backgroundColor)
            .frame(width: scaledDiameter, height: scaledDiameter)
    }
}
