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
            return .caption
        default:
            return .callout
        }
    }
    
    var fontWeight: Font.Weight {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return .regular
        default:
            return .medium
        }
    }
    
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
                    .fontWeight(fontWeight)
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
        let colorProvider = Config.colorProvider

        switch self {
        case .primary:
            return colorProvider.buttonPrimaryText

        case .secondary:
            return colorProvider.buttonSecondaryText

        case .tertiary:
            return colorProvider.buttonQuietText

        case .critical:
            return colorProvider.buttonNegativeText

        case .criticalTertiary:
            return colorProvider.buttonNegativeQuietText

        case .utility:
            return colorProvider.buttonUtilityText

        case .utilityTertiary:
            return colorProvider.buttonUtilityQuietText

        case .utilityOverlay:
            return colorProvider.buttonUtilityQuietText
        }
    }
    
    var backgroundColor: Color {
        let colorProvider = Config.colorProvider

        switch self {
        case .primary:
            return colorProvider.buttonPrimaryBackground

        case .secondary:
            return colorProvider.buttonSecondaryBackground

        case .tertiary:
            return colorProvider.buttonQuietBackground

        case .critical:
            return colorProvider.buttonNegativeBackground

        case .criticalTertiary:
            return colorProvider.buttonNegativeQuietBackground

        case .utility:
            return colorProvider.buttonUtilityBackground

        case .utilityTertiary:
            return colorProvider.buttonUtilityQuietBackground

        case .utilityOverlay:
            return colorProvider.buttonUtilityOverlayBackground
        }
    }
    
    var disabledBackgroundColor: Color {
        let colorProvider = Config.colorProvider

        switch self {
        case .primary:
            return colorProvider.buttonDisabledBackground

        case .secondary:
            return colorProvider.buttonDisabledBackground

        case .tertiary:
            return colorProvider.buttonDisabledBackground

        case .critical:
            return colorProvider.buttonDisabledBackground

        case .criticalTertiary:
            return colorProvider.buttonDisabledBackground

        case .utility:
            return colorProvider.buttonDisabledBackground

        case .utilityTertiary:
            return colorProvider.buttonDisabledBackground

        case .utilityOverlay:
            return colorProvider.buttonDisabledBackground
        }
    }
    
    var borderColor: Color {
        lazy var colorProvider = Config.colorProvider

        switch self {
        case .primary:
            return colorProvider.buttonPrimaryBorder

        case .secondary:
            return colorProvider.buttonSecondaryBorder

        case .tertiary:
            return colorProvider.buttonQuietBackground

        case .critical:
            return colorProvider.buttonNegativeBorder

        case .criticalTertiary:
            return colorProvider.buttonNegativeQuietBorder

        case .utility:
            return colorProvider.buttonUtilityBorder

        default:
            return .clear
        }
    }
}

protocol WarpButtonTypeColor {
    var foregroundColor: Color { get }
    var backgroundColor: Color { get }
    var disabledBackgroundColor: Color { get }
    var borderColor: Color { get }
}

private struct WarpButtonPreview: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false) {
            Group {
                WarpButton(title: "PrimaryButton", icon: "square.and.arrow.up", type: .primary)
                WarpButton(title: "Disabled", type: .primary, disbled: true)
            }

            Group {
                WarpButton(title: "SecondaryButton", type: .secondary)
                WarpButton(title: "Disabled", type: .secondary, disbled: true)
            }

            Group {
                WarpButton(title: "TertiaryButton", type: .tertiary)
                WarpButton(title: "Disabled", type: .tertiary, disbled: true)
            }

            Group {
                WarpButton(title: "CriticalButton", type: .critical)
                WarpButton(title: "Disabled", type: .critical, disbled: true)
            }

            Group {
                WarpButton(title: "CriticalTertiaryButton", type: .criticalTertiary)
                WarpButton(title: "Disabled", type: .criticalTertiary, disbled: true)
            }

            Group {
                WarpButton(title: "UtilityButton", type: .utility)
                WarpButton(title: "Disabled", type: .utility, disbled: true)
            }

            Group {
                WarpButton(title: "UtilityTertiaryButton", type: .utilityTertiary)
                WarpButton(title: "Disabled", type: .utilityTertiary, disbled: true)
            }

            Group {
                WarpButton(title: "UtilityOverlayButton", type: .utilityOverlay)
                WarpButton(title: "Disabled", type: .utilityOverlay, disbled: true)
            }
        }
    }
}
