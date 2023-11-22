import SwiftUI
import Warp

struct TypographyView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("Display")
                    .font(WarpTypography.display.font)
                Divider()
                Text("Title 1")
                    .font(WarpTypography.title1.font)
                Divider()
                Text("Title 2")
                    .font(WarpTypography.title2.font)
                Divider()
                Text("Title 3")
                    .font(WarpTypography.title3.font)
                Divider()
                Text("Title 4")
                    .font(WarpTypography.title4.font)
                Divider()
                Text("Title 5")
                    .font(WarpTypography.title5.font)
                Divider()
                Text("Title 6")
                    .font(WarpTypography.title6.font)
                Divider()
                Text("Preamble")
                    .font(WarpTypography.preamble.font)
                Divider()
                Text("Body")
                    .font(WarpTypography.body.font)
                Divider()
                Text("Body Strong")
                    .font(WarpTypography.bodyStrong.font)
                Divider()
                Text("Caption")
                    .font(WarpTypography.caption.font)
                Divider()
                Text("Caption Strong")
                    .font(WarpTypography.captionStrong.font)
                Divider()
                Text("Detail")
                    .font(WarpTypography.detail.font)
                Divider()
                Text("Detail Strong")
                    .font(WarpTypography.detailStrong.font)
                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    InputView()
}
