import Foundation
import SwiftUI

public extension SwiftUI.View {
    /// Sets the default font from given typography, for text in this view.
    func font(_ typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
