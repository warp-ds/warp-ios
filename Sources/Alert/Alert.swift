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

    fileprivate func getBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua300

            case .warning:
                return FinnColors.yellow300

            case .critical:
                return FinnColors.red300

            case .success:
                return FinnColors.green300
        }
    }

    fileprivate func getLeftLineColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua500

            case .warning:
                return FinnColors.yellow500

            case .critical:
                return FinnColors.red500

            case .success:
                return FinnColors.green500
        }
    }

    fileprivate var titleImageName: String {
        switch self {
            case .info:
                return "info.circle.fill"

            case .warning, .critical:
                return "exclamationmark.circle.fill"

            case .success:
                return "checkmark.circle.fill"
        }
    }
}
}
