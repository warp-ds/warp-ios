import SwiftUI

extension Warp {
    /// A single radio button view used within `RadioGroup`.
    ///
    /// Displays a selectable circular button with a label. When the button is selected,
    /// the circle is filled to indicate the selection.
    ///
    /// - Parameters:
    ///   - isSelected: A Boolean value indicating whether the radio button is selected.
    ///   - label: The text label for the radio button.
    ///   - state: The state of the radio button (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - contentLayout: Defines whether the label and extra content are arranged horizontally or vertically.
    ///   - action: A closure that is executed when the radio button is tapped.
    public struct Radio: View {
        /// A Boolean value indicating whether the radio button is selected.
        var isSelected: Bool
        /// The text label for the radio button.
        var label: String
        /// The state of the radio button (default, error, disabled).
        var state: RadioButtonState
        /// An optional view that will be displayed beside or below the label.
        var extraContent: AnyView?
        /// Defines whether the label and extra content are arranged horizontally or vertically.
        var contentLayout: Axis.Set
        /// A closure that is executed when the radio button is tapped.
        var action: () -> Void
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        public var body: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Circle()
                    .strokeBorder(borderColor, lineWidth: isSelected ? 6 : 1)
                    .background(Circle().fill(fillColor))
                    .frame(width: 20, height: 20)
                
                contentStack
                
                Spacer()
            }
            .onTapGesture {
                if state != .disabled {
                    action()
                }
            }
        }
        
        @ViewBuilder
        private var contentStack: some View {
            switch contentLayout {
            case .vertical:
                VStack(alignment: .leading, spacing: Spacing.spacing100) {
                    SwiftUI.Text(label)
                        .font(Typography.body.font)
                        .foregroundColor(textColor)
                    if let extraContent = extraContent {
                        extraContent
                    }
                }
            case .horizontal, _:
                HStack(spacing: Spacing.spacing100) {
                    SwiftUI.Text(label)
                        .font(Typography.body.font)
                        .foregroundColor(textColor)
                    if let extraContent = extraContent {
                        extraContent
                    }
                }
            }
        }
        
        private var borderColor: Color {
            switch (state, isSelected) {
            case (.default, true):
                return colorProvider.radioBorderSelected
            case (.default, false):
                return colorProvider.radioBorder
            case (.error, _):
                return colorProvider.radioNegativeBorder
            case (.disabled, _):
                return colorProvider.radioBorderDisabled
            }
        }
        
        private var fillColor: Color {
            if state == .disabled {
                return colorProvider.radioBackgroundDisabled
            } else {
                return colorProvider.radioBackground
            }
        }
        
        private var textColor: Color {
            switch state {
            case .default:
                return colorProvider.token.text
            case .error:
                return colorProvider.token.text
            case .disabled:
                return colorProvider.token.textDisabled
            }
        }
    }
}
