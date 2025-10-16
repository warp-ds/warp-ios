import SwiftUI

extension Warp {

    public struct Select: View {

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        @Binding var selectedOption: Warp.Select.SelectorOption?
        let options: [Warp.Select.SelectorOption]
        let title: String
        let additionalInformation: String?
        let tooltipContent: AnyView?
        let leftIcon: Warp.Icon?
        let prefix: String?
        let placeholder: String
        let suffix: String?
        let style: Warp.TextFieldStyle
        let helpText: String?

        public init(
            selectedOption: Binding<Warp.Select.SelectorOption?>,
            options: [Warp.Select.SelectorOption],
            placeholder: String = "",
            title: String = "",
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            prefix: String? = nil,
            suffix: String? = nil,
            style: Warp.TextFieldStyle = .default,
            helpText: String? = nil
        ) {
            self._selectedOption = selectedOption
            self.options = options
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self.leftIcon = nil
            self.prefix = prefix
            self.placeholder = placeholder
            self.suffix = suffix
            self.style = style
            self.helpText = helpText
        }

        @State private var textInputWidth: CGFloat = 0
        @State private var pickerWidth: CGFloat = 0

        public var body: some View {
            textInput
              .measureWidth($textInputWidth)
              .overlay {
                  nativePicker
                    .measureWidth($pickerWidth)
                    .scaleEffect(x: (textInputWidth / pickerWidth) * 1.2, y: 1.1)
                    .offset(y: title.isEmpty ? -10 : 0)
                    .disabled(style == .disabled || style == .readOnly)
                    .colorMultiply(.clear)
              }
              .clipped()
        }

        private var textInput: some View {
            Warp.TextField(
                title: title,
                additionalInformation: additionalInformation,
                tooltipContent: tooltipContent,
                prefix: prefix,
                text: Binding(
                    get: { selectedOption?.title ?? "" },
                    set: { _ in }
                ),
                placeholder: placeholder,
                suffix: suffix,
                rightIcon: .chevronDown,
                style: style,
                helpText: helpText
            )
            .disableEditing(true)
        }

        private var nativePicker: some View {
            Picker("Select an option", selection: Binding<String>(
                get: { selectedOption?.id ?? options.first!.id },
                set: { newValue in
                    selectedOption = options.first { $0.id == newValue }
                }
            ), content: {
                ForEach(options, id: \.id) { option in
                    SwiftUI.Text(option.title)
                      .tag(option.id)
                      .font(from: Warp.Typography.body)
                      .foregroundColor(textColor)
                }
            }
            )
        }

        /// Determines the text color based on the style and focus state.
        private var textColor: Color {
            switch style {
            case .default, .readOnly:
                return colorProvider.token.text
            case .disabled:
                return colorProvider.token.textDisabled
            case .error:
                return colorProvider.token.text
            }
        }
    }
}
      
