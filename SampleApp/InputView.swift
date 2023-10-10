import SwiftUI
import warp_ios

struct InputView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                WarpInput(title: "WarpInput", text: "")
                Divider()
                WarpInput(title: "DisabledWarpInput", text: "", state: .disabled)
                Divider()
                WarpInput(title: "ErrorWarpInput", text: "", state: .error)
                Divider()
                WarpInput(title: "ReadOnlyWarpInput", text: "", state: .readOnly)
                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    InputView()
}
