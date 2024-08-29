import SwiftUI

extension Warp {
    /// Radio buttons allow users to select one option from a set.
    ///
    /// `RadioGroup` is a customizable component that allows users
    /// to create a list of radio buttons where only one can be selected at any given time.
    /// The radio buttons can be aligned either vertically or horizontally.
    ///
    /// - Parameters:
    ///   - title: An optional title for the radio group.
    ///   - helpText: An optional help text displayed below the title or the radio buttons.
    ///   - selectedOption: A binding to the currently selected option.
    ///   - options: An array of options that conform to `RadioOption`.
    ///   - label: A closure that provides a label for each option.
    ///   - state: The state of the radio button group (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
    public struct RadioGroup<Option: RadioOption>: View {
        /// An optional title for the radio group.
        var title: String?
        /// An optional help text displayed below the title or the radio buttons.
        var helpText: String?
        /// A binding to the currently selected option.
        @Binding var selectedOption: Option
        /// An array of options that conform to `RadioOption`.
        var options: [Option]
        /// A closure that provides a label for each option.
        var label: (Option) -> String
        /// The state of the radio button group (default, error, disabled).
        var state: RadioButtonState
        /// An optional view that will be displayed beside or below the label.
        var extraContent: ((Option) -> AnyView)?
        /// Determines whether the list of radio buttons is aligned vertically or horizontally.
        var axis: Axis.Set
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `RadioGroup`.
        ///
        /// - Parameters:
        ///   - title: An optional title for the radio group.
        ///   - helpText: An optional help text displayed below the title or the radio buttons.
        ///   - selectedOption: A binding to the currently selected option.
        ///   - options: An array of options that conform to `RadioOption`.
        ///   - label: A closure that provides a label for each option.
        ///   - state: The state of the radio button group (default, error, disabled).
        ///   - extraContent: A view that will be displayed beside or below the label.
        ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
        public init(title: String? = nil,
                    helpText: String? = nil,
                    selectedOption: Binding<Option>,
                    options: [Option],
                    label: @escaping (Option) -> String,
                    state: RadioButtonState = .default,
                    extraContent: ((Option) -> AnyView)? = nil,
                    axis: Axis.Set = .vertical) {
            self.title = title
            self.helpText = helpText
            self._selectedOption = selectedOption
            self.options = options
            self.label = label
            self.state = state
            self.extraContent = extraContent
            self.axis = axis
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: Spacing.spacing200) {
                if let title = title, !title.isEmpty {
                    SwiftUI.Text(title)
                        .font(Typography.title5.font)
                        .foregroundColor(colorProvider.token.text)
                }
                
                groupView
                
                if let helpText = helpText, !helpText.isEmpty {
                    SwiftUI.Text(helpText)
                        .font(Typography.detail.font)
                        .foregroundColor(colorProvider.token.textSubtle)
                }
            }
        }
        
        @ViewBuilder
        private var groupView: some View {
            switch axis {
            case .vertical:
                VStack(alignment: .leading, spacing: Spacing.spacing200) {
                    ForEach(options) { option in
                        Radio(isSelected: selectedOption == option,
                              label: label(option),
                              state: state,
                              extraContent: extraContent?(option),
                              indentationLevel: option.indentationLevel) {
                            selectedOption = option
                        }
                              .disabled(state == .disabled)
                    }
                }
            case .horizontal, _:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Spacing.spacing200) {
                        ForEach(options) { option in
                            Radio(isSelected: selectedOption == option,
                                  label: label(option),
                                  state: state,
                                  extraContent: extraContent?(option)) {
                                selectedOption = option
                            }
                                  .disabled(state == .disabled)
                        }
                    }
                }
            }
        }
    }
}
