import SwiftUI

public extension Warp.ColorVariant {
    /// A darker, understated treatment for premium surfaces such as Fashion Hub.
    ///
    /// Comparing the premium designs against stock FINN, the only change is the primary
    /// surface — hence three overrides rather than a palette. Links and text stay FINN's.
    static let premium = Warp.ColorVariant(name: "premium") { overrides in
        overrides.backgroundPrimary = Color.dynamicColor(
            defaultColor: FinnColors.gray900,
            darkModeColor: FinnColors.gray50
        )
        overrides.backgroundPrimaryHover = Color.dynamicColor(
            defaultColor: FinnColors.gray800,
            darkModeColor: FinnColors.gray100
        )
        overrides.backgroundPrimaryActive = Color.dynamicColor(
            defaultColor: FinnColors.gray750,
            darkModeColor: FinnColors.gray200
        )
    }
}
