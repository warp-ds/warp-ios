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
                            dateValidator: validate(date:),
                            helpText: isError ? "This is an error" : nil,
                            placeholder: "Select a date"
                        )
                        .onChange(of: selectedDate) { _, date in
                            isError = !validate(date: date)
                        }
                        .padding()
                    } else {
                        Warp.DatePicker(
                            date: $selectedDate,
                            dateValidator: validate(date:),
                            helpText: "This is an error",
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
                    Warp.DatePicker(
                        style: .inline,
                        date: $selectedDate,
                        dateValidator: validate(date:)
                    )
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

    private func validate(date: Date) -> Bool {
        return date < Date()
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
