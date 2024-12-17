import SwiftUI
import Warp

struct ButtonView: View {
    @State private var type: Warp.ButtonType = .primary

    @State private var buttonTitle = "Title"

    @State private var buttonHasLeadingIcon = false
    
    @State private var buttonHasTrailingIcon = false

    @State private var buttonSize: Warp.ButtonSize = .big

    @State private var isButtonEnabled = true

    @State private var isButtonFullWidth = false
    
    @State private var isButtonLoading = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            createButton()
                .padding()
            Divider()
            GroupBox {
                HStack {
                    Warp.Text("Title", style: .bodyStrong)
                    Spacer()
                    Warp.TextField(text: $buttonTitle)
                }
                Divider()
                createToggle(binding: $buttonHasLeadingIcon, text: "Show leadingIcon")
                Divider()
                createToggle(binding: $buttonHasTrailingIcon, text: "Show trailingIcon")
                Divider()
                HStack {
                    Warp.Text("Type", style: .bodyStrong)
                    Picker("Pick your box style please", selection: $type.animation(.smooth)) {
                        ForEach(Warp.ButtonType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                Divider()
                HStack {
                    Warp.Text("Size", style: .bodyStrong)
                    Spacer()
                    Picker("Pick your box style please", selection: $buttonSize.animation(.interpolatingSpring)) {
                        ForEach(Warp.ButtonSize.allCases, id: \.self) { type in
                            Text(type.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.all, 4)

                }
                Divider()
                createToggle(binding: $isButtonEnabled, text: "Button is enable")
                Divider()
                createToggle(binding: $isButtonFullWidth, text: "Button has full width")
                Divider()
                createToggle(binding: $isButtonLoading, text: "Button is loading")
            } label: {
                Text("Modify Button")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Button")
        .padding(.horizontal, 20)
    }
    
    private func createToggle(binding: Binding<Bool>, text: String) -> some View {
        HStack {
            Warp.Text(text, style: .bodyStrong)
            Spacer()
            Warp.Switch(isOn: binding.animation(.smooth))
        }
    }

    private func createButton() -> some View {
        Warp.Button(
            title: buttonTitle,
            leadingIcon: buttonHasLeadingIcon ? Warp.Icon.plus : nil,
            trailingIcon: buttonHasTrailingIcon ? Warp.Icon.arrowUp : nil,
            action: {},
            type: type,
            size: buttonSize,
            isEnabled: isButtonEnabled,
            fullWidth: isButtonFullWidth,
            isLoading: isButtonLoading
        )
    }
}

#Preview {
    ButtonView()
}
