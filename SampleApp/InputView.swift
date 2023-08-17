import SwiftUI
import Warp_ios

struct InputView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("WarpInput")
                WarpInput(title: "WarpInput", text: "")
                    .padding(.bottom)
                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    InputView()
}
