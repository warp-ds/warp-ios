import SwiftUI

extension Warp {
    /// A view that renders a brand logo with customizable size.
    ///
    /// `Logo` displays a logo associated with a specific brand (`tori`, `finn`, etc.). The logo is rendered from the asset catalog.
    public struct Logo: View {
        /// The brand of the logo.
        private let brand: Warp.BrandLogo
        /// Initializes a new `LogoView`.
        ///
        /// - Parameters:
        ///   - brand: The brand to display (e.g., `.tori`, `.finn`).
        public init(for brand: Warp.BrandLogo) {
            self.brand = brand
        }

        public var body: some View {
            brand
        }
    }
}

#Preview {
    ScrollView(showsIndicators: false) {
        // Example preview displaying logos from multiple brands with different sizes
        VStack(spacing: 20) {
            Warp.Logo(for: .bilbasen(.default))
            Warp.Logo(for: .bilbasen(.small))
            Warp.Logo(for: .blocket(.default))
            Warp.Logo(for: .blocket(.small))
            Warp.Logo(for: .dba(.default))
            Warp.Logo(for: .dba(.small))
            Warp.Logo(for: .finn(.default))
            Warp.Logo(for: .finn(.small))
            Warp.Logo(for: .oikotie(.default))
            Warp.Logo(for: .oikotie(.small))
            Warp.Logo(for: .schibsted(.default))
            Warp.Logo(for: .schibsted(.small))
            Warp.Logo(for: .tori(.default))
            Warp.Logo(for: .tori(.small))
        }
        .padding()
    }
}
