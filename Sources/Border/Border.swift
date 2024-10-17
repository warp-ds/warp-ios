import CoreFoundation

extension Warp {
    /// A collection of constants for border radius and width values used in the Warp design system.
    public enum Border {
        // MARK: - Border Radius

        /// Border radius of 2 points. Typically used for very small rounded corners.
        public static let borderRadius25: CGFloat = 2
        /// Border radius of 4 points. A slightly larger rounded corner for small elements.
        public static let borderRadius50: CGFloat = 4
        /// Border radius of 8 points. Suitable for medium-sized elements with rounded corners.
        public static let borderRadius100: CGFloat = 8
        /// Border radius of 16 points. Ideal for larger elements or prominent rounded corners.
        public static let borderRadius200: CGFloat = 16

        // MARK: - Border Width

        /// Border width of 1 point. Commonly used for thin borders.
        public static let borderWidth12: CGFloat = 1
        /// Border width of 2 points. Suitable for slightly thicker borders.
        public static let borderWidth25: CGFloat = 2
        /// Border width of 4 points. Used for thick or highly visible borders.
        public static let borderWidth50: CGFloat = 4
    }
}
