import Foundation
import SwiftUI

/// <#Description#>
public struct WarpButtonStyle: ButtonStyle {
    /// <#Description#>
    private let type: Warp.ButtonType

    /// <#Description#>
    private let size: Warp.ButtonSize
    
    /// <#Description#>
    private let isEnabled: Bool
    
    /// <#Description#>
    private let colorProvider = Config.colorProvider

    public init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        isEnabled: Bool
    ) {
        self.type = type
        self.size = size
        self.isEnabled = isEnabled
    }

    private var backgroundColor: Color {
        if isEnabled {
            return type.backgroundColor
        }

        return type.disabledBackgroundColor
    }

    private var foregroundColor: Color {
        if isEnabled {
            return type.foregroundColor
        }

        return colorProvider.buttonDisabledText
    }

    private var buttonBorderColor: Color {
        if isEnabled {
            return type.borderColor
        }

        return colorProvider.buttonDisabledQuietBorder
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

    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor)
            .padding(.vertical, type.verticalPadding(from: size))
            .padding(.horizontal, type.horizontalPadding(from: size))
            .background(backgroundColor)
            .overlay(overlayView)
            .cornerRadius(type.borderWidth)
            .shadow(
                color: FinnColors.gray700.opacity(0.5),
                radius: shadowRadius,
                y: shadowY
            )
    }

    private var overlayView: some View {
        RoundedRectangle(cornerRadius: type.cornerRadius)
            .stroke(
                buttonBorderColor,
                lineWidth: type.borderWidth
            )
    }
}

extension Warp.ButtonType {
    var fontWeight: Font.Weight {
        switch self {
            case .utility, .utilityTertiary, .utilityOverlay:
                return .regular

            default:
                return .medium
        }
    }

    var fontSize: Font {
        switch self {
            case .utility, .utilityTertiary, .utilityOverlay:
                return .caption

            default:
                return .callout
        }
    }

    var borderWidth: CGFloat {
        switch self {
            case .utility:
                return 2

            default:
                return 4
        }
    }

    var cornerRadius: CGFloat {
        switch self {
            case .utility:
                return 4

            default:
                return 8
        }
    }

    func verticalPadding(from size: Warp.ButtonSize) -> CGFloat {
        switch self {
            case .utility, .utilityTertiary, .utilityOverlay:
                return 8

            default:
                return size == .big ? 13 : 8
        }
    }

    func horizontalPadding(from size: Warp.ButtonSize) -> CGFloat {
        switch self {
            case .utility, .utilityTertiary, .utilityOverlay:
                return 8

            default:
                return size == .big ? 16 : 12
        }
    }
}
