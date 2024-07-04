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
                    VStack {
                        Warp.Text("surfaceSunken", style: .caption)
                            .padding(.top)
                        ZStack {
                            ShadowUIView(shadow: $shadow)
                            Warp.Text("UIKit", style: .caption)
                        }
                        .frame(width: 192, height: 192)
                        .padding(.top)
                    }
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
        .navigationTitle("Shadow")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ShadowUIView: UIViewRepresentable {
    @Binding var shadow: Warp.Shadow

    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.dropShadow(shadow)
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
