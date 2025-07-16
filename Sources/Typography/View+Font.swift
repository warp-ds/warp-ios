import Foundation
import SwiftUI

public extension Text {
    /// Sets the font of the text in this `Text` view using the specified typography.
    ///
    /// This method applies a font from the given `Warp.Typography` to the `Text` view.
    /// It uses the `font` property from `Typography` to apply the appropriate font styling.
    ///
    /// - Parameter typography: The `Typography` instance that defines the font to apply.
    /// - Returns: A `Text` view with the specified font applied.
    func font(from typography: Warp.Typography) -> Text {
        self.font(typography.font)
    }
}

public extension View {
    /// Sets the font of the text elements within this `View` using the specified typography.
    ///
    /// This method applies a font from the given `Warp.Typography` to any `View` type,
    /// making it adaptable for complex views containing text.
    /// It uses the `font` property from `Typography` to apply the appropriate font styling.
    ///
    /// - Parameter typography: The `Typography` instance that defines the font to apply.
    /// - Returns: A modified `View` with the specified font applied.
    func font(from typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
