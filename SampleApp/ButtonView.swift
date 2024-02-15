import SwiftUI
import Warp

    private func createButton() -> some View {
        Warp.Button.create(
            for: type,
            title: buttonTitle,
            icon: buttonHasIcon ? Image(systemName: "plus"): nil,
            action: {},
            size: buttonSize,
            isEnabled: isButtonEnabled,
            fullWidth: isButtonFullWidth
        )
    }
}

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

private extension View {
    func textFieldDefaultOverlay(basedOn colorScheme: ColorScheme) -> some View {
        overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(colorScheme == .dark ? Color.white: Color.gray.opacity(0.5), lineWidth: 1)
        }
    }

    func defaultPadding() -> some View {
        padding(.all, 8)
    }
}

#Preview {
    ButtonView()
}
