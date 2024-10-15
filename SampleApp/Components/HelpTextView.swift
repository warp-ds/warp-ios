import SwiftUI
import Warp

struct HelpTextView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Display different styles of HelpText inside a GroupBox
            GroupBox(content: {
                VStack(spacing: 30) {
                    Warp.HelpText(text: "Default style", style: .default)

                    Divider()

                    Warp.HelpText(text: "Disabled style", style: .disabled)

                    Divider()

                    Warp.HelpText(text: "Error style", style: .error)
                }
                .padding(.top, 30)
                .padding()
            }, label: {
                Text("HelpText")
            })
        }
        .padding(.horizontal)
        .navigationTitle("HelpText")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    HelpTextView()
}
