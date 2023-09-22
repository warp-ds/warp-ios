import Foundation
import SwiftUI

struct WarpButton: View {
    /// <#Description#>
    private let title: String

    /// <#Description#>
    private let icon: String?
    
    /// <#Description#>
    private let action: () -> Void

    /// <#Description#>
    private let type: WarpButtonType

    /// <#Description#>
    private let size: WarpButtonSize

    /// <#Description#>
    private let disabled: Bool

    /// <#Description#>
    private let fullWidth: Bool

    /// <#Description#>
    private let colorProvider = Config.colorProvider

    init(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void = {},
        type: WarpButtonType,
        size: WarpButtonSize = .big,
        disbled: Bool = false,
        fullWidth: Bool = false
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.type = type
        self.size = size
        self.disabled = disbled
        self.fullWidth = fullWidth
    }
    
    private var backgroundColor: Color {
        if disabled {
            return type.disabledBackgroundColor
        } else {
            return type.backgroundColor
        }
    }
    
    private var foregroundColor: Color {
        if disabled {
            return colorProvider.buttonDisabledText
        } else {
            return type.foregroundColor
        }
    }
    
    private var buttonBorderColor: Color {
        if disabled {
            return colorProvider.buttonDisabledQuietBorder
        } else {
            return type.borderColor
        }
    }
    
    private var buttonBorderWidth: CGFloat {
        switch type {
        case .utility:
            return 2

        default:
            return 4
        }
    }
    
    private var buttonCornerRadius: CGFloat {
        switch type {
        case .utility:
            return 4

        default:
            return 8
        }
    }
    
    private var buttonVerticalPadding: CGFloat {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return 8

        default:
            return size == .big ? 13 : 8
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return 8

        default:
            return size == .big ? 16 : 12
        }
    }
    
    private var shadowRadius: CGFloat {
        switch type {
        case .utilityOverlay:
            return disabled ? 0 : 2

        default:
            return 0
        }
    }
    
    private var shadowY: CGFloat {
        switch type {
        case .utilityOverlay:
            return disabled ? 0 : 1

        default:
            return 0
        }
    }
    
    private var fontSize: Font {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return .caption

        default:
            return .callout
        }
    }
    
    private var fontWeight: Font.Weight {
        switch type {
        case .utility, .utilityTertiary, .utilityOverlay:
            return .regular

        default:
            return .medium
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

    var body: some View {
        Button(
            action: action,
            label: {
                buttonView
            }
        )
        .disabled(disabled)
//        .buttonStyle(WarpButtonStyle(type: type, size: size, isEnabled: !disabled))
        .foregroundColor(foregroundColor)
        .padding(.vertical, buttonVerticalPadding)
        .padding(.horizontal, horizontalPadding)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: buttonCornerRadius)
                .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
        )
        .cornerRadius(buttonCornerRadius)
        .shadow(
            color: FinnColors.gray700.opacity(0.5),
            radius: shadowRadius, y: shadowY
        )
    }

    private var buttonView: some View {
        HStack {
            createFillerViewIfNeeded()

            createIconIfPossible()

            titleView

            createFillerViewIfNeeded()
        }
    }

    @ViewBuilder
    private func createIconIfPossible() -> some View {
        if let icon = icon {
            Image(systemName: icon)
                .font(fontSize)
                .padding(-2)
        }
    }

    private var titleView: some View {
        Text(title)
            .font(fontSize)
            .fontWeight(fontWeight)
        //  .minimumScaleFactor(0.1)
            .lineLimit(lineLimit)
            .truncationMode(truncationMode)
    }

    @ViewBuilder
    private func createFillerViewIfNeeded() -> some View {
        if fullWidth {
            Spacer()
        }
    }
}

extension Warp {
    struct Button: View {
        /// <#Description#>
        private let title: String

        /// <#Description#>
        private let icon: String?

        /// <#Description#>
        private let action: () -> Void = {}

        /// <#Description#>
        private let type: Warp.ButtonType

        /// <#Description#>
        private let size: Warp.ButtonSize

        /// <#Description#>
        private let isEnabled: Bool

        /// <#Description#>
        private let fullWidth: Bool

        /// <#Description#>
        private let colorProvider = Config.colorProvider

        init(
            title: String,
            icon: String? = nil,
            action: () -> Void = {},
            type: Warp.ButtonType,
            size: Warp.ButtonSize = .big,
            isEnabled: Bool = true,
            fullWidth: Bool = false
        ) {
            self.title = title
            self.icon = icon
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
            self.fullWidth = fullWidth
        }

        var body: some View {
            SwiftUI.Button(
                action: action,
                label: {
                    buttonView
                }
            )
            .disabled(!isEnabled)
            .buttonStyle(
                WarpButtonStyle(
                    type: type,
                    size: size,
                    colorProvider: colorProvider,
                    isEnabled: isEnabled
                )
            )
        }

        private var buttonView: some View {
            HStack {
                createFillerViewIfNeeded()

                createIconIfPossible()

                titleView

                createFillerViewIfNeeded()
            }
        }

        @ViewBuilder
        private func createIconIfPossible() -> some View {
            if let icon = icon {
                Image(systemName: icon)
//                    .font(type.fontSize)
                    .padding(-2)
            }
        }

        private var titleView: some View {
            Text(title)
//                .font(fontSize)
//                .fontWeight(fontWeight)
//                .minimumScaleFactor(0.1)
//                .lineLimit(lineLimit)
//                .truncationMode(truncationMode)
        }

        @ViewBuilder
        private func createFillerViewIfNeeded() -> some View {
            if fullWidth {
                Spacer()
            }
        }
    }
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
