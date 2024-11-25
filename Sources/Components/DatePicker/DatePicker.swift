import SwiftUI

extension Warp {
    /// A customizable single date picker for selecting a specific date.
    public struct DatePicker: View {
        @Binding var selectedDate: Date
        let title: String
        let range: ClosedRange<Date>?
        let style: any SwiftUI.DatePickerStyle
        
        public init(
            title: String = "Select a Date",
            selectedDate: Binding<Date>,
            range: ClosedRange<Date>? = nil,
            style: any SwiftUI.DatePickerStyle = GraphicalDatePickerStyle()
        ) {
            self.title = title
            self._selectedDate = selectedDate
            self.range = range
            self.style = style
        }
        
        public var body: some View {
            VStack(alignment: .leading) {
                Text(title, style: .bodyStrong)
                SwiftUI.DatePicker(
                    "",
                    selection: $selectedDate,
                    in: range ?? Date.distantPast...Date.distantFuture,
                    displayedComponents: [.date]
                )
                .applyDatePickerStyle(style)
            }
        }
    }
}
