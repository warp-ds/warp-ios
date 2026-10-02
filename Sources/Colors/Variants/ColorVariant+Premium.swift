import SwiftUI

public extension Warp.ColorVariant {
    /// Swaps the brand's primary surface for greys: near-black in light mode, near-white in dark.
    /// Text, links and colours a brand hardcodes (e.g. Tori's primary button) are unchanged.
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
