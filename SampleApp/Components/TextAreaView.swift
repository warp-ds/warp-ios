import SwiftUI
import Warp

struct TextAreaView: View {
    
    @State private var labelTitle = "Description"
    @State private var labelAdditionalInfo = "Optional"
    @State private var showTooltipImage = true
    @State private var text = ""
    @State private var placeholder = "Enter your text here..."
    @State private var helpTextValue = "This is a Help text."
    @State private var helpTextStyle: Warp.HelpTextStyle = .default
    @State private var textAreaStyle: Warp.TextAreaStyle = .default
    @State private var minHeight: CGFloat = 120
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // TextArea display with dynamic label and help text
            GroupBox(content: {
                Warp.TextArea(
                    label: Warp.Label(
                        title: labelTitle,
                        additionalInformation: labelAdditionalInfo,
                        showTooltipImage: showTooltipImage,
                        tooltipContent: createTooltipView
                    ),
                    text: $text,
                    placeholder: placeholder,
                    style: textAreaStyle,
                    helpText: Warp.HelpText(text: helpTextValue, style: helpTextStyle),
                    minHeight: minHeight
                )
                .padding(.vertical, 14)
            }, label: {
                Text("Text Area")
            })
            .padding(.bottom)
            .onTapGesture {
                dismissKeyboard() // Dismiss keyboard when tapping outside
            }
            
            // Controls to modify TextArea's label, help text, and style
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Label title input
                    VStack(alignment: .leading) {
                        Text("Label Title")
                        Warp.TextField(text: $labelTitle)
                    }
                    .padding()

                    // Additional information input
                    VStack(alignment: .leading) {
                        Text("Additional Information")
                        Warp.TextField(text: $labelAdditionalInfo)
                    }
                    .padding()

                    // Toggle for showing the tooltip image
                    HStack {
                        Text("Show Tooltip Image")
                            .padding(.leading)
                        Spacer()
                        Toggle(isOn: $showTooltipImage.animation(.bouncy)) {}
                            .padding()
                    }
                    
                    // TextArea style picker
                    VStack(alignment: .leading) {
                        Text("TextArea Style")
                        Picker("Style", selection: $textAreaStyle) {
                            ForEach(Warp.TextAreaStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()

                    // Help text input
                    VStack(alignment: .leading) {
                        Text("Help Text")
                        Warp.TextField(text: $helpTextValue)
                    }
                    .padding()

                    // Help text style picker
                    VStack(alignment: .leading) {
                        Text("Help Text Style")
                        Picker("Help Style", selection: $helpTextStyle) {
                            ForEach(Warp.HelpTextStyle.allCases, id: \.self) { style in
                                Text(style.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding()
                }
            }, label: {
                Text("Modify Text Area")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("TextArea")
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
    TextAreaView()
}
