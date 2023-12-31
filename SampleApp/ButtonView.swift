import SwiftUI
import Warp

extension Warp.ButtonType: CaseIterable {
    public static var allCases: [Warp.ButtonType] = [
        .primary,
        .secondary,
        .tertiary,
        .critical,
        .criticalTertiary,
        .utility,
        .utilityTertiary,
        .utilityOverlay
    ]
}

struct ButtonView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.ButtonType.allCases, id: \.self) { buttonType in
                    createView(for: buttonType)
                }
            }
            .padding(.horizontal)
        }
    }

    private func createView(for buttonType: Warp.ButtonType) -> some View {
        let name = String(describing: buttonType)
        let capitalizedName = name.capitalized

        return GroupBox(
            content: {
                VStack {
                    // Normal
                    Warp.Button.create(
                        for: buttonType,
                        title: "\(capitalizedName) button",
                        icon: Image(systemName: "plus"),
                        action: {}
                    )


                    // Disabled
                    Warp.Button.create(
                        for: buttonType,
                        title: "Disabled \(name) button",
                        action: {},
                        isEnabled: false
                    )
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}

#Preview {
    ButtonView()
}
