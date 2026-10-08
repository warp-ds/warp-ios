import SwiftUI

public extension Warp {
    /// A colour-only variation of a brand.
    ///
    /// Layers token overrides on top of whichever brand is active: the brand,
    /// typography and copy are unchanged. Apply with ``SwiftUI/View/warpColorVariant(_:)``.
    ///
    /// ```swift
    /// Warp.Button(title: "Show results") { … }
    ///     .warpColorVariant(.premium)
    /// ```
    ///
    /// Variants are defined by Warp, not by consumers.
    struct ColorVariant: Equatable, Sendable {
        /// Identifies the variant, and is the basis for equality.
        public let name: String

        private let configure: @Sendable (inout any TokenProvider) -> Void

        init(name: String, _ configure: @escaping @Sendable (inout any TokenProvider) -> Void) {
            self.name = name
            self.configure = configure
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.name == rhs.name
        }

        func apply(to token: inout any TokenProvider) {
            configure(&token)
        }
    }
}
