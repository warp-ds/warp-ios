import SwiftUI

extension Warp {

    /// A WARP-styled inlined date picker component that allows users to select a date (and optionally a time) from a graphical calendar interface.
    /// The `DatePicker` component can be customized with optional date range constraints and displayed components.
    ///
    /// **Usage:**
    /// ```swift
    /// // Date only (default)
    /// Warp.DatePicker(date: $selectedDate)
    ///
    /// // Date and time
    /// Warp.DatePicker(date: $selectedDate, displayedComponents: [.date, .hourAndMinute])
    ///
    /// // With range constraint
    /// Warp.DatePicker(date: $selectedDate, range: startDate...endDate)
    /// ```
    ///
    /// - Parameters:
    ///   - date: A binding to the selected date.
    ///   - range: An optional range of selectable dates.
    ///   - displayedComponents: The date and time components to display. Defaults to `[.date]`.
    public struct DatePicker: View {

        private let content: AnyView

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Initializes a `DatePicker` with a binding to the selected date.
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - displayedComponents: The date and time components to display. Defaults to `[.date]`.
        public init(date: Binding<Date>, displayedComponents: SwiftUI.DatePicker.Components = [.date]) {
            self.content = AnyView(
                SwiftUI.DatePicker("", selection: date, displayedComponents: displayedComponents)
            )
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a closed range of selectable dates.
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A closed range of dates that the user can select from.
        ///   - displayedComponents: The date and time components to display. Defaults to `[.date]`.
        public init(date: Binding<Date>, range: ClosedRange<Date>, displayedComponents: SwiftUI.DatePicker.Components = [.date]) {
            self.content = AnyView(
                SwiftUI.DatePicker("", selection: date, in: range, displayedComponents: displayedComponents)
            )
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a partial range starting from a specific date.
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A partial range of dates that the user can select from, starting from a specific date.
        ///   - displayedComponents: The date and time components to display. Defaults to `[.date]`.
        public init(date: Binding<Date>, range: PartialRangeFrom<Date>, displayedComponents: SwiftUI.DatePicker.Components = [.date]) {
            self.content = AnyView(
                SwiftUI.DatePicker("", selection: date, in: range, displayedComponents: displayedComponents)
            )
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a partial range up to a specific date.
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A partial range of dates that the user can select from, up to a specific date.
        ///   - displayedComponents: The date and time components to display. Defaults to `[.date]`.
        public init(date: Binding<Date>, range: PartialRangeThrough<Date>, displayedComponents: SwiftUI.DatePicker.Components = [.date]) {
            self.content = AnyView(
                SwiftUI.DatePicker("", selection: date, in: range, displayedComponents: displayedComponents)
            )
        }

        public var body: some View {
            content
                .datePickerStyle(.graphical)
                .tint(theme.token.backgroundPrimary)
        }
    }
}
