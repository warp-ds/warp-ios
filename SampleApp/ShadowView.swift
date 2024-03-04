import Warp
import SwiftUI

struct ShadowView: View {
    private let colorProvider: ColorProvider = Warp.Config.colorProvider
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
                .shadow(shadow)
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
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension Warp.Shadow {
    fileprivate static var allCases: [Warp.Shadow] = [
        .small,
        .medium,
        .large,
        .xLarge
    ]
    
    fileprivate var name: String {
        switch self {
            case .small:
                return "Small"

            case .medium:
                return "Medium"

            case .large:
                return "Large"

        case .xLarge:
            return "xLarge"
        }
    }
}

#Preview {
    ShadowView()
}
