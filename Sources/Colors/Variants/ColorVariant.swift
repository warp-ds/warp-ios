import SwiftUI

public extension Warp {
    /// A colour-only variation of a brand.
    ///
    /// Layers a sparse set of token overrides on top of whichever brand is active: the brand,
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

        let overrides: Overrides

        init(name: String, _ build: (inout Overrides) -> Void) {
            self.name = name
            var overrides = Overrides()
            build(&overrides)
            self.overrides = overrides
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.name == rhs.name
        }

        func tokenProvider(base: TokenProvider) -> TokenProvider {
            VariantTokenProvider(base: base, overrides: overrides)
        }
    }
}
