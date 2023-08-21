import SwiftUI

struct WarpButton: View {
    let title: String
    let icon: String
    let type: WarpButtonType
    let disabled: Bool
    let fullWidth: Bool
    let colorProvider = Config.colorProvider
    
    init(title: String,
         icon: String = "",
         type: WarpButtonType,
         disbled: Bool = false,
         fullWidth: Bool = false) {
        self.title = title
        self.icon = icon
        self.type = type
        self.disabled = disbled
        self.fullWidth = fullWidth
    }
    
    var backgroundColor: Color {
        if disabled {
            return type.disabledBackgroundColor
        } else {
            return type.backgroundColor
        }
    }
    
    var foregroundColor: Color {
        if disabled {
            return colorProvider.secondaryButtonDisabledForegroundColor
        } else {
            return type.foregroundColor
        }
    }
    
    var buttonBorderColor: Color {
        if disabled {
            return colorProvider.secondaryButtonDisabledBorderColor
        } else {
            return type.borderColor
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
    
    var body: some View {
        Button(action: {}) {
            HStack {
                if fullWidth { Spacer() }
                if !icon.isEmpty {
                    Image(systemName: icon)
                }
                Text(title)
                    .lineLimit(type == .critical ? Int.max : 1)
                    .truncationMode(type == .primary ? .tail : .middle)
                if fullWidth { Spacer() }
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

enum WarpButtonType: WarpButtonTypeColor {
    case primary, secondary, tertiary, critical, criticalTertiary, utility, utilityTertiary, utilityOverlay
    
    var foregroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.primaryButtonForegroundColor
        case .secondary:
            Config.colorProvider.secondaryButtonForegroundColor
        case .tertiary:
            Config.colorProvider.tertiaryButtonForegroundColor
        case .critical:
            Config.colorProvider.criticalButtonForegroundColor
        case .criticalTertiary:
            Config.colorProvider.criticalTertiaryButtonForegroundColor
        case .utility:
            Config.colorProvider.utilityButtonForegroundColor
        case .utilityTertiary:
            Config.colorProvider.utilityButtonForegroundColor
        case .utilityOverlay:
            Config.colorProvider.utilityButtonForegroundColor
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.primaryButtonBackgroundColor
        case .secondary:
            Config.colorProvider.secondaryButtonBackgroundColor
        case .tertiary:
            Config.colorProvider.tertiaryButtonBackgroundColor
        case .critical:
            Config.colorProvider.criticalButtonBackgroundColor
        case .criticalTertiary:
            Config.colorProvider.criticalTertiaryButtonBackgroundColor
        case .utility:
            Config.colorProvider.utilityButtonBackgroundColor
        case .utilityTertiary:
            Config.colorProvider.utilityButtonBackgroundColor
        case .utilityOverlay:
            Config.colorProvider.utilityButtonBackgroundColor
        }
    }
    
    var disabledBackgroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.primaryButtonDisabledBackgroundColor
        case .secondary:
            Config.colorProvider.secondaryButtonDisabledBackgroundColor
        case .tertiary:
            Config.colorProvider.tertiaryButtonDisabledBackgroundColor
        case .critical:
            Config.colorProvider.criticalButtonDisabledBackgroundColor
        case .criticalTertiary:
            Config.colorProvider.criticalTertiaryButtonDisabledBackgroundColor
        case .utility:
            Config.colorProvider.utilityButtonDisabledBackgroundColor
        case .utilityTertiary:
            Config.colorProvider.utilityButtonDisabledBackgroundColor
        case .utilityOverlay:
            Config.colorProvider.utilityButtonDisabledBackgroundColor
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.primaryButtonBackgroundColor
        case .secondary:
                Config.colorProvider.secondaryButtonBorderColor
        case .tertiary:
            Config.colorProvider.tertiaryButtonBackgroundColor
        case .critical:
            Config.colorProvider.criticalButtonBackgroundColor
        case .criticalTertiary:
            Config.colorProvider.criticalTertiaryButtonBackgroundColor
        case .utility:
            Config.colorProvider.utilityButtonBorderColor
        case .utilityTertiary:
            .clear
        case .utilityOverlay:
            .clear
        }
    }
}

protocol WarpButtonTypeColor {
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var disabledBackgroundColor: Color { get }
    var borderColor: Color { get }
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
