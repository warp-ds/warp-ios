import SwiftUI

extension Warp {
    /// Defines the preferred style of an alert, which dictates its appearance and tone.
    ///
    /// The `AlertStyle` is used to create a themed visual representation for the alert component, such as setting
    /// colors, icon according to the alert's purpose.
    public enum AlertStyle: String, Equatable, CaseIterable {
        /// Used to display messages that provide the user with general information.
        case info
        
        /// Used to indicate that something is not working as expected or might need attention.
        case warning
        
        /// Used to indicate a severe problem or error that requires immediate attention.
        case critical
        
        /// Used to indicate that an action was successful or that a task was completed successfully.
        case success
        
        func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .info: return colorProvider.token.backgroundInfoSubtle
            case .warning: return colorProvider.token.backgroundWarningSubtle
            case .critical: return colorProvider.token.backgroundNegativeSubtle
            case .success: return colorProvider.token.backgroundPositiveSubtle
            }
        }
        
        func getBorderColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .info: return colorProvider.token.borderInfoSubtle
            case .warning: return colorProvider.token.borderWarningSubtle
            case .critical: return colorProvider.token.borderNegativeSubtle
            case .success: return colorProvider.token.borderPositiveSubtle
            }
        }
        
        func getLeftLineColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .info: return colorProvider.token.borderInfo
            case .warning: return colorProvider.token.borderWarning
            case .critical: return colorProvider.token.borderNegative
            case .success: return colorProvider.token.borderPositive
            }
        }
        
        func getIconColor(from colorProvider: ColorProvider) -> Color {
            switch self {
            case .info: return colorProvider.token.iconInfo
            case .warning: return colorProvider.token.iconWarning
            case .critical: return colorProvider.token.iconNegative
            case .success: return colorProvider.token.iconPositive
            }
        }
        
        var tooltipImageName: String {
            switch self {
            case .info: return "exclamationmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            case .critical: return "exclamationmark.octagon.fill"
            case .success: return "exclamationmark.circle.fill"
            }
        }
        
        var tooltipImageTitle: String {
            switch self {
            case .info: return "Info"
            case .warning: return "Warning"
            case .critical: return "Error"
            case .success: return "Success"
            }
        }
    }
}
