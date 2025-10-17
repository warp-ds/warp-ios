import SwiftUI
import Warp

struct SelectView: View {

    @State private var labelTitle = "Select Option"
    @State private var labelAdditionalInfo = "Optional"
    @State private var showPrefix = false
    @State private var showTooltipImage = true
    @State private var selectedOption: Warp.Select.SelectorOption? = nil
    @State private var options = [
        Warp.Select.SelectorOption(id: "1", title: "Option 1"),
        Warp.Select.SelectorOption(id: "2", title: "Option 2"),
        Warp.Select.SelectorOption(id: "3", title: "Option 3")
    ]
    @State private var showSuffix = false
    @State private var helpTextValue = "This is a Help text."
    @State private var selectStyle: Warp.TextFieldStyle = .default
    @State private var placeholder = "Select an option..."

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Select display with dynamic label and help text
            GroupBox(content: {
                Warp.Select(
                    selectedOption: $selectedOption,
                    options: options,
                    placeholder: placeholder,
                    title: labelTitle,
                    additionalInformation: labelAdditionalInfo,
                    tooltipContent: showTooltipImage ? createTooltipView : nil,
                    style: selectStyle,
                    helpText: helpTextValue
                )
            }, label: {
                Text("Select")
            })
            .padding(.bottom)

            // Controls to modify Select's label, help text, and style
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Label title input
                    Warp.TextField(title: "Label Title", text: $labelTitle)
                    Divider()

                    // Additional information input
                    Warp.TextField(title: "Additional Information", text: $labelAdditionalInfo)
                    Divider()

                    // Select style picker
                    VStack(alignment: .leading) {
                        Text("Select Style")
                        Picker("Style", selection: $selectStyle) {
                            ForEach(Warp.TextFieldStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Divider()

                    // Help text input
                    Warp.TextField(title: "Help Text", text: $helpTextValue)
                }
            }, label: {
                Text("Modify Select")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Select")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Tooltip view creation
    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }
}

#Preview {
    SelectView()
}
