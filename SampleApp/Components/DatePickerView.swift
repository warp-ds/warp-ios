import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()
    @State private var showTimePicker = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            GroupBox(content: {
                Toggle("Show Time Picker", isOn: $showTimePicker)
            }, label: {
                Text("Options")
            })

            GroupBox(content: {
                VStack {
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        displayedComponents: showTimePicker ? [.date, .hourAndMinute] : [.date]
                    )
                    .warpStyle()
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .padding()

                    HStack {
                        Spacer()
                        Text("Selected date: \(formattedDate(selectedDate, includeTime: showTimePicker))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Graphical Date Picker")
            })

            GroupBox(content: {
                VStack {
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        in: Calendar.current.date(byAdding: .day, value: -7, to: Date())!...Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
                        displayedComponents: showTimePicker ? [.date, .hourAndMinute] : [.date]
                    )
                    .warpStyle()
                    .datePickerStyle(.graphical)
                    .labelsHidden()
                    .padding()

                    HStack {
                        Spacer()
                        Text("Selected date: \(formattedDate(selectedDate, includeTime: showTimePicker))")
                        Spacer()
                    }
                }
            }, label: {
                Text("Ranged Graphical Date Picker")
            })

            GroupBox(content: {
                HStack {
                    Text("Date")
                    Spacer()
                    DatePicker(
                        "",
                        selection: $selectedDate,
                        displayedComponents: showTimePicker ? [.date, .hourAndMinute] : [.date]
                    )
                    .warpStyle()
                    .labelsHidden()
                }
            }, label: {
                Text("Compact Date Picker")
            })

            GroupBox(content: {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: showTimePicker ? [.date, .hourAndMinute] : [.date]
                )
                .warpStyle()
                .datePickerStyle(.wheel)
                .labelsHidden()
            }, label: {
                Text("Wheel Date Picker")
            })
        }
        .padding()
        .navigationTitle("Date Picker")
        .navigationBarTitleDisplayMode(.inline)

    }

    private func formattedDate(_ date: Date, includeTime: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = includeTime ? .short : .none
        return formatter.string(from: date)
    }
}
