import SwiftUI

extension Warp {

    /// The Select component allows users to choose one option from a dropdown list.
    /// It supports various customization options including labels, prefixes, suffixes, and styles.
    /// 
    /// **Usage:**
    /// ```swift
    /// Warp.Select(
    ///     selectedOption: $selectedOption,
    ///     options: options,
    ///     placeholder: "Select an option",
    ///     title: "Select Option",
    ///     additionalInformation: "Additional info",
    ///     style: .default,
    ///     helpText: "This field is required."
    /// )
    /// ```
    /// Warning: The options array should not be empty to ensure proper functionality.
    public struct Select: View {

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        @Binding private var selectedOption: Warp.Select.SelectorOption
        private let options: [Warp.Select.SelectorOption]
        private let title: String
        private let additionalInformation: String?
        private let tooltipContent: AnyView?
        private let placeholder: String
        private let style: Warp.TextFieldStyle
        private let helpText: String?

        /// Creates a Select component with various customization options.
        /// - Parameters:
        ///  - selectedOption: Binding to the currently selected option.
        ///  - options: Array of options to display in the select dropdown.
        ///  - placeholder: Placeholder text when no option is selected.
        ///  - title: Label text displayed above the select field.
        ///  - additionalInformation: Optional additional information displayed next to the label.
        ///  - tooltipContent: Optional view to display as a tooltip next to the label.
        ///  - style: Visual style of the select field (default, disabled, readOnly,error). Default is `.default`.
        ///  - helpText: Optional help text displayed below the select field.
        public init(
            selectedOption: Binding<Warp.Select.SelectorOption?>,
            options: [Warp.Select.SelectorOption],
            placeholder: String = "",
            title: String = "",
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            style: Warp.TextFieldStyle = .default,
            helpText: String? = nil
        ) {
            self._selectedOption = Binding<Warp.Select.SelectorOption>(
                get: {
                    selectedOption.wrappedValue ?? Warp.Select.SelectorOption(placeholder: placeholder)
                },
                set: { newOption in
                    guard newOption.id != Warp.Select.SelectorOption.placeholderId else {
                        selectedOption.wrappedValue = nil
                        return
                    }
                    selectedOption.wrappedValue = newOption
                }
            )
            self.options = [Warp.Select.SelectorOption(placeholder: placeholder)] + options
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self.placeholder = placeholder
            self.style = style
            self.helpText = helpText
        }

        @State private var textInputWidth: CGFloat = 1
        @State private var pickerWidth: CGFloat = 1

        public var body: some View {
            textInput
              .measureWidth($textInputWidth)
              .overlay {
                  VStack {
                      nativePicker
                        .measureWidth($pickerWidth)
                        .scaleEffect(x: ((textInputWidth / pickerWidth) * 1.2) * 2, y: 1.1)
                        .offset(y: title.isEmpty ? -10 : 0)
                        .offset(x: -(textInputWidth/2) + Warp.Spacing.spacing150)
                        .disabled(style == .disabled || style == .readOnly)
                        .colorMultiply(.clear)
                  }
                  .clipped()
              }
        }

        private var textInput: some View {
            Warp.TextField(
                title: title,
                additionalInformation: additionalInformation,
                tooltipContent: tooltipContent,
                prefix: nil,
                text: Binding(
                    get: {
                        selectedOption.id == Warp.Select.SelectorOption.placeholderId ? "" : selectedOption.title
                    },
                    set: { _ in }
                ),
                placeholder: placeholder,
                suffix: nil,
                rightIcon: style != .readOnly ? .chevronDown : nil,
                style: style,
                helpText: helpText
            )
            .disableEditing(true)
        }
        
        @ViewBuilder
        private var nativePicker: some View {
            let picker = Picker("Select an option", selection: Binding<String>(
                get: { selectedOption.id },
                set: { newValue in
                    selectedOption = options.first { $0.id == newValue } ?? .init(placeholder: placeholder)
                }
            )) {
                ForEach(options, id: \.id) { option in
                    Text(option.title, style: .body)
                        .tag(option.id)
                }
            }

            picker.pickerStyle(.menu)
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

struct Select_Previews: PreviewProvider {
    @State static var selectedOption: Warp.Select.SelectorOption? = nil

    static var options: [Warp.Select.SelectorOption] = [
        Warp.Select.SelectorOption(id: "1", title: "Option 1 Option"),
        Warp.Select.SelectorOption(id: "2", title: "Option 2 Option Option Option"),
        Warp.Select.SelectorOption(id: "3", title: "Option 3 Option Option Option Option")
    ]

    static var previews: some View {
        VStack(spacing: 20) {
            Warp.Select(
                selectedOption: $selectedOption,
                options: options,
                placeholder: "Select an option",
                title: "Select Option",
                additionalInformation: "Additional info",
                style: .default,
                helpText: "This field is required."
            )

            Warp.Select(
                selectedOption: $selectedOption,
                options: options,
                placeholder: "Select an option",
                title: "Select Option",
                style: .disabled,
                helpText: "This field is disabled."
            )

            Warp.Select(
                selectedOption: $selectedOption,
                options: options,
                placeholder: "Select an option",
                title: "Select Option",
                style: .error,
                helpText: "There was an error with your selection."
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
      
