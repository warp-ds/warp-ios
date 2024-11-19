import Warp
import SwiftUI

struct ShadowView: View {
    private let colorProvider: ColorProvider = Warp.Color
    @State private var shadow = Warp.Shadow.small
    @State private var isPressed = false

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ZStack(alignment: .bottom) {
                    colorProvider.token.background
                    Warp.Text("background", style: .caption)
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
                    Warp.Text(isPressed ? "surfaceElevated200Active" : "surfaceElevated200" , style: .caption)
                }
                .frame(width: 192, height: 192)
                .background(isPressed ? colorProvider.token.surfaceElevated200Active : colorProvider.token.surfaceElevated200)
                .cornerRadius(8)
                .addShadow(shadow, isPressed: $isPressed)
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
