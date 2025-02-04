import SwiftUI
import Warp

struct TextFieldView: View {

    @State private var labelTitle = "Description"
    @State private var labelAdditionalInfo = "Optional"
    @State private var showLeftIcon = false
    @State private var showPrefix = false
    @State private var showTooltipImage = true
    @State private var text = ""
    @State private var placeholder = "Enter your text here..."
    @State private var showSuffix = false
    @State private var showRightIcon = false
    @State private var helpTextValue = "This is a Help text."
    @State private var textFieldStyle: Warp.TextFieldStyle = .default

    var body: some View {
        ScrollView(showsIndicators: false) {
            // TextField display with dynamic label and help text
            GroupBox(content: {
                Warp.TextField(
                    title: labelTitle,
                    additionalInformation: labelAdditionalInfo,
                    tooltipContent: showTooltipImage ? createTooltipView : nil,
                    leftIcon: showLeftIcon ? .search : nil,
                    prefix: showPrefix ? "kr" : nil,
                    text: $text,
                    placeholder: placeholder,
                    suffix: showSuffix ? "kr" : nil,
                    rightIcon: showRightIcon ? .close : nil,
                    style: textFieldStyle,
                    helpText: helpTextValue
                )
            }, label: {
                Text("Text Field")
            })
            .padding(.bottom)
            .onTapGesture {
                dismissKeyboard() // Dismiss keyboard when tapping outside
            }

            // Controls to modify TextField's label, help text, and style
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Label title input
                    Warp.TextField(title: "Label Title", text: $labelTitle)
                    Divider()

                    // Additional information input
                    Warp.TextField(title: "Additional Information", text: $labelAdditionalInfo)
                    Divider()

                    // Toggle for showing the tooltip image
                    HStack {
                        Text("Show Tooltip Image")
                        Spacer()
                        Warp.Switch(isOn: $showTooltipImage.animation(.bouncy))
                    }
                    Divider()

                    // TextField style picker
                    VStack(alignment: .leading) {
                        Text("TextField Style")
                        Picker("Style", selection: $textFieldStyle) {
                            ForEach(Warp.TextFieldStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Divider()

                    HStack {
                        Text("Show LeftIcon")
                        Spacer()
                        Warp.Switch(isOn: $showLeftIcon.animation(.bouncy))
                    }
                    Divider()

                    HStack {
                        Text("Show Prefix")
                        Spacer()
                        Warp.Switch(isOn: $showPrefix.animation(.bouncy))
                    }
                    Divider()

                    HStack {
                        Text("Show Suffix")
                        Spacer()
                        Warp.Switch(isOn: $showSuffix.animation(.bouncy))
                    }
                    Divider()

                    HStack {
                        Text("Show Right Icon")
                        Spacer()
                        Warp.Switch(isOn: $showRightIcon.animation(.bouncy))
                    }
                    Divider()

                    // Help text input
                    Warp.TextField(title: "Help Text", text: $helpTextValue)
                }
            }, label: {
                Text("Modify Text Field")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("TextField")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Tooltip view creation
    private var createTooltipView: AnyView {
        AnyView(Warp.Tooltip(title: "Sample tooltip", arrowEdge: .leading))
    }

    // Helper function to dismiss the keyboard
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    TextFieldView()
}
