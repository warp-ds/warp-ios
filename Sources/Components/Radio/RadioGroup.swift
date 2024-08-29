import SwiftUI

extension Warp {
    /// Radio buttons allow users to select one option from a set.
    ///
    /// `RadioGroup` is a customizable component that allows users
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
        
        /// Initializes a new `RadioGroup`.
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
}
