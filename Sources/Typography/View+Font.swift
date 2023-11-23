import Foundation
import SwiftUI

public extension SwiftUI.View {
    func font(_ typography: Warp.Typography) -> some View {
        self.font(typography.font)
    }
}
