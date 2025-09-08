import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()

    @State private var presentingPopover = false

    var body: some View {
        ScrollView(showsIndicators: false) {

            // Warp date picker
            GroupBox(content: {
                VStack {
                    Warp.DatePicker(
                        date: $selectedDate,
                        text: Binding(
                            get: { formattedDate(selectedDate) },
                            set: { _ in }
                        ),
                        placeholder: "Select a date"
                    )
                    .padding()

                    HStack {
                        Spacer()
                        Text("Selected date: \(formattedDate(selectedDate))")
                        Spacer()
                    }
                }
            }, label: {
                Text("TextField with Date Picker")
            })
                 

            // Inline datepicker
            GroupBox(content: {
                VStack {
                    DatePicker(
                        "Select a date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle( .graphical)
                    .padding()

                    HStack {
                        Spacer()
                        Text("Selected date: \(formattedDate(selectedDate))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Embedded Date Picker")
            })
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
