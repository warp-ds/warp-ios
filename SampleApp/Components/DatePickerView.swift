import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()

    var body: some View {
        ScrollView(showsIndicators: false) {
            GroupBox(content: {
                VStack {
                    // DatePicker with custom format
                    DatePicker(
                        "Select a date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .warpDatePicker()
                    .padding()

                    HStack {
                        Spacer()
                        // Display the selected date in the specified format
                        Text("Selected date: \(formattedDate(selectedDate))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Date Picker")
            })
            .padding(.bottom)
        }
        .padding()
        .navigationTitle("Date Picker")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}
