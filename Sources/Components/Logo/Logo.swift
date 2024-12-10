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
            Warp.Logo(for: .tori)
            Warp.Logo(for: .finn)
            Warp.Logo(for: .blocket)
        }
        .padding()
    }
}
