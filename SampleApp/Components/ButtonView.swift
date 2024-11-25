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
            HStack {
                Warp.Text("Type", style: .bodyStrong)
                Picker("Pick your box style please", selection: $type.animation(.smooth)) {
                    ForEach(Warp.ButtonType.allCases, id: \.self) { type in
                        Text(type.rawValue.capitalized)
                    }
                }
                .pickerStyle(.wheel)
            }
            Divider()
            HStack {
                Warp.Text("Title", style: .bodyStrong)
                Spacer()
                Warp.TextField(text: $buttonTitle)
            }
            Divider()
            createToggle(binding: $buttonHasLeadingIcon, text: ("Hide leadingIcon", "Show leadingIcon"))
            Divider()
            createToggle(binding: $buttonHasTrailingIcon, text: ("Hide trailingIcon", "Show trailingIcon"))
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
            createToggle(binding: $isButtonEnabled, text: ("Disable button", "Enable button"))
            Divider()
            createToggle(binding: $isButtonFullWidth, text: ("Size to fit button", "Full width button"))
            Divider()
            createToggle(binding: $isButtonLoading, text: ("Loading button", "Loading button"))
            Divider()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Button")
        .padding(.horizontal, 20)
    }
    
    private func createToggle(binding: Binding<Bool>, text: (true: String, false: String)) -> some View {
        Toggle(isOn: binding.animation(.smooth)) {
            Warp.Text(binding.wrappedValue ? text.true: text.false, style: .bodyStrong)
        }
        .padding(.trailing, 4)
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
