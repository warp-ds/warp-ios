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

    private var lineLimit: Int {
        /*type == .critical ? Int.max : */
        1
    }

    private var truncationMode: Text.TruncationMode {
        /*type == .primary ? .tail : */
        .middle
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor)
            .padding(.vertical, type.verticalPadding(from: size))
            .padding(.horizontal, type.horizontalPadding(from: size))
            .background(backgroundColor)
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

    private var overlayView: some View {
        RoundedRectangle(cornerRadius: type.cornerRadius)
            .stroke(
                buttonBorderColor,
                lineWidth: type.borderWidth
            )
    }
}

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
