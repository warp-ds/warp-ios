import SwiftUI

extension Warp {
    /// A customizable range date picker for selecting a start and end date.
    public struct RangeDatePicker: View {
        @Binding var startDate: Date
        @Binding var endDate: Date
        let title: String
        let style: any SwiftUI.DatePickerStyle
        
        public init(
            title: String = "Select a Date Range",
            startDate: Binding<Date>,
            endDate: Binding<Date>,
            style: any SwiftUI.DatePickerStyle = CompactDatePickerStyle()
        ) {
            self.title = title
            self._startDate = startDate
            self._endDate = endDate
            self.style = style
        }
        
        public var body: some View {
            VStack(alignment: .leading, spacing: 16) {
                Text(title, style: .bodyStrong)
                
                VStack(spacing: 12) {
                    // Start Date Picker
                    SwiftUI.DatePicker(
                        "Start Date",
                        selection: $startDate,
                        in: ...endDate,
                        displayedComponents: [.date]
                    )
                    .applyDatePickerStyle(style)
                    
                    // End Date Picker
                    SwiftUI.DatePicker(
                        "End Date",
                        selection: $endDate,
                        in: startDate...,
                        displayedComponents: [.date]
                    )
                    .applyDatePickerStyle(style)
                }
            }
            .padding()
        }
    }
}
