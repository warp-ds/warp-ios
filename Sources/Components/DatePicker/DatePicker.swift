import SwiftUI

extension Warp {

    public struct DatePicker: View {

        /// The current selected date.
        @Binding var date: Date

        /// The formatted date as a string.
        @Binding var text: String

        /// Text to display when the text field is empty.
        private let placeholder: String

        /// Creates a Warp date picker component that combines a text field with a calendar icon and an overlay date picker.
        /// The text field displays the selected date in a formatted string, and tapping the calendar icon opens the date picker.
        /// - Parameters:
        ///   - date: Binding to the currently selected date.
        ///   - text: Binding to the formatted date string.
        ///   - placeholder: Placeholder text for the text field when no date is selected.
        public init(date: Binding<Date>, text: Binding<String>, placeholder: String) {
            self._date = date
            self._text = text
            self.placeholder = placeholder
        }

        public var body: some View {
            Warp.TextField(
                text: $text,
                placeholder: placeholder,
                rightIcon: .calendar
            )
            .overlay {
                SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .colorMultiply(.clear)
            }
        }
    }
}
