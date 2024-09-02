import SwiftUI

extension Warp {
    /// A single checkbox view used within `CheckboxGroup`.
    ///
    /// Displays a selectable square with a label. The checkbox can be in one of three states:
    /// not selected, selected, or partially selected, and it can have different styles.
    ///
    /// - Parameters:
    ///   - isSelected: A Boolean value indicating whether the checkbox is selected.
    ///   - label: The text label for the checkbox.
    ///   - state: The state of the checkbox (notSelected, selected, partiallySelected).
    ///   - style: The style of the checkbox (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - indentationLevel: The level of indentation for the checkbox. Each level adds 24 points of indentation.
    ///   - action: A closure that is executed when the checkbox is tapped.
    public struct Checkbox: View {
        /// A Boolean value indicating whether the checkbox is selected.
        var isSelected: Bool
        /// The text label for the checkbox.
        var label: String
        /// The state of the checkbox (notSelected, selected, partiallySelected).
        var state: CheckboxState
        /// The style of the checkbox (default, error, disabled).
        var style: CheckboxStyle
        /// An optional view that will be displayed beside or below the label.
        var extraContent: AnyView?
        /// The level of indentation for the checkbox. Each level adds 24 points of indentation.
        var indentationLevel: Int = 0
        /// A closure that is executed when the checkbox is tapped.
        var action: () -> Void
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `Checkbox`.
        ///
        /// - Parameters:
        ///   - isSelected: A Boolean value indicating whether the checkbox is selected.
        ///   - label: The text label for the checkbox.
        ///   - state: The state of the checkbox (notSelected, selected, partiallySelected).
        ///   - style: The style of the checkbox (default, error, disabled).
        ///   - extraContent: An optional view that will be displayed beside or below the label.
        ///   - action: A closure that is executed when the checkbox is tapped.
        public init(isSelected: Bool,
                    label: String,
                    state: CheckboxState = .notSelected,
                    style: CheckboxStyle = .default,
                    extraContent: AnyView? = nil,
                    indentationLevel: Int = 0,
                    action: @escaping () -> Void) {
            self.isSelected = isSelected
            self.label = label
            self.state = state
            self.style = style
            self.extraContent = extraContent
            self.indentationLevel = indentationLevel
            self.action = action
        }
        
        public var body: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Spacer()
                    .frame(width: CGFloat(indentationLevel) * Spacing.spacing300)
                Rectangle()
                    .strokeBorder(borderColor, lineWidth: isSelected ? 6 : 1)
                    .background(Rectangle().fill(fillColor))
                    .frame(width: 20, height: 20)
                
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
                    .font(Typography.body.font)
                    .foregroundColor(textColor)
                if let extraContent = extraContent {
                    extraContent
                }
            }
        }
        
        private var borderColor: Color {
            switch style {
            case .default:
                return state == .selected || state == .partiallySelected ? colorProvider.checkboxBorderSelected : colorProvider.checkboxBorder
            case .error:
                return colorProvider.checkboxNegativeBorder
            case .disabled:
                return colorProvider.checkboxBorderDisabled
            }
        }
        
        private var fillColor: Color {
            switch state {
            case .selected:
                return colorProvider.checkboxBackgroundSelected
            case .notSelected:
                return colorProvider.checkboxBackground
            case .partiallySelected:
                return colorProvider.checkboxBackgroundSelected
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
