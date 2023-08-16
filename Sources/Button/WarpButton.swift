import SwiftUI

public struct WarpButton: View {
    let title: String
    let icon: String
    let type: WarpButtonType
    let disabled: Bool
    let colorProvider = Config.colorProvider
    
    public init(title: String,
                icon: String = "",
                type: WarpButtonType,
                disbled: Bool = false) {
        self.title = title
        self.icon = icon
        self.type = type
        self.disabled = disbled
    }
    
    var backgroundColor: Color {
        if disabled {
            return colorProvider.primaryButtonDisabledBackgroundColor
        } else {
            switch type {
            case .primary:
                return colorProvider.primaryButtonBackgroundColor
            case .secondary:
                return colorProvider.secondaryButtonBackgroundColor
            case .tertiary:
                return colorProvider.secondaryButtonBackgroundColor
            case .critical:
                return colorProvider.criticalButtonBackgroundColor
            case .criticalTertiary:
                return colorProvider.criticalTertiaryButtonBackgroundColor
            case .utility:
                return colorProvider.utilityButtonBackgroundColor
            case .utilityTertiary:
                return colorProvider.utilityButtonBackgroundColor
            case .utilityOverlay:
                return colorProvider.utilityButtonBackgroundColor
            }
        }
    }
    
    var foregroundColor: Color {
        if disabled {
            return colorProvider.secondaryButtonDisabledForegroundColor
        } else {
            switch type {
            case .primary:
                return         colorProvider.primaryButtonForegroundColor
            case .secondary:
                return colorProvider.secondaryButtonForegroundColor
            case .tertiary:
                return colorProvider.tertiaryButtonForegroundColor
            case .critical:
                return colorProvider.criticalButtonForegroundColor
            case .criticalTertiary:
                return colorProvider.criticalTertiaryButtonForegroundColor
            case .utility:
                return colorProvider.utilityButtonForegroundColor
            case .utilityTertiary:
                return colorProvider.utilityButtonForegroundColor
            case .utilityOverlay:
                return colorProvider.utilityButtonForegroundColor
            }
        }
    }
    
    var buttonBorderColor: Color {
        if disabled {
            return         colorProvider.secondaryButtonDisabledBorderColor
        } else {
            switch type {
            case .primary:
                return .clear
            case .secondary:
                return         colorProvider.secondaryButtonBorderColor
            case .tertiary:
                return         colorProvider.secondaryButtonBackgroundColor
            case .critical:
                return .clear
            case .criticalTertiary:
                return .clear
            case .utility:
                return colorProvider.utilityButtonBorderColor
            case .utilityTertiary:
                return .clear
            case .utilityOverlay:
                return .clear
            }
        }
    }
    
    var buttonBorderWidth: CGFloat {
        switch type {
        case .utility:
            return 2
        default:
            return 4
        }
    }
    
    var buttonCornerRadius: CGFloat {
        switch type {
        case .utility:
            return 4
        default:
            return 8
        }
    }
    
    var buttonPadding: CGFloat {
        switch type {
        case .utility:
            return 8
        default:
            return 16
        }
    }
    
    var shadowRadius: CGFloat {
        switch type {
        case .utilityOverlay:
            return disabled ? 0 : 2
        default:
            return 0
        }
    }
    
    var shadowY: CGFloat {
        switch type {
        case .utilityOverlay:
            return disabled ? 0 : 1
        default:
            return 0
        }
    }
    
    public var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: icon)
                Text(title)
            }
        }
        .disabled(disabled)
        .foregroundColor(foregroundColor)
        .padding(buttonPadding)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius)
                .stroke(buttonBorderColor, lineWidth: buttonBorderWidth))
        .cornerRadius(buttonCornerRadius)
        .shadow(color: FinnColors.gray700.opacity(0.5), radius: shadowRadius, y: shadowY)
    }
}

public enum WarpButtonType {
    case primary, secondary, tertiary, critical, criticalTertiary, utility, utilityTertiary, utilityOverlay
}

#Preview {
    ScrollView(showsIndicators: false) {
        WarpButton(title: "PrimaryButton", icon: "square.and.arrow.up", type: .primary)
        WarpButton(title: "Disabled", type: .primary, disbled: true)
        WarpButton(title: "SecondaryButton", type: .secondary)
        WarpButton(title: "Disabled", type: .secondary, disbled: true)
        WarpButton(title: "TertiaryButton", type: .tertiary)
        WarpButton(title: "Disabled", type: .tertiary, disbled: true)
        WarpButton(title: "CriticalButton", type: .critical)
        WarpButton(title: "Disabled", type: .critical, disbled: true)
        WarpButton(title: "CriticalTertiaryButton", type: .criticalTertiary)
        WarpButton(title: "Disabled", type: .criticalTertiary, disbled: true)
        WarpButton(title: "UtilityButton", type: .utility)
        WarpButton(title: "Disabled", type: .utility, disbled: true)
        WarpButton(title: "UtilityTertiaryButton", type: .utilityTertiary)
        WarpButton(title: "Disabled", type: .utilityTertiary, disbled: true)
        WarpButton(title: "UtilityOverlayButton", type: .utilityOverlay)
        WarpButton(title: "Disabled", type: .utilityOverlay, disbled: true)
    }
}
