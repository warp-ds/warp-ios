extension Warp {
    /// Content shown in a notification badge.
    public enum NotificationBadgeContent: Hashable {
        /// A solid dot indicating a new item.
        case dot

        /// A numeric count. Counts <= 0 are not shown (the badge renders as `EmptyView`).
        /// Counts above `maxCount` show as "99+" by default.
        case count(Int)
    }

    /// Visual style for a notification badge.
    public enum NotificationBadgeType: CaseIterable, Hashable {
        /// Red background (uses `Background/Notification` token).
        case `default`

        /// Blue background (uses `Background/Primary` token, follows the premium colour variant).
        case primary
    }

    /// Size variant for a notification badge.
    public enum NotificationBadgeSize: CaseIterable, Hashable {
        /// Medium size: 16×16 dot, 24pt height for counts.
        case medium

        /// Small size: 10×10 dot, 16pt height for counts.
        case small
    }
}
