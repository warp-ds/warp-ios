import Foundation
import SwiftUI

@MainActor
public extension View {
    /// Sets the default font from given typography, for text in this view.
    func font(from typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
