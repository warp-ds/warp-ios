import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()

    @State private var presentingPopover = false
    
    @State private var isError = false

    var body: some View {
        ScrollView(showsIndicators: false) {

            // Warp date picker
            GroupBox(content: {
                VStack {
                    if #available(iOS 17.0, *) {
                        Warp.DatePicker(
                            date: $selectedDate,
                            text: Binding(
                                get: { formattedDate(selectedDate) },
                                set: { _ in }
                            ),
                            style: isError ? .error : .default,
                            helpText: isError ? "This is an error" : nil,
                            placeholder: "Select a date"
                        )
                        .onChange(of: selectedDate) { _, newValue in
                            isError = newValue < Date()
                        }
                        .padding()
                    } else {
                        Warp.DatePicker(
                            date: $selectedDate,
                            text: Binding(
                                get: { formattedDate(selectedDate) },
                                set: { _ in }
                            ),
                            style: isError ? .error : .default,
                            helpText: isError ? "This is an error" : nil,
                            placeholder: "Select a date"
                        )
                    }

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
