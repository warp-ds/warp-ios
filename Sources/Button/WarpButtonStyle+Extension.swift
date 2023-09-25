import Foundation
import SwiftUI

/// `SwiftUI` Button style that will transform button label style to `Warp` design style.
public struct WarpButtonStyle: ButtonStyle {
    /// <#Description#>
    private let type: Warp.ButtonType

    /// <#Description#>
    private let size: Warp.ButtonSize
    
    /// <#Description#>
    private let isEnabled: Bool
    
    /// <#Description#>
    private let colorProvider: ColorProvider

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) {
        self.type = type
        self.size = size
        self.colorProvider = colorProvider
        self.isEnabled = isEnabled
    }

    private var backgroundColor: Color {
        if isEnabled {
            return type.backgroundColor
        }

        return type.disabledBackgroundColor
    }

    private var pressedBackgroundColor: Color {
        type.pressedBackgroundColor
    }

    private var foregroundColor: Color {
        if isEnabled {
            return type.foregroundColor
        }

        return type.disabledForegroundColor
    }

    private var borderColor: Color {
        if isEnabled {
            return type.borderColor
        }

        return colorProvider.buttonDisabledQuietBorder
    }

    private var pressedBorderColor: Color {
        return type.pressedBorderColor
    }

    private var shadowRadius: CGFloat {
        switch type {
            case .utilityOverlay:
                return isEnabled ? 2: 0

            default:
                return 0
        }
    }

    private var shadowY: CGFloat {
        switch type {
            case .utilityOverlay:
                return isEnabled ? 1: 0

            default:
                return 0
        }
    }

    private var lineLimit: Int {
        /*type == .critical ? Int.max : */
        1
    }

    private var truncationMode: Text.TruncationMode {
        /*type == .primary ? .tail : */
        .middle
    }

    public func makeBody(configuration: Configuration) -> some View {
        let _backgroundColor = {
            if configuration.isPressed {
                return pressedBackgroundColor
            }

            return backgroundColor
        }()

        let overlayView = createOverlayView(isPressed: configuration.isPressed)

        return configuration
            .label
            .foregroundColor(foregroundColor)
            .padding(.vertical, type.verticalPadding(from: size))
            .padding(.horizontal, type.horizontalPadding(from: size))
            .background(_backgroundColor)
            .overlay(overlayView)
            .cornerRadius(type.cornerRadius)
            .shadow(
                color: FinnColors.gray700.opacity(0.5),
                radius: shadowRadius,
                y: shadowY
            )
            .lineLimit(lineLimit)
            .truncationMode(truncationMode)
    }

    private func createOverlayView(isPressed: Bool) -> some View {
        let _borderColor = {
            if isPressed {
                return pressedBorderColor
            }

            return borderColor
        }()

        return RoundedRectangle(cornerRadius: type.cornerRadius)
            .stroke(
                _borderColor,
                lineWidth: type.borderWidth
            )
    }
}

/// Syntactic sugar to ease using warp button style.
public extension ButtonStyle where Self == WarpButtonStyle {
    static func warp(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        colorProvider: ColorProvider,
        isEnabled: Bool
    ) -> Self {
        return WarpButtonStyle(
            type: type,
            size: size,
            colorProvider: colorProvider,
            isEnabled: isEnabled
        )
    }
}

// ColorProviderProxy
struct ColorFactory {
    private let type: Warp.ButtonType

    private let colorProvider: ColorProvider

    init(for type: Warp.ButtonType, consuming colorProvider: ColorProvider) {
        self.type = type
        self.colorProvider = colorProvider
    }

    /// <#Description#>
    func makeNormalForegroundColor() -> Color {
        switch type {
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

    /// <#Description#>
    func makeDisabledForegroundColor() -> Color {
        switch type {
            case .primary:
                return colorProvider.buttonPrimaryTextDisabled

            case .secondary:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                // return colorProvider.buttonSecondaryTextDisabled

            case .tertiary:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                // return colorProvider.buttonDisabledQuietText

            case .critical, .criticalTertiary:
                return colorProvider.buttonDisabledText

            case .utility, .utilityTertiary, .utilityOverlay:
                return colorProvider.buttonDisabledText
                // Wrong color palette, using default.
                //return colorProvider.buttonUtilityTextDisabled
        }
    }

    /// <#Description#>
    func makeNormalBackgroundColor() -> Color {
        switch type {
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

    /// <#Description#>
    func makePressedBackgroundColor() -> Color {
        switch type {
            case .primary:
                return colorProvider.buttonPrimaryBackgroundActive

            case .secondary:
                return colorProvider.buttonSecondaryBackgroundActive

            case .tertiary:
                return colorProvider.buttonQuietBackgroundActive

            case .critical:
                return colorProvider.buttonNegativeBackgroundActive

            case .criticalTertiary:
                return colorProvider.buttonNegativeQuietBackgroundActive

            case .utility:
                return colorProvider.buttonUtilityBackgroundActive

            case .utilityTertiary:
                return colorProvider.buttonUtilityQuietBackgroundActive

            case .utilityOverlay:
                return colorProvider.buttonUtilityOverlayBackground
        }
    }

    /// <#Description#>
    func makeDisabledBackgroundColor() -> Color {
        switch type {
            case .primary:
                return colorProvider.buttonPrimaryBackgroundDisabled

            case .secondary:
                return colorProvider.buttonSecondaryBackgroundDisabled

            case .tertiary, .critical, .criticalTertiary:
                return colorProvider.buttonDisabledBackground

            case .utility, .utilityTertiary, .utilityOverlay:
                return colorProvider.buttonUtilityBackgroundDisabled
        }
    }

    /// <#Description#>
    func makeNormalBorderColor() -> Color {
        switch type {
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

    func makeDisabledBorderColor() -> Color {
        return colorProvider.buttonDisabledQuietBorder
    }

    /// <#Description#>
    func makePressedBorderColor() -> Color {
        switch type {
            case .primary:
                return colorProvider.buttonPrimaryBorderActive

            case .secondary:
                return colorProvider.buttonSecondaryBorderActive

            case .tertiary:
                return .clear

            case .critical:
                return colorProvider.buttonNegativeBorderActive

            case .criticalTertiary:
                return colorProvider.buttonNegativeQuietBorderActive

            case .utility:
                return colorProvider.buttonUtilityBorderActive

            case .utilityTertiary:
                return colorProvider.buttonUtilityQuietBorderActive

            case .utilityOverlay:
                return colorProvider.buttonUtilityOverlayBackground
        }
    }
}
