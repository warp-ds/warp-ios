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

    fileprivate var name: String {
        let _name = String(describing: self)

        return _name.capitalized
    }
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
extension Warp.ButtonSize: CaseIterable {
    public static var allCases: [Warp.ButtonSize] = [
        .big,
        .small
    ]

    fileprivate var name: String {
        let _name = String(describing: self)

        return _name.capitalized
    }
}

private extension Binding<Bool> {
    func defaultAnimation() -> Binding<Bool> {
        animation(.smooth)
    }
}
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
