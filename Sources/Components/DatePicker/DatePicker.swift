import SwiftUI

extension Warp {

    /// A WARP-styled inlined date picker component that allows users to select a date from a graphical calendar interface.
    /// The `DatePicker` component can be customized with optional date range constraints to limit the selectable dates.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.DatePicker(date: $selectedDate)
    /// ```
    ///
    /// - Parameters:
    ///   - date: A binding to the selected date.
    ///   - range: An optional range of selectable dates.
    public struct DatePicker: View {

        /// The selected date.
        @Binding private var date: Date

        /// The range of selectable dates.
        private let range: DatePickerRange?

        /// Initializes a `DatePicker` with a binding to the selected date.
        ///
        /// **Usage:**
        /// ```swift
        /// Warp.DatePicker(date: $selectedDate)
        /// ```
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        public init(date: Binding<Date>) {
            self._date = date
            range = nil
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a closed range of selectable dates.
        ///
        /// **Usage:**
        /// ```swift
        /// Warp.DatePicker(date: $selectedDate, range: startDate...endDate)
        /// ```
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A closed range of dates that the user can select from.
        public init(date: Binding<Date>, range: ClosedRange<Date>) {
            self._date = date
            self.range = .closed(range)
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a partial range starting from a specific date.
        ///
        /// **Usage:**
        /// ```swift
        /// Warp.DatePicker(date: $selectedDate, range: startDate...)
        /// ```
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A partial range of dates that the user can select from, starting from a specific date.
        public init(date: Binding<Date>, range: PartialRangeFrom<Date>) {
            self._date = date
            self.range = .from(range)
        }

        /// Initializes a `DatePicker` with a binding to the selected date and a partial range up to a specific date.
        ///
        /// **Usage:**
        /// ```swift
        /// Warp.DatePicker(date: $selectedDate, range: ...endDate)
        /// ```
        ///
        /// - Parameters:
        ///   - date: A binding to the selected date.
        ///   - range: A partial range of dates that the user can select from, up to a specific date.
        public init(date: Binding<Date>, range: PartialRangeThrough<Date>) {
            self._date = date
            self.range = .to(range)
        }

        public var body: some View {
            nativeDatePicker
            .datePickerStyle(.graphical)
            .accentColor(Warp.Token.backgroundPrimary)
        }

        private var nativeDatePicker: some View {
            switch range {
            case .none:
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                  )
            case .closed(let closedRange):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: closedRange,
                    displayedComponents: [.date]
                  )
            case .from(let partialRangeFrom):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: partialRangeFrom,
                    displayedComponents: [.date]
                  )
            case .to(let partialRangeThrough):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: partialRangeThrough,
                    displayedComponents: [.date]
                  )
            }
        }
    }
}
