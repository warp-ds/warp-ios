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
    ///   - style: The style of the radio button (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - action: A closure that is executed when the radio button is tapped.
    public struct Radio: View {
        /// A Boolean value indicating whether the radio button is selected.
        var isSelected: Bool
        /// The text label for the radio button.
        var label: String
        /// The style the radio button can have (default, error, disabled).
        var style: RadioStyle
        /// An optional view that will be displayed beside the label.
        var extraContent: AnyView?
        /// A closure that is executed when the radio button is tapped.
        var action: () -> Void
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `Radio`.
        ///
        /// - Parameters:
        ///   - isSelected: A Boolean value indicating whether the radio button is selected.
        ///   - label: The text label for the radio button.
        ///   - style: The style the radio button can have (default, error, disabled).
        ///   - extraContent: An optional view that will be displayed beside or below the label.
        ///   - action: A closure that is executed when the radio button is tapped.
        public init(isSelected: Bool,
                    label: String,
                    style: RadioStyle = .default,
                    extraContent: AnyView? = nil,
                    action: @escaping () -> Void) {
            self.isSelected = isSelected
            self.label = label
            self.style = style
            self.extraContent = extraContent
            self.action = action
        }
        
        public var body: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Circle()
                    .strokeBorder(borderColor, lineWidth: isSelected ? 6 : 1)
                    .background(Circle().fill(fillColor))
                    .frame(width: 20, height: 20)
                    .animation(.interpolatingSpring)
                
                contentStack
                
                Spacer()
            }
            .onTapGesture {
                if style != .disabled {
                    action()
                }
            }
        }
        
        @ViewBuilder
        private var contentStack: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                SwiftUI.Text(label)
                    .font(from: .body)
                    .foregroundColor(textColor)
                if let extraContent = extraContent {
                    extraContent
                }
            }
        }
        
        private var borderColor: Color {
            switch (style, isSelected) {
            case (.default, true):
                return colorProvider.token.borderSelected
            case (.default, false):
                return colorProvider.token.border
            case (.error, _):
                return colorProvider.token.borderNegative
            case (.disabled, _):
                return colorProvider.token.borderDisabled
            }
        }
        
        private var fillColor: Color {
            if style == .disabled {
                return colorProvider.token.backgroundDisabledSubtle
            } else {
                return colorProvider.token.background
            }
        }
        
        private var textColor: Color {
            switch style {
            case .default, .error:
                return colorProvider.token.text
            case .disabled:
                return colorProvider.token.textDisabled
            }
        }
    }
}
