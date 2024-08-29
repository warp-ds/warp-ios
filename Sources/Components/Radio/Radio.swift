import SwiftUI

extension Warp {
    /// Radio buttons allow users to select one option from a set.
    ///
    /// `Radio` is a customizable component that allows users
    /// to create a list of radio buttons where only one can be selected at any given time.
    ///
    /// - Parameters:
    ///   - selectedOption: A binding to the currently selected option.
    ///   - options: An array of options that conform to `Identifiable` and `Hashable`.
    ///   - label: A closure that provides a label for each option.
    ///   - state: The state of the radio button group (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - contentLayout: Defines whether the label and extra content are arranged horizontally or vertically.
    public struct RadioGroup<Option: Identifiable & Hashable>: View {
        /// A binding to the currently selected option.
        @Binding var selectedOption: Option
        /// An array of options that conform to `Identifiable` and `Hashable`.
        var options: [Option]
        /// A closure that provides a label for each option.
        var label: (Option) -> String
        /// The state of the radio button group (default, error, disabled).
        var state: RadioButtonState
        /// An optional view that will be displayed beside or below the label.
        var extraContent: ((Option) -> AnyView)?
        /// Defines whether the label and extra content are arranged horizontally or vertically.
        var contentLayout: Axis.Set
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `Radio`.
        ///
        /// - Parameters:
        ///   - selectedOption: A binding to the currently selected option.
        ///   - options: An array of options that conform to `Identifiable` and `Hashable`.
        ///   - label: A closure that provides a label for each option.
        ///   - state: The state of the radio button group (default, error, disabled).
        ///   - extraContent: A view that will be displayed beside or below the label.
        ///   - contentLayout: Defines whether the label and extra content are arranged horizontally or vertically.
        public init(selectedOption: Binding<Option>,
                    options: [Option],
                    label: @escaping (Option) -> String,
                    state: RadioButtonState = .default,
                    extraContent: ((Option) -> AnyView)? = nil,
                    contentLayout: Axis.Set = .horizontal) {
            self._selectedOption = selectedOption
            self.options = options
            self.label = label
            self.state = state
            self.extraContent = extraContent
            self.contentLayout = contentLayout
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: Spacing.spacing200) {
                ForEach(options) { option in
                    Radio(isSelected: selectedOption == option,
                          label: label(option),
                          state: state,
                          extraContent: extraContent?(option),
                          contentLayout: contentLayout) {
                        selectedOption = option
                    }
                          .disabled(state == .disabled)
                }
            }
            .padding(Spacing.spacing200)
        }
    }
    
    /// A single radio button view used within `RadioButtonGroup`.
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
            case (.error, true):
                return colorProvider.radioNegativeBorder
            case (.error, false):
                return colorProvider.radioNegativeBorder
            case (.disabled, true):
                return colorProvider.radioBorderDisabled
            case (.disabled, false):
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
