import Foundation
import SwiftUI

@MainActor
public extension Text {
    /// Sets the font of the text in this view using the specified typography.
    ///
    /// This method applies the font from the given `Typography` to Text view.
    ///
    /// - Parameter typography: The `Typography` from which to apply the font.
    /// - Returns: The original view with the specified font applied.
    func font(from typography: Warp.Typography) -> Text {
        self.font(typography.font)
    }
}


public extension View {
    /// Sets the font of the text in this view using the specified typography.
    ///
    /// This method applies the font from the given `Typography` to any view, returning some View.
    ///
    /// - Parameter typography: The `Typography` from which to apply the font.
    /// - Returns: The original view with the specified font applied.
    func font(from typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
