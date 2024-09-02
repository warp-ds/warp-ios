import SwiftUI

extension Warp {
    /// Checkbox buttons allow users to select multiple options from a set.
    ///
    /// `CheckboxGroup` is a customizable component that allows users
    /// to create a list of checkboxes where multiple can be selected at any given time.
    /// The checkboxes can be aligned either vertically or horizontally.
    ///
    /// - Parameters:
    ///   - title: An optional title for the checkbox group.
    ///   - helpText: An optional help text displayed below the title or the checkboxes.
    ///   - selectedOptions: A binding to the currently selected options.
    ///   - options: An array of options that conform to `CheckboxOption`.
    ///   - label: A closure that provides a label for each option.
    ///   - state: The style of the checkbox group (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - axis: Determines whether the list of checkboxes is aligned vertically or horizontally.
    ///   - onSelection: A closure that will be triggered when an option is selected, providing the latest selected option and the list of selected options.
    public struct CheckboxGroup<Option: CheckboxOption>: View {
        /// An optional title for the checkbox group.
        var title: String?
        /// An optional help text displayed below the title or the checkboxes.
        var helpText: String?
        /// A binding to the currently selected options.
        @Binding var selectedOptions: [Option]
        /// An array of options that conform to `CheckboxOption`.
        var options: [Option]
        /// A closure that provides a label for each option.
        var label: (Option) -> String
        /// The style of the checkbox group (default, error, disabled).
        var style: CheckboxStyle
        /// An optional view that will be displayed beside or below the label.
        var extraContent: ((Option) -> AnyView)?
        /// Determines whether the list of checkboxes is aligned vertically or horizontally.
        var axis: Axis.Set
        /// A closure that will be triggered when an option is selected, providing the latest selected option and the list of selected options.
        var onSelection: ((Option, [Option]) -> Void)?
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `CheckboxGroup`.
        ///
        /// - Parameters:
        ///   - title: An optional title for the checkbox group.
        ///   - helpText: An optional help text displayed below the title or the checkboxes.
        ///   - selectedOptions: A binding to the currently selected options.
        ///   - options: An array of options that conform to `CheckboxOption`.
        ///   - label: A closure that provides a label for each option.
        ///   - style: The style of the checkbox group (default, error, disabled).
        ///   - extraContent: A view that will be displayed beside or below the label.
        ///   - axis: Determines whether the list of checkboxes is aligned vertically or horizontally.
        ///   - onSelection: A closure that will be triggered when an option is selected, providing the latest selected option and the list of selected options.
        public init(title: String? = nil,
                    helpText: String? = nil,
                    selectedOptions: Binding<[Option]>,
                    options: [Option],
                    label: @escaping (Option) -> String,
                    style: CheckboxStyle = .default,
                    extraContent: ((Option) -> AnyView)? = nil,
                    axis: Axis.Set = .vertical,
                    onSelection: ((Option, [Option]) -> Void)? = nil) {
            self.title = title
            self.helpText = helpText
            self._selectedOptions = selectedOptions
            self.options = options
            self.label = label
            self.style = style
            self.extraContent = extraContent
            self.axis = axis
            self.onSelection = onSelection
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
                        Checkbox(isSelected: selectedOptions.contains(option),
                                 label: label(option),
                                 state: option.state,
                                 style: style,
                                 extraContent: extraContent?(option),
                                 indentationLevel: option.indentationLevel) {
                            if let index = selectedOptions.firstIndex(of: option) {
                                selectedOptions.remove(at: index)
                            } else {
                                selectedOptions.append(option)
                            }
                            onSelection?(option, selectedOptions)
                        }
                              .disabled(style == .disabled)
                    }
                }
            case .horizontal, _:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Spacing.spacing200) {
                        ForEach(options) { option in
                            Checkbox(isSelected: selectedOptions.contains(option),
                                     label: label(option),
                                     state: option.state,
                                     style: style,
                                     extraContent: extraContent?(option),
                                     indentationLevel: option.indentationLevel) {
                                if let index = selectedOptions.firstIndex(of: option) {
                                    selectedOptions.remove(at: index)
                                } else {
                                    selectedOptions.append(option)
                                }
                                onSelection?(option, selectedOptions)
                            }
                                  .disabled(style == .disabled)
                        }
                    }
                }
            }
        }
    }
}
