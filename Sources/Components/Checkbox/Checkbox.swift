import SwiftUI

extension Warp {
    /// A single checkbox view used within `CheckboxGroup`.
    ///
    /// Displays a selectable icon with a label. The checkbox can be in one of three states:
    /// not selected, selected, or partially selected, and it can have different styles.
    ///
    /// - Parameters:
    ///   - label: The text label for the checkbox.
    ///   - initialState: The initial state of the checkbox (notSelected, selected, partiallySelected).
    ///   - style: The style of the checkbox (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - indentationLevel: The level of indentation for the checkbox. Each level adds 24 points of indentation.
    ///   - stateTransition: A closure that determines how the checkbox state should transition. Defaults to toggling between selected and notSelected.
    ///   - onStateChange: A closure that returns the `newState` whenever the checkbox state changes.
    public struct Checkbox: View {
        /// The text label for the checkbox.
        var label: String
        /// The state of the checkbox (notSelected, selected, partiallySelected).
        @State private var state: CheckboxState
        /// The style of the checkbox (default, error, disabled).
        var style: CheckboxStyle
        /// An optional view that will be displayed beside or below the label.
        var extraContent: AnyView?
        /// The level of indentation for the checkbox. Each level adds 24 points of indentation.
        var indentationLevel: Int = 0
        /// A closure that determines how the checkbox state should transition. Defaults to toggling between selected and notSelected.
        var stateTransition: ((CheckboxState) -> CheckboxState)?
        /// A closure that returns the `newState` whenever the checkbox state changes.
        var onStateChange: ((CheckboxState) -> Void)?
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `Checkbox`.
        ///
        /// - Parameters:
        ///   - label: The text label for the checkbox.
        ///   - initialState: The initial state of the checkbox (notSelected, selected, partiallySelected).
        ///   - style: The style of the checkbox (default, error, disabled).
        ///   - extraContent: An optional view that will be displayed beside or below the label.
        ///   - indentationLevel: The level of indentation for the checkbox. Each level adds 24 points of indentation.
        ///   - stateTransition: A closure that determines how the checkbox state should transition. Defaults to toggling between selected and notSelected.
        ///   - onStateChange: A closure that returns the `newState` whenever the checkbox state changes.
        public init(label: String,
                    initialState: CheckboxState = .notSelected,
                    style: CheckboxStyle = .default,
                    extraContent: AnyView? = nil,
                    indentationLevel: Int = 0,
                    stateTransition: ((CheckboxState) -> CheckboxState)? = nil,
                    onStateChange: ((CheckboxState) -> Void)? = nil) {
            self.label = label
            self._state = State(initialValue: initialState)
            self.style = style
            self.extraContent = extraContent
            self.indentationLevel = indentationLevel
            self.stateTransition = stateTransition
            self.onStateChange = onStateChange
        }
        
        public var body: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Spacer()
                    .frame(width: CGFloat(indentationLevel) * Spacing.spacing300)
                
                Image(iconName, bundle: .module)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(tintColor)
                    .frame(width: 20, height: 20)
                    .background(backgroundColor.cornerRadius(4))
                    .animation(.interpolatingSpring())
                
                contentStack
                
                Spacer()
            }
            .onTapGesture {
                if style != .disabled {
                    toggleState()
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
        
        private var iconName: String {
            return "checkbox-\(state.rawValue)"
        }
        
        private var tintColor: Color {
            switch (state, style) {
            case (.selected, .default):
                return colorProvider.checkboxBackgroundSelected
            case (.selected, .error):
                return colorProvider.checkboxNegativeBackgroundSelected
            case (.selected, .disabled):
                return colorProvider.checkboxBackgroundSelectedDisabled
            case (.partiallySelected, .default):
                return colorProvider.checkboxBackgroundSelected
            case (.partiallySelected, .error):
                return colorProvider.checkboxNegativeBackgroundSelected
            case (.partiallySelected, .disabled):
                return colorProvider.checkboxBackgroundSelectedDisabled
            case (.notSelected, .default):
                return colorProvider.checkboxBorder
            case (.notSelected, .error):
                return colorProvider.checkboxNegativeBorder
            case (.notSelected, .disabled):
                return colorProvider.checkboxBorderDisabled
            }
        }
        
        private var borderColor: Color {
            switch style {
            case .default:
                return colorProvider.checkboxBorder
            case .error:
                return colorProvider.checkboxNegativeBorder
            case .disabled:
                return colorProvider.checkboxBorderDisabled
            }
        }
        
        private var backgroundColor: Color {
            switch style {
            case .default, .error:
                return colorProvider.checkboxBackground
            case .disabled:
                return colorProvider.checkboxBackgroundDisabled
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
        
        private func toggleState() {
            let newState = stateTransition?(state) ?? defaultStateTransition(state)
            state = newState
            onStateChange?(newState)
        }
        
        private func defaultStateTransition(_ currentState: CheckboxState) -> CheckboxState {
            return currentState == .notSelected ? .selected : .notSelected
        }
    }
}
