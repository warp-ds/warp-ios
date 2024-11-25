import SwiftUI
import Warp

struct DatePickerView: View {
    @State private var selectedPicker = 0 // 0 for single date, 1 for date range
    @State private var selectedDate = Date()
    @State private var startDate = Date()
    @State private var endDate = Calendar.current.date(byAdding: .day, value: 7, to: Date()) ?? Date()
    
    @State private var selectedStyle = 0 // Index for selected DatePickerStyle
    private let datePickerStyles: [(name: String, style: any DatePickerStyle)] = [
        ("Compact", CompactDatePickerStyle()),
        ("Graphical", GraphicalDatePickerStyle()),
        ("Wheel", WheelDatePickerStyle())
    ]

    var body: some View {
            // Segmented control to toggle between pickers
            Picker("Select Picker", selection: $selectedPicker.animation(.smooth)) {
                Text("Single Date").tag(0)
                Text("Date Range").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Picker for DatePickerStyle
            Picker("Style", selection: $selectedStyle.animation(.smooth)) {
                ForEach(0..<datePickerStyles.count, id: \.self) { index in
                    Text(datePickerStyles[index].name).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

        ScrollView(showsIndicators: false) {
            // Picker content
            if selectedPicker == 0 {
                Warp.DatePicker(
                    title: "Pick a Date",
                    selectedDate: $selectedDate,
                    range: Date()...Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
                    style: datePickerStyles[selectedStyle].style
                )
                .padding()
            } else {
                Warp.RangeDatePicker(
                    title: "Pick a Date Range",
                    startDate: $startDate,
                    endDate: $endDate,
                    style: datePickerStyles[selectedStyle].style
                )
                .padding()
            }
            Spacer()
        }
        VStack {
            if selectedPicker == 0 {
                Text("Selected Date: \(selectedDate, formatter: dateFormatter)")
                    .padding(.top)
            } else {
                Text("Selected Range: \(formattedRange)")
                    .padding(.top)
            }
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
