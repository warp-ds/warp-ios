import SwiftUI

struct WarpButton: View {
    let title: String
    let icon: String
    let type: WarpButtonType
    let size: WarpButtonSize
    let disabled: Bool
    let fullWidth: Bool
    let colorProvider = Config.colorProvider
    
    init(title: String,
         icon: String = "",
         type: WarpButtonType,
         size: WarpButtonSize = .big,
         disbled: Bool = false,
         fullWidth: Bool = false) {
        self.title = title
        self.icon = icon
        self.type = type
        self.size = size
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
            return colorProvider.buttonDisabledText
        } else {
            return type.foregroundColor
        }
    }
    
    var buttonBorderColor: Color {
        if disabled {
            return colorProvider.buttonDisabledQuietBorder
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
    
    var buttonVerticalPadding: CGFloat {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return 8
        default:
            return size == .big ? 13 : 8
        }
    }
    
    var buttonHorizontalPadding: CGFloat {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return 8
        default:
            return size == .big ? 16 : 12
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
    
    var fontSize: Font {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return WarpTypography.detailStrong.font
        default:
            return WarpTypography.title4.font
        }
    }
    
//    var fontWeight: Font.Weight {
//        switch type {
//        case .utility, .utilityTertiary, .utilityOverlay:
//            return .regular
//        default:
//            return .medium
//        }
//    }
    
    var body: some View {
        Button(action: {}) {
            HStack {
                if fullWidth { Spacer() }
                if !icon.isEmpty {
                    Image(systemName: icon)
                        .font(fontSize)
                        .padding(-2)
                }
                Text(title)
                    .font(fontSize)
//                    .fontWeight(fontWeight)
//                    .minimumScaleFactor(0.1)
                    .lineLimit(/*type == .critical ? Int.max : */1)
                    .truncationMode(/*type == .primary ? .tail : */.middle)
                if fullWidth { Spacer() }
            }
        }
        .disabled(disabled)
        .foregroundColor(foregroundColor)
        .padding(.vertical, buttonVerticalPadding)
        .padding(.horizontal, buttonHorizontalPadding)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius)
                .stroke(buttonBorderColor, lineWidth: buttonBorderWidth))
        .cornerRadius(buttonCornerRadius)
        .shadow(color: FinnColors.gray700.opacity(0.5), radius: shadowRadius, y: shadowY)
    }
}

public enum WarpButtonSize {
    case big, small
}

enum WarpButtonType: WarpButtonTypeColor {
    case primary, secondary, tertiary, critical, criticalTertiary, utility, utilityTertiary, utilityOverlay
    
    var foregroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.buttonPrimaryText
        case .secondary:
            Config.colorProvider.buttonSecondaryText
        case .tertiary:
            Config.colorProvider.buttonQuietText
        case .critical:
            Config.colorProvider.buttonNegativeText
        case .criticalTertiary:
            Config.colorProvider.buttonNegativeQuietText
        case .utility:
            Config.colorProvider.buttonUtilityText
        case .utilityTertiary:
            Config.colorProvider.buttonUtilityQuietText
        case .utilityOverlay:
            Config.colorProvider.buttonUtilityQuietText
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.buttonPrimaryBackground
        case .secondary:
            Config.colorProvider.buttonSecondaryBackground
        case .tertiary:
            Config.colorProvider.buttonQuietBackground
        case .critical:
            Config.colorProvider.buttonNegativeBackground
        case .criticalTertiary:
            Config.colorProvider.buttonNegativeQuietBackground
        case .utility:
            Config.colorProvider.buttonUtilityBackground
        case .utilityTertiary:
            Config.colorProvider.buttonUtilityQuietBackground
        case .utilityOverlay:
            Config.colorProvider.buttonUtilityOverlayBackground
        }
    }
    
    var disabledBackgroundColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.buttonDisabledBackground
        case .secondary:
            Config.colorProvider.buttonDisabledBackground
        case .tertiary:
            Config.colorProvider.buttonDisabledBackground
        case .critical:
            Config.colorProvider.buttonDisabledBackground
        case .criticalTertiary:
            Config.colorProvider.buttonDisabledBackground
        case .utility:
            Config.colorProvider.buttonDisabledBackground
        case .utilityTertiary:
            Config.colorProvider.buttonDisabledBackground
        case .utilityOverlay:
            Config.colorProvider.buttonDisabledBackground
        }
    }
    
    var borderColor: Color {
        switch self {
        case .primary:
            Config.colorProvider.buttonPrimaryBorder
        case .secondary:
            Config.colorProvider.buttonSecondaryBorder
        case .tertiary:
            Config.colorProvider.buttonQuietBackground
        case .critical:
            Config.colorProvider.buttonNegativeBorder
        case .criticalTertiary:
            Config.colorProvider.buttonNegativeQuietBorder
        case .utility:
            Config.colorProvider.buttonUtilityBorder
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
