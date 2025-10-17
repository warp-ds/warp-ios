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

        enum PickerStyle {
            case automatic
            case menu
            case wheel
        }

        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color

        @Binding private var selectedOption: Warp.Select.SelectorOption?
        private let options: [Warp.Select.SelectorOption]
        private let title: String
        private let additionalInformation: String?
        private let tooltipContent: AnyView?
        private let prefix: String? = nil
        private let placeholder: String
        private let suffix: String? = nil
        private let style: Warp.TextFieldStyle
        private let helpText: String?
        private let pickerStyle: PickerStyle

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
            self._selectedOption = selectedOption
            self.options = options
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self.placeholder = placeholder
            self.style = style
            self.helpText = helpText
            self.pickerStyle = .automatic
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
        
        @ViewBuilder
        private var nativePicker: some View {
            let picker = Picker("Select an option", selection: Binding<String>(
                get: { selectedOption?.id ?? options.first?.id ?? "" },
                set: { newValue in
                    selectedOption = options.first { $0.id == newValue }
                }
            )) {
                ForEach(options, id: \.id) { option in
                    SwiftUI.Text(option.title)
                      .tag(option.id)
                      .font(from: Warp.Typography.body)
                      .foregroundColor(textColor)
                }
            }

            switch pickerStyle {
            case .automatic:
                picker.pickerStyle(.automatic)
            case .menu:
                picker.pickerStyle(.menu)
            case .wheel:
                picker.pickerStyle(.wheel)
            }
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
      
