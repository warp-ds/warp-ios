import SwiftUI
import Warp

struct HelpTextView: View {
    
    @State private var helpTextValue = "This is a help text."
    @State private var helpTextStyle: Warp.HelpTextStyle = .default
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // HelpText display with dynamic text and style
            GroupBox(content: {
                Warp.HelpText(
                    text: helpTextValue,
                    style: helpTextStyle
                )
                .padding(.vertical, Warp.Spacing.spacing200)
            }, label: {
                Text("Help Text")
            })
            .padding(.bottom)
            
            // Controls to modify HelpText's text and style
            GroupBox(content: {
                VStack(alignment: .leading) {
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
                Text("Modify Help Text")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Help Text")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HelpTextView()
}
