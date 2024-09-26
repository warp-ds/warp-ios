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
    ///   - style: The style of the radio button group (default, error, disabled).
    ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
    ///   - onSelection: A closure that will be triggered when an option is selected, providing the old and new selection.
    public struct RadioGroup<Option: RadioOption>: View {
        /// An optional title for the radio group.
        var title: String?
        /// An optional help text displayed below the title or the radio buttons.
        var helpText: String?
        /// A binding to the currently selected option.
        @Binding var selectedOption: Option
        /// An array of options that conform to `RadioOption`.
        var options: [Option]
        /// The style the radio group can have (default, error, disabled).
        var style: RadioStyle
        /// Determines whether the list of radio buttons is aligned vertically or horizontally.
        var axis: Axis.Set
        /// A closure that will be triggered when an option is selected, providing the old and new selection.
        var onSelection: ((Option, Option) -> Void)?
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `RadioGroup`.
        ///
        /// - Parameters:
        ///   - title: An optional title for the radio group.
        ///   - helpText: An optional help text displayed below the title or the radio buttons.
        ///   - selectedOption: A binding to the currently selected option.
        ///   - options: An array of options that conform to `RadioOption`.
        ///   - style: The style the radio group can have (default, error, disabled).
        ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
        ///   - onSelection: A closure that will be triggered when an option is selected, providing the old and new selection.
        public init(title: String? = nil,
                    helpText: String? = nil,
                    selectedOption: Binding<Option>,
                    options: [Option],
                    style: RadioStyle = .default,
                    axis: Axis.Set = .vertical,
                    onSelection: ((Option, Option) -> Void)? = nil) {
            self.title = title
            self.helpText = helpText
            self._selectedOption = selectedOption
            self.options = options
            self.style = style
            self.axis = axis
            self.onSelection = onSelection
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: Spacing.spacing200) {
                if let title = title, !title.isEmpty {
                    Text(title, style: .title5)
                        .foregroundColor(colorProvider.token.text)
                }
                
                groupView
                
                if let helpText = helpText, !helpText.isEmpty {
                    Text(helpText, style: .detail)
                        .foregroundColor(helpTextColor)
                }
            }
        }
        
        private var helpTextColor: Color {
            style == .error ? colorProvider.token.textNegative : colorProvider.token.textSubtle
        }
        
        @ViewBuilder
        private var groupView: some View {
            switch axis {
            case .vertical:
                VStack(alignment: .leading, spacing: Spacing.spacing200) {
                    ForEach(options) { option in
                        Radio(isSelected: selectedOption == option,
                              label: option.title,
                              style: style,
                              extraContent: option.extraContent) {
                            let oldSelection = selectedOption
                            selectedOption = option
                            onSelection?(oldSelection, option)
                        }
                              .disabled(style == .disabled)
                    }
                }
            case .horizontal, _:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Spacing.spacing200) {
                        ForEach(options) { option in
                            Radio(isSelected: selectedOption == option,
                                  label: option.title,
                                  style: style,
                                  extraContent: option.extraContent) {
                                let oldSelection = selectedOption
                                selectedOption = option
                                onSelection?(oldSelection, option)
                            }
                                  .disabled(style == .disabled)
                        }
                    }
                }
            }
        }
    }
}
