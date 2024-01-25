import Foundation
import SwiftUI
extension Warp.AlertStyle {
    fileprivate func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua50

            case .warning:
                return FinnColors.yellow50

            case .critical:
                return FinnColors.red50

            case .success:
                return FinnColors.green50
        }
    }
}
