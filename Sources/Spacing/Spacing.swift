import CoreFoundation

extension Warp {
    /// A collection of spacing values used in the Warp design system.
    ///
    /// Each spacing value corresponds to a specific amount of separation between UI elements, measured in points.
    /// These constants help maintain consistent spacing across the application.
    public enum Spacing {
        /// Separation of 2 points. Typically used for very small gaps between elements.
        public static let spacing25: CGFloat = 2
        /// Separation of 4 points. Suitable for small gaps between UI components.
        public static let spacing50: CGFloat = 4
        /// Separation of 8 points. Commonly used for medium gaps between elements.
        public static let spacing100: CGFloat = 8
        /// Separation of 12 points. A slightly larger gap for separating components.
        public static let spacing150: CGFloat = 12
        /// Separation of 16 points. A standard separation used for consistent spacing between larger elements.
        public static let spacing200: CGFloat = 16
        /// Separation of 20 points. A larger gap for more prominent separation.
        public static let spacing250: CGFloat = 20
        /// Separation of 24 points. Frequently used in grids and layout margins.
        public static let spacing300: CGFloat = 24
        /// Separation of 32 points. Suitable for larger sections in layouts.
        public static let spacing400: CGFloat = 32
        /// Separation of 40 points. Used for significant spacing between UI components.
        public static let spacing500: CGFloat = 40
        /// Separation of 48 points. Commonly used for separating major sections.
        public static let spacing600: CGFloat = 48
        /// Separation of 56 points. Ideal for separating content in full-width layouts.
        public static let spacing700: CGFloat = 56
        /// Separation of 64 points. Suitable for wide sections or content blocks.
        public static let spacing800: CGFloat = 64
        /// Separation of 72 points. A large gap, often used in header or footer spacing.
        public static let spacing900: CGFloat = 72
        /// Separation of 80 points. Used for spacious layouts or key sections.
        public static let spacing1000: CGFloat = 80
        /// Separation of 88 points. Appropriate for large breaks between content groups.
        public static let spacing1100: CGFloat = 88
        /// Separation of 96 points. Typically used for extensive separation of major components.
        public static let spacing1200: CGFloat = 96
        /// Separation of 112 points. Used for very large spacing needs in layouts.
        public static let spacing1400: CGFloat = 112
        /// Separation of 128 points. The largest predefined spacing for significant content separation.
        public static let spacing1600: CGFloat = 128
    }
}
