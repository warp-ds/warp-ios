import SwiftUI

extension Warp {
    /// Defines the preferred style of an alert, which dictates its appearance and tone.
    ///
    /// The `AlertType` is used to create a themed visual representation for the alert component, such as setting colors and icon according to the alert's purpose.
    public enum AlertType: String, Equatable, CaseIterable {
        /// Used to alert users of some general information that might be useful for them.
        case information
        
        /// Used to alert users that something is not working as expected.
        case warning
        
        /// Used to alert users that a critical problem or error has occurred.
        case negative
        
        /// Used to alert users of a successful action or a completed a task.
        case success
        
        func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .information: return colorProvider.token.backgroundInfoSubtle
            case .warning: return colorProvider.token.backgroundWarningSubtle
            case .negative: return colorProvider.token.backgroundNegativeSubtle
            case .success: return colorProvider.token.backgroundPositiveSubtle
            }
        }
        
        func getBorderColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .information: return colorProvider.token.borderInfoSubtle
            case .warning: return colorProvider.token.borderWarningSubtle
            case .negative: return colorProvider.token.borderNegativeSubtle
            case .success: return colorProvider.token.borderPositiveSubtle
            }
        }
        
        func getLeftLineColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .information: return colorProvider.token.borderInfo
            case .warning: return colorProvider.token.borderWarning
            case .negative: return colorProvider.token.borderNegative
            case .success: return colorProvider.token.borderPositive
            }
        }
        
        func getIconColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .information: return colorProvider.token.iconInfo
            case .warning: return colorProvider.token.iconWarning
            case .negative: return colorProvider.token.iconNegative
            case .success: return colorProvider.token.iconPositive
            }
        }
        
        var tooltipImageName: String {
            switch self {
            case .information: return "icon_alert-info"
            case .warning: return "icon_alert-warning"
            case .negative: return "icon_alert-critical"
            case .success: return "icon_alert-success"
            }
        }
        
        var tooltipImageTitle: String {
            switch self {
            case .information: return "Info"
            case .warning: return "Warning"
            case .negative: return "Error"
            case .success: return "Success"
            }
        }
    }
}
