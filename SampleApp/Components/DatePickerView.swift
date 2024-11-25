import SwiftUI
import Warp

struct DatePickerView: View {
    @State private var selectedPicker = 0 // 0 for single date, 1 for date range
    @State private var selectedDate = Date()
    @State private var startDate = Date()
    @State private var endDate = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Segmented control to toggle between pickers
            Picker("Select Picker", selection: $selectedPicker) {
                Text("Single Date").tag(0)
                Text("Date Range").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            // Picker content
            if selectedPicker == 0 {
                Warp.DatePicker(
                    title: "Pick a Date",
                    selectedDate: $selectedDate,
                    style: GraphicalDatePickerStyle()
                )
                .padding()
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .padding(.top)
            } else {
                Warp.RangeDatePicker(
                    title: "Pick a Date Range",
                    startDate: $startDate,
                    endDate: $endDate,
                    style: CompactDatePickerStyle()
                )
                .padding()
                Text("Selected Range: \(formattedRange)")
                    .padding(.top)
            }

            Spacer()
        }
        .navigationTitle("Date Picker")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }

    // Helper for formatting a single date
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

    // Helper for formatting a date range
    private var formattedRange: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return "\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))"
    }
}

#Preview {
    DatePickerView()
}
