import SwiftUI

extension Warp {
    /// A date picker component which enable selection of a date either through a text field with a calendar icon that opens an overlay date picker, or an inline date picker that is always visible.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.DatePicker(
    ///   style: .textfield,
    ///   date: $selectedDate,
    ///   dateFormatter: { date in /* formatting logic */ },
    ///   dateValidator: { date in /* validation logic */ },
    ///   helpText: "Select a date",
    ///   placeholder: "MM/DD/YYYY"
    /// )
    ///
    /// - Parameters:
    ///   - style: The style of the date picker, either `dialog`, `textfield`, or `inline`. Default is `dialog`.
    ///   - date: Binding to the currently selected date.
    ///   - dateFormatter: Optional closure to format the selected date into a string for display in the text field. Defaults to a short date style formatter.
    ///   - dateValidator: Optional closure closure that takes a `Date` and returns a `Bool` indicating whether the date is valid. Default always returns true.
    ///   - helpText: Optional help text to display below the text field
    ///   - placeholder: Optional placeholder text to display in the text field when no date is selected.
    public struct DatePicker: View {

        private static let shortDateFormatter: (Date) -> String = { date in
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            return formatter.string(from: date)
        }

        /// The style of the date picker
        public enum Style {
            /// A native button date picker with Warp styling
            case dialog
            /// A date picker that combines a text field with a calendar icon and an overlay date picker.
            case textfield
            /// An inline date picker that is always visible.
            case inline
        }

        private let style: Style

        /// The current selected date.
        @Binding private var date: Date

        /// Date to string transformation closure.
        /// by default it uses short date style
        private var dateFormatter: (Date) -> String

        /// A closure that validates the selected date.
        private var dateValidator: (Date) -> Bool

        /// Optional `String` to display below the text field for the default style date picker.
        private let helpText: String?

        /// Optional text to display when the text field is empty.
        private let placeholder: String?

        /// Creates a Warp date picker component that combines a text field with a calendar icon and an overlay date picker.
        /// The text field displays the selected date in a formatted string, and tapping the calendar icon opens the date picker.
        /// - Parameters:
        ///   - style: The style of the date picker, either `dialog`, `textfield`, or `inline`. Default is `dialog`.
        ///   - date: Binding to the currently selected date.
        ///   - dateFormatter: Optional closure to format the selected date into a string for display in the text field. Defaults to a short date style formatter.
        ///   - dateValidator: Optional closure closure that takes a `Date` and returns a `Bool` indicating whether the date is valid. Default always returns true.
        ///   - helpText: Optional help text to display below the text field
        ///   - placeholder: Optional placeholder text to display in the text field when no date is selected.
        public init(
            style: Style = .dialog,
            date: Binding<Date>,
            dateFormatter: ((Date) -> String)? = nil,
            dateValidator: ((Date) -> Bool)? = nil,
            helpText: String? = nil,
            placeholder: String? = nil
        ) {
            self.style = style
            self._date = date
            self.dateValidator = dateValidator ?? { _ in true }
            self.helpText = helpText
            self.placeholder = placeholder
            self.dateFormatter = dateFormatter ?? Warp.DatePicker.shortDateFormatter
        }

        public var body: some View {
            switch style {
            case .dialog:
                datePicker
                    .labelsHidden()
            case .textfield:
                datePickerWithTextField
            case .inline:
                inlineDatePicker
            }
        }

        private var datePickerWithTextField: some View {
            let isValid = dateValidator(date)
            return Warp.TextField(
                text: Binding(
                    get: { dateFormatter(date) },
                    set: { _ in }
                ),
                placeholder: placeholder ?? "",
                rightIcon: .calendar,
                style: isValid ? .default : .error,
                helpText: helpText
            )
            .disableEditing(true)
            .overlay {
                VStack {
                    datePicker
                    .padding(.top, 8)
                    Spacer()
                }
                .colorMultiply(.clear)
            }
        }

        private var inlineDatePicker: some View {
            datePicker
            .datePickerStyle(.graphical)
        }

        private var datePicker: some View {
            SwiftUI.DatePicker(
                "",
                selection: $date,
                displayedComponents: [.date]
            )
            .accentColor(Warp.Token.backgroundPrimary)
        }
    }
}
