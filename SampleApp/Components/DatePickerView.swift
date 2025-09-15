import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()

    var body: some View {
        ScrollView(showsIndicators: false) {
            // WARP date picker
            GroupBox(content: {
                VStack {
                    Warp.TextField(
                        text: Binding(
                            get: { formattedDate(selectedDate) },
                            set: { _ in }
                        ),
                        placeholder: "Select a date",
                        rightIcon: .calendar
                    )
                    .warpDatePicker(date: $selectedDate)
                }
            }, label: {
                Text("Dialog Date Picker")
            })
            
            // Ranged WARP date picker
            GroupBox(content: {
                VStack {
                    Warp.TextField(
                        text: Binding(
                          get: { formattedDate(selectedDate) },
                          set: { _ in }
                        ),
                        placeholder: "Select a date",
                        rightIcon: .calendar
                      )
                    .warpDatePicker(
                        date: $selectedDate,
                        range: Calendar.current.date(byAdding: .day, value: -7, to: Date())!...Calendar.current.date(byAdding: .day, value: 7, to: Date())!
                    )
                }
            }, label: {
                Text("Ranged Dialog Date Picker")
            })

            // WARP inline datepicker
            GroupBox(content: {
                VStack {
                    Warp.DatePicker(
                        date: $selectedDate
                    )
                    .padding()

                    HStack {
                        Spacer()
                        Text("Selected date: \(formattedDate(selectedDate))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Inline Date Picker")
            })
        }
        .padding()
        .navigationTitle("Date Picker")
        .navigationBarTitleDisplayMode(.inline)

    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
