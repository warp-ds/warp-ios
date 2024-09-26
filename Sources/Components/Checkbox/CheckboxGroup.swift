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
    ///   - options: An array of options that conform to `CheckboxOption`.
    ///   - style: The style of the checkbox group (default, error, disabled).
    ///   - axis: Determines whether the list of checkboxes is aligned vertically or horizontally.
    ///   - onSelection: A closure that will be triggered when an option is selected, providing the latest selected option and the updated list of options.
    public struct CheckboxGroup<Option: CheckboxOption>: View {
        /// An optional title for the checkbox group.
        var title: String?
        /// An optional help text displayed below the title or the checkboxes.
        var helpText: String?
        /// The array of options that conform to `CheckboxOption`.
        @Binding var options: [Option]
        /// The style of the checkbox group (default, error, disabled).
        var style: CheckboxStyle
        /// Determines whether the list of checkboxes is aligned vertically or horizontally.
        var axis: Axis.Set
        /// A closure that will be triggered when an option is selected, providing the latest selected option and the updated list of options.
        var onSelection: ((Option, [Option]) -> Void)?
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `CheckboxGroup`.
        ///
        /// - Parameters:
        ///   - title: An optional title for the checkbox group.
        ///   - helpText: An optional help text displayed below the title or the checkboxes.
        ///   - options: An array of options that conform to `CheckboxOption`.
        ///   - style: The style of the checkbox group (default, error, disabled).
        ///   - axis: Determines whether the list of checkboxes is aligned vertically or horizontally.
        ///   - onSelection: A closure that will be triggered when an option is selected, providing the latest selected option and the updated list of options.
        public init(title: String? = nil,
                    helpText: String? = nil,
                    options: Binding<[Option]>,
                    style: CheckboxStyle = .default,
                    axis: Axis.Set = .vertical,
                    onSelection: ((Option, [Option]) -> Void)? = nil) {
            self.title = title
            self.helpText = helpText
            self._options = options
            self.style = style
            self.axis = axis
            self.onSelection = onSelection
        }

        public var body: some View {
            VStack(alignment: .leading, spacing: Spacing.spacing200) {
                if let title = title, !title.isEmpty {
                    SwiftUI.Text(title)
                        .font(from: .title5)
                        .foregroundColor(colorProvider.token.text)
                }

                groupView

                if let helpText = helpText, !helpText.isEmpty {
                    SwiftUI.Text(helpText)
                        .font(from: .detail)
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
                    ForEach(options.indices, id: \.self) { index in
                        Checkbox(isSelected: options[index].isSelected,  // Pass Binding<Bool>
                                 label: options[index].title,
                                 style: style,
                                 extraContent: options[index].extraContent) {
                            options[index].isSelected.wrappedValue.toggle()
                            onSelection?(options[index], options)
                        }
                        .disabled(style == .disabled)
                    }
                }
            case .horizontal, _:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Spacing.spacing200) {
                        ForEach(options.indices, id: \.self) { index in
                            Checkbox(isSelected: options[index].isSelected,  // Pass Binding<Bool>
                                     label: options[index].title,
                                     style: style,
                                     extraContent: options[index].extraContent) {
                                options[index].isSelected.wrappedValue.toggle()
                                onSelection?(options[index], options)
                            }
                            .disabled(style == .disabled)
                        }
                    }
                }
            }
        }
    }
}
