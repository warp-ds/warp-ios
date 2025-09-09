import SwiftUI

extension Warp {

    public struct DatePicker: View {

        /// The current selected date.
        @Binding var date: Date

        /// The formatted date as a string.
        @Binding var text: String

        /// The style of the text field.
        private let style: Warp.TextFieldStyle

        /// Optional `String` to display below the text field.
        private let helpText: String?

        /// Text to display when the text field is empty.
        private let placeholder: String

        /// Creates a Warp date picker component that combines a text field with a calendar icon and an overlay date picker.
        /// The text field displays the selected date in a formatted string, and tapping the calendar icon opens the date picker.
        /// - Parameters:
        ///   - date: Binding to the currently selected date.
        ///   - text: Binding to the formatted date string.
        ///   - placeholder: Placeholder text for the text field when no date is selected.
        ///   - style: The style of the text field. Default is `.default`.
        ///   - helpText: Optional help text to display below the text field.
        public init(
            date: Binding<Date>,
            text: Binding<String>,
            style: TextFieldStyle = .default,
            helpText: String? = nil,
            placeholder: String
        ) {
            self._date = date
            self._text = text
            self.style = style
            self.helpText = helpText
            self.placeholder = placeholder
        }

        public var body: some View {
            Warp.TextField(
                text: $text,
                placeholder: placeholder,
                rightIcon: .calendar,
                style: style,
                helpText: helpText
            )
            .disableEditing(true)
            .overlay {
                VStack {
                    SwiftUI.DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    .padding(.top, 8)
                    Spacer()
                }
                .colorMultiply(.clear)
            }
        }
    }
}
