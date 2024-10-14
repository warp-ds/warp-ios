import SwiftUI
import Warp

struct LabelView: View {
    
    @State private var showTooltipImage = true
    @State private var title = "Title"
    @State private var additionalInformation = "Optional"
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Label display with dynamic title and optional tooltip
            GroupBox(content: {
                HStack {
                    Warp.Label(
                        title: title,
                        additionalInformation: additionalInformation,
                        showTooltipImage: showTooltipImage,
                        tooltipContent: createTooltipView
                    )
                    Spacer()
                }
                .padding(.vertical, 14)
                
            }, label: {
                Text("Label")
            })
            .padding(.bottom)
            
            // Controls to modify the label's title, additional information, and tooltip visibility
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Title input
                    VStack(alignment: .leading) {
                        Text("Title")
                        Warp.TextField(text: $title)
                    }
                    .padding()

                    // Additional information input
                    VStack(alignment: .leading) {
                        Text("Additional Information")
                        Warp.TextField(text: $additionalInformation)
                    }
                    .padding()

                    // Toggle for showing the tooltip image
                    HStack {
                        Text("Show tooltip")
                            .padding(.leading)
                        Spacer()
                        Toggle(isOn: $showTooltipImage.animation(.bouncy)) {}
                            .padding()
                    }
                }
            }, label: {
                Text("Modify Label")
            })
            .padding(.bottom)
        }
        .padding(.horizontal)
        .navigationTitle("Label")
        .navigationBarTitleDisplayMode(.inline)
        .onTapGesture {
            dismissKeyboard() // Dismiss keyboard when tapping outside
        }
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
    LabelView()
}
