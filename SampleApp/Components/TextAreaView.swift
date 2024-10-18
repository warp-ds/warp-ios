import SwiftUI
import Warp

struct TextAreaView: View {
    
    @State private var title = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Label display with dynamic title and optional tooltip
            GroupBox(content: {
                VStack {
                    HStack {
                        Warp.TextArea(text: $title, placeholder: "Hints...", minHeight: 50)
                            .frame(maxHeight: 130)
                        Spacer()
                        
                    }
                    .padding(.vertical, 14)
                    
                    HStack {
                        Warp.TextArea(text: $title, placeholder: "Hints...", style: .error, minHeight: 120)
                        Spacer()
                        
                    }
                    .padding(.vertical, 14)
                    
                    
                    HStack {
                        Warp.TextArea(text: $title, placeholder: "Hints...", style: .error, helpText: Warp.HelpText(text: "Help Text", style: .error))
                        Spacer()
                        
                    }
                    .padding(.vertical, 14)
                    
                    HStack {
                        Warp.TextArea(text: $title, placeholder: "Hints...", style: .readOnly, helpText: Warp.HelpText(text: "Help Text", style: .error))
                        Spacer()
                        
                    }
                    .padding(.vertical, 14)
                    
                    HStack {
                        Warp.TextArea(text: $title, placeholder: "Hints...", style: .disabled, helpText: Warp.HelpText(text: "Help Text", style: .disabled))
                        Spacer()
                        
                    }
                    .padding(.vertical, 14)
                }
         
                
            }, label: {
                Text("Label")
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
    TextAreaView()
}
