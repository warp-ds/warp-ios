import SwiftUI
import Warp

struct SpinnerView: View {
    var body: some View {
        VStack(spacing: 20) {
            Warp.Spinner(size: .small)
            Warp.Spinner()
            Warp.Spinner(size: .large)
            Warp.Spinner(size: .custom(50))
        }
        .navigationTitle("Spinner")
    }
}

#Preview {
    SpinnerView()
}
