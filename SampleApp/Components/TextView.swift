import SwiftUI
import Warp

#if swift(<6.0)
@preconcurrency @MainActor
#endif
struct TextView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.TextStyle.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 10) {
                    createView(for: variant)
                    Divider()
                }
                .padding(.vertical, 4)
            }
            .padding()
        }
        .navigationTitle("Text")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func createView(for style: Warp.TextStyle) -> some View {
        Warp.Text(String(describing: style).capitalized, style: style)
    }
}

#Preview {
    TextView()
}
