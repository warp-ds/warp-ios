import SwiftUI
import Warp

            GroupBox(
                content: {
                    TextField("Write the desired title", text: $buttonTitle)
                        .defaultPadding()
                        .textFieldDefaultOverlay(basedOn: colorScheme)
                }, label: {
                    Text("Title")
                }
            )

            GroupBox(
                content: {
                    Toggle(isOn: $buttonHasIcon.animation(.bouncy)) {
                        HStack {
                            Text(buttonHasIcon ? "Hide icon": "Show icon")

                            Spacer()
                        }
                    }
                    .defaultPadding()
                }, label: {
                    Text("Icon")
                }
            )

            GroupBox(
                content: {
                    Picker("Pick your box style please", selection: $buttonSize.animation(.interpolatingSpring)) {
                        ForEach(Warp.ButtonSize.allCases, id: \.self) { type in
                            Text(type.name)
                        }
                    }
                    .pickerStyle(.segmented)
                    .defaultPadding()
                }, label: {
                    Text("Size")
                }
            )

            GroupBox(
                content: {
                    Toggle(isOn: $isButtonEnabled.defaultAnimation()) {
                        HStack {
                            Text(isButtonEnabled ? "Disable button": "Enable button")

                            Spacer()
                        }
                    }
                    .defaultPadding()
                }, label: {
                    Text("Enabled/Disable")
                }
            )

            GroupBox(
                content: {
                    Toggle(isOn: $isButtonFullWidth.defaultAnimation()) {
                        HStack {
                            Text(isButtonFullWidth ? "Size to fit button": "Full width button")

                            Spacer()
                        }
                    }
                    .defaultPadding()
                }, label: {
                    Text("Button width")
                }
            )
        }
        .padding(.horizontal, 20)
    }

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
