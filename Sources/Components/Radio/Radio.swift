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
    ///   - indentationLevel: The level of indentation for the radio button. Each level adds 24 points of indentation.
    ///   - action: A closure that is executed when the radio button is tapped.
    public struct Radio: View {
        /// Style that will be consumed to create the radio view.
        @Environment(\.radioStyle) var style

        /// A Boolean value indicating whether the radio button is selected.
        private let isSelected: Bool

        /// View that will be shown when it's in selected state.
        private let selectedLabel: AnyView

        /// View that will be shown when it's in deselected state.
        private let deselectedLabel: AnyView

        /// Initializes a new `Radio`.
        ///
        /// - Parameters:
        ///   - isSelected: A Boolean value indicating whether the radio button is selected.
        ///   - label: The text label for the radio button.
        ///   - style: The style the radio button can have (default, error, disabled).
        ///   - extraContent: An optional view that will be displayed beside or below the label.
        ///   - action: A closure that is executed when the radio button is tapped.
        public init(
            isSelected: Bool,
            label: String,
            hasError: Bool,
            extraContent: AnyView? = nil
        ) {
            selectedLabel = AnyView(
                DefaultSelectedLabel(
                    label: label,
                    hasError: hasError,
                    extraContent: extraContent,
                    indentationLevel: 0
                )
            )

            deselectedLabel = AnyView(
                DefaultDeselectedLabel(
                    label: label,
                    hasError: hasError,
                    extraContent: extraContent,
                    indentationLevel: 0
                )
            )

            self.isSelected = isSelected
        }

        public init(
            @ViewBuilder selectedLabel: @escaping () -> some View,
            @ViewBuilder deselectedLabel: @escaping () -> some View,
            isSelected: Bool
        ) {
            self.selectedLabel = AnyView(selectedLabel())
            self.deselectedLabel = AnyView(deselectedLabel())
            self.isSelected = isSelected
        }

        public var body: some View {
            style
                .makeBody(
                    configuration: RadioStyleConfiguration(
                        selectedLabel: RadioStyleConfiguration.Label {
                            selectedLabel
                        },
                        deselectedLabel: RadioStyleConfiguration.Label {
                            deselectedLabel
                        },
                        isSelected: isSelected
                    )
                )
                .accessibilityElement(children: .combine)
                .modifier(AccessibilityTraitModifier(isSelected: isSelected))
        }
    }
}

private struct AccessibilityTraitModifier: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .accessibilityAddTraits(.isToggle)
        } else {
            if isSelected {
                content
                    .accessibilityAddTraits(.isButton)
                    .accessibilityAddTraits(.isSelected)
            } else {
                content
                    .accessibilityAddTraits(.isButton)
                    .accessibilityRemoveTraits(.isSelected)
            }
        }
    }
}
