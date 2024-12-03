import Warp
import SwiftUI

struct ShadowView: View {
    private let colorProvider: ColorProvider = Warp.Color
    @State private var shadow = Warp.Shadow.small

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    colorProvider.token.surfaceElevated100
                    Warp.Text("surfaceElevated100", style: .caption)
                        .padding(.bottom)
                }
                ZStack(alignment: .top) {
                    colorProvider.token.surfaceSunken
                    Warp.Text("surfaceSunken", style: .caption)
                        .padding(.top)
                }
            }
            .ignoresSafeArea()
            VStack {
                VStack {
                    Warp.Text("surfaceElevated200", style: .caption)
                }
                .frame(width: 192, height: 192)
                .background(colorProvider.token.surfaceElevated200)
                .cornerRadius(8)
                .addShadow(shadow)
                Spacer()
                Picker("Pick your shadow", selection: $shadow.animation(.interpolatingSpring)) {
                    ForEach(Warp.Shadow.allCases, id: \.self) { shadow in
                        Text(shadow.name)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
            }
        }
        .navigationTitle("Shadow")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ShadowView()
}
