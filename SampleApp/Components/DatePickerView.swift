import Warp
import SwiftUI

struct DatePickerView: View {

    @State private var selectedDate = Date()
    @State private var showTimePicker = false
    @State private var labelTitle = "Date"
    @State private var labelAdditionalInfo = "Optional"
    @State private var showTooltipImage = true
    @State private var helpTextValue = "This is a Help text."
    @State private var datePickerStyle: Warp.TextFieldStyle = .default

    var body: some View {
        ScrollView(showsIndicators: false) {
            GroupBox(content: {
                Toggle("Show Time Picker", isOn: $showTimePicker)
            }, label: {
                Text("Options")
            })

            // Warp.DatePicker with dynamic label and help text
            GroupBox(content: {
                Warp.DatePicker(
                    title: labelTitle,
                    additionalInformation: labelAdditionalInfo,
                    tooltipContent: showTooltipImage ? createTooltipView : nil,
                    selection: $selectedDate,
                    displayedComponents: showTimePicker ? [.date, .hourAndMinute] : [.date],
                    style: datePickerStyle,
                    helpText: helpTextValue
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            }, label: {
                Text("Warp Date Picker")
            })
            .padding(.bottom)

            // Controls to modify the Warp.DatePicker's label, help text and style
            GroupBox(content: {
                VStack(alignment: .leading) {
                    Warp.TextField(title: "Label Title", text: $labelTitle)
                    Divider()

                    Warp.TextField(title: "Additional Information", text: $labelAdditionalInfo)
                    Divider()

                    HStack {
                        Text("Show Tooltip Image")
                        Spacer()
                        Warp.Switch(isOn: $showTooltipImage.animation(.bouncy))
                    }
                    Divider()

                    VStack(alignment: .leading) {
                        Text("DatePicker Style")
                        Picker("Style", selection: $datePickerStyle) {
                            ForEach(Warp.TextFieldStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Divider()

                    Warp.TextField(title: "Help Text", text: $helpTextValue)
                }
            }, label: {
                Text("Modify Date Picker")
            })
            .padding(.bottom)

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

    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }

    private func formattedDate(_ date: Date, includeTime: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = includeTime ? .short : .none
        return formatter.string(from: date)
    }
}
