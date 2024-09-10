import Foundation
import SwiftUI

public extension View {
    /// Sets the font of the text in this view using the specified typography.
    ///
    /// This method applies the font from the given `Typography` to any view, preserving the original view type.
    ///
    /// - Parameter typography: The `Typography` from which to apply the font.
    /// - Returns: The original view with the specified font applied.
    @ViewBuilder
    func font(from typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
