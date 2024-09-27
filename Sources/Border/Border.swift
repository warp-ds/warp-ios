import CoreFoundation

extension Warp {
    public enum Border: Sendable {
        /// Border radius of 2 points.
        public static let borderRadius25: CGFloat = 2
        /// Border radius of 4 points.
        public static let borderRadius50: CGFloat = 4
        /// Border radius of 8 points.
        public static let borderRadius100: CGFloat = 8
        /// Border radius of 16 points.
        public static let borderRadius200: CGFloat = 16

        /// Border width of 1 points.
        public static let borderWidth12: CGFloat = 1
        /// Border width of 2 points.
        public static let borderWidth25: CGFloat = 2
        /// Border width of 4 points.
        public static let borderWidth50: CGFloat = 4
    }
}
