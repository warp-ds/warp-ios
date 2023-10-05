import Foundation
import SwiftUI

extension Warp.Input {
    /// <#Description#>
    public static func createDecimalTextField(
        text: Binding<String>,
        leftSymbol: String? = nil,
        rightSymbol: String? = nil,
        colorProvider: ColorProvider = Config.colorProvider
    ) -> some View {
        let configuration: Warp.InputConfiguration = .decimal(
            leftSymbol: leftSymbol,
            rightSymbol: rightSymbol
        )
        let constantState: Warp.InputState = .normal

        return Warp.Input(
            config: configuration,
            text: text,
            state: .constant(constantState),
            colorProvider: colorProvider
        )
        .keyboardType(.decimalPad)
    }

    /// <#Description#>
    public static func createSearchTextField(
        text: Binding<String>,
        colorProvider: ColorProvider = Config.colorProvider
    ) -> some View {
        let configuration: Warp.InputConfiguration = .searchTextField
        let constantState: Warp.InputState = .normal

        let textField = createWithDiscardButton(
            configuration: configuration,
            text: text,
            state: .constant(constantState)
        )

        return textField
            .submitLabel(.search)
            .accessibilityAddTraits(.isSearchField)
    }

    /// <#Description#>
    public static func createPasswordTextField(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        isSecured: Binding<Bool>,
        colorProvider: ColorProvider = Config.colorProvider
    ) -> some View {
        var configuration = configuration

        let showHideButton = SwiftUI.Button(
            action: {
                let toggle = {
                    isSecured.wrappedValue.toggle()
                }

                if configuration.isAnimated {
                    withAnimation(.easeInOut) {
                        toggle()
                    }
                } else {
                    toggle()
                }
            }, label: {
                let showImage = "eye"
                let hideImage = "eye.slash"

                Image(systemName: isSecured.wrappedValue ? showImage: hideImage)
                    .resizable()
                    .scaledToFit()
            }
        )

        configuration.rightView = AnyView(showHideButton)

        return Group {
            if isSecured.wrappedValue {
                SecureField(configuration.placeholder, text: text)
                    .textFieldStyle(
                        .warp(
                            configuration: configuration,
                            text: text,
                            state: state,
                            colorProvider: colorProvider
                        )
                    )
                    .textContentType(.password)
                    .accessibilityRepresentation {
                        SecureField(configuration.placeholder, text: text)
                    }
            } else {
                Warp.Input(
                    config: configuration,
                    text: text,
                    state: state,
                    colorProvider: colorProvider
                )
                .textContentType(.password)
                .keyboardType(.asciiCapable)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
            }
        }
    }

    /// <#Description#>
    public static func createWithDiscardButton(
        configuration: Warp.InputConfiguration,
        text: Binding<String>,
        state: Binding<Warp.InputState>,
        colorProvider: ColorProvider = Config.colorProvider
    ) -> Warp.Input {
        var configuration = configuration

        let clearButton = SwiftUI.Button(
            action: {
                text.wrappedValue = ""
            }, label: {
                Image(systemName: "xmark.circle")
                    .resizable()
            }
        )

        if !text.wrappedValue.isEmpty {
            configuration.rightView = AnyView(clearButton)
        } else {
            configuration.rightView = nil
        }

        return Warp.Input(
            config: configuration,
            text: text,
            state: state,
            colorProvider: colorProvider
        )
    }
}

private struct InputVariantsPreview: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
