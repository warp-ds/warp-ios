import SwiftUI

extension Warp {
    /// Radio buttons allow users to select one option from a set.
    ///
    /// `RadioGroup` is a customisable component that allows users
    /// to create a list of radio buttons where only one can be selected at any given time.
    /// The radio buttons can be aligned either vertically or horizontally.
    ///
    /// - Warning:
    /// Accessibility group should be handled by the consumer, based on the consumer language.
    ///
    /// - Parameters:
    ///   - title: An optional title for the radio group.
    ///   - helpText: An optional help text displayed below the title or the radio buttons.
    ///   - selectedOption: A binding to the currently selected option.
    ///   - options: An array of options that conform to `RadioOption`.
    ///   - label: A closure that provides a label for each option.
    ///   - style: The style of the radio button group (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
    ///   - onSelection: A closure that will be triggered when an option is selected, providing the old and new selection.
    public struct RadioGroup<Option: RadioOption>: View {
        /// An optional title for the radio group.
        private let title: String?

        /// An optional help text displayed below the title or the radio buttons.
        private let helpText: String?

        /// A binding to the currently selected option.
        @Binding private var selectedOption: Option?

        /// An array of options that conform to `RadioOption`.
        private let options: [Option]

        /// A closure that provides a label for each option.
        private let label: (Option) -> String

        /// A Boolean flag indicating should view should error state.
        private let hasError: Bool

        /// An optional view that will be displayed beside or below the label.
        private let extraContent: ((Option) -> AnyView)?

        /// Determines whether the list of radio buttons is aligned vertically or horizontally.
        private let axis: Axis

        /// A closure that will be triggered when an option is selected, providing the old and new selection.
        private let onSelection: ((Option, Option) -> Void)?
        
        /// An animation witch will be fired for each selection action.
        private let changeSelectionAnimation: Animation

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
        ///   - style: The style the radio group can have (default, error, disabled).
        ///   - extraContent: A view that will be displayed beside or below the label.
        ///   - axis: Determines whether the list of radio buttons is aligned vertically or horizontally.
        ///   - onSelection: A closure that will be triggered when an option is selected, providing the old and new selection.
        public init(
            title: String? = nil,
            helpText: String? = nil,
            selectedOption: Binding<Option?>,
            options: [Option],
            label: @escaping (Option) -> String,
            hasError: Bool = false,
            extraContent: ((Option) -> AnyView)? = nil,
            axis: Axis = .vertical,
            onSelection: ((Option, Option) -> Void)? = nil,
            changeSelectionAnimation: Animation = .default
        ) {
            self.title = title
            self.helpText = helpText
            self._selectedOption = selectedOption
            self.options = options
            self.label = label
            self.hasError = hasError
            self.extraContent = extraContent
            self.axis = axis
            self.onSelection = onSelection
            self.changeSelectionAnimation = changeSelectionAnimation
        }
        
        public var body: some View {
            HStack {
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

                Spacer()
            }
            .accessibilityInputLabels(options.map(\.title))
            .accessibilityElement(children: .combine)
            .accessibilityAddTraits(.allowsDirectInteraction)
            .accessibilityAddTraits(.updatesFrequently)
        }
        
        // TODO: Use ``ViewThatFits`` in future.
        @ViewBuilder
        private var groupView: some View {
            switch axis {
            case .vertical:
                VStack(alignment: .leading, spacing: Spacing.spacing200) {
                    ForEach(options) { option in
                        Radio(
                            isSelected: selectedOption == option,
                            label: label(option),
                            hasError: hasError,
                            extraContent: extraContent?(option)
                        ).onTapGesture {
                            selectOption(option: option)
                        }
                    }
                }

            case .horizontal:
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Spacing.spacing200) {
                        ForEach(options) { option in
                            Radio(
                                isSelected: selectedOption == option,
                                label: label(option),
                                hasError: hasError,
                                extraContent: extraContent?(option)
                            ).onTapGesture {
                                selectOption(option: option)
                            }
                        }
                    }
                }
            }
        }

        private func selectOption(option: Option) {
            withAnimation(.smooth) {
                selectedOption = option
            }
        }
    }
}
