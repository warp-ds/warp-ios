import SwiftUI

enum TokenProviderFactory {
    static func make(for brand: Warp.Brand) -> TokenProvider {
        switch brand {
        case .finn: return FinnTokenProvider()
        case .tori: return ToriTokenProvider()
        case .dba: return DbaTokenProvider()
        case .blocket: return BlocketTokenProvider()
        case .vend: return VendTokenProvider()
        case .neutral: return NeutralTokenProvider()
        }
    }
}

public extension TokenProvider {
    /// Returns the concrete `TokenProvider` for the given brand.
    ///
    /// Call on any concrete conformer to obtain the provider for a specific brand:
    /// ```swift
    /// let tokens: TokenProvider = FinnTokenProvider.provider(for: .blocket)
    /// ```
    static func provider(for brand: Warp.Brand) -> TokenProvider {
        TokenProviderFactory.make(for: brand)
    }
}
