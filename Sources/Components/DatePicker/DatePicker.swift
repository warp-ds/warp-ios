import SwiftUI

extension Warp {

    struct DatePickerStyleModifier: ViewModifier {

        @Environment(\.warpTheme) private var theme

        public func body(content: Content) -> some View {
            content
                .tint(theme.token.backgroundPrimary)
        }
    }
}

extension Warp {

    /// A date picker component with an optional title, additional information and help text.
    ///
    /// The `Warp.DatePicker` component renders a `Warp.Label` above a native `DatePicker` that has `.warpStyle()` applied. It works like `Warp.TextField` for the title, `additionalInformation`, tooltip and help text. It reuses `Warp.TextFieldStyle` for the `.default`, `.disabled`, `.error` and `.readOnly` states.
    ///
    /// The native picker style is not set here. The default is `.compact`. Apply `.datePickerStyle(_:)` to a `Warp.DatePicker` to change it.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.DatePicker(
    ///     title: "Date of birth",
    ///     additionalInformation: "Optional",
    ///     selection: $date,
    ///     displayedComponents: [.date],
    ///     helpText: "Pick a date."
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - title: The main title text to display. An empty title hides the label.
    ///   - additionalInformation: Optional text to display after the title.
    ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
    ///   - selection: Binding to the selected date.
    ///   - range: An optional closed range of selectable dates.
    ///   - displayedComponents: The date components the picker shows.
    ///   - style: The style of the date picker. Options are `.default`, `.disabled`, `.error`, and `.readOnly`.
    ///   - helpText: Optional `String` to display below the date picker.
    public struct DatePicker: View {

        // MARK: - Properties

        /// The main title text to display.
        private let title: String

        /// Optional text to display after the title.
        private let additionalInformation: String?

        /// An optional view to display when the tooltip icon is tapped.
        private let tooltipContent: AnyView?

        /// Binding to the selected date.
        @Binding private var selection: Date

        /// An optional range of selectable dates.
        private let range: ClosedRange<Date>?

        /// The date components the picker shows.
        private let displayedComponents: SwiftUI.DatePickerComponents

        /// The style of the date picker.
        private let style: Warp.TextFieldStyle

        /// Optional `String` to display below the date picker.
        private let helpText: String?

        // MARK: - Initialization

        /// Creates a new `DatePicker` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display. An empty title hides the label.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - tooltipContent: An optional view to display when the tooltip icon is tapped.
        ///   - selection: Binding to the selected date.
        ///   - range: An optional closed range of selectable dates. Defaults to no limit.
        ///   - displayedComponents: The date components the picker shows. Defaults to `[.date, .hourAndMinute]`, as in SwiftUI.
        ///   - style: The style of the date picker. Defaults to `.default`.
        ///   - helpText: Optional `String` to display below the date picker.
        public init(
            title: String = "",
            additionalInformation: String? = nil,
            tooltipContent: AnyView? = nil,
            selection: Binding<Date>,
            in range: ClosedRange<Date>? = nil,
            displayedComponents: SwiftUI.DatePickerComponents = [.date, .hourAndMinute],
            style: Warp.TextFieldStyle = .default,
            helpText: String? = nil
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self.tooltipContent = tooltipContent
            self._selection = selection
            self.range = range
            self.displayedComponents = displayedComponents
            self.style = style
            self.helpText = helpText
        }

        // MARK: - Body

        public var body: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing50) {
                if !title.isEmpty {
                    Warp.Label(
                        title: title,
                        additionalInformation: additionalInformation,
                        tooltipContent: tooltipContent
                    )
                }

                nativeDatePicker
                    .labelsHidden()
                    .disabled(style == .disabled || style == .readOnly)

                if let helpText = helpText {
                    Warp.HelpText(text: helpText, style: helpTextStyle)
                }
            }
        }

        // MARK: - Subviews

        /// The native picker, with or without a date range.
        @ViewBuilder
        private var nativeDatePicker: some View {
            if let range {
                SwiftUI.DatePicker(
                    title,
                    selection: $selection,
                    in: range,
                    displayedComponents: displayedComponents
                )
                .warpStyle()
            } else {
                SwiftUI.DatePicker(
                    title,
                    selection: $selection,
                    displayedComponents: displayedComponents
                )
                .warpStyle()
            }
        }

        // MARK: - Computed Properties

        private var helpTextStyle: Warp.HelpTextStyle {
            switch style {
            case .default, .readOnly:
                return .default
            case .disabled:
                return .disabled
            case .error:
                return .error
            }
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 30) {
        Warp.DatePicker(
            title: "Label",
            additionalInformation: "Optional",
            tooltipContent: AnyView(
                Warp.Tooltip(title: "It's an optional field", arrowEdge: .leading)
            ),
            selection: .constant(Date()),
            displayedComponents: [.date],
            helpText: "Help text"
        )

        Divider()

        Warp.DatePicker(
            title: "Label",
            selection: .constant(Date()),
            style: .disabled,
            helpText: "Help text"
        )

        Divider()

        Warp.DatePicker(
            title: "Label",
            selection: .constant(Date()),
            displayedComponents: [.date],
            style: .error,
            helpText: "Error occurred."
        )

        Divider()

        Warp.DatePicker(
            title: "Label",
            selection: .constant(Date()),
            style: .readOnly,
            helpText: "Read-only field."
        )
    }
    .padding(Warp.Spacing.spacing200)
}

public extension DatePicker {

    /// Applies WARP theming to a native `DatePicker`.
    ///
    /// **Usage:**
    /// ```swift
    /// DatePicker("", selection: $date, displayedComponents: [.date])
    ///     .warpStyle()
    ///     .datePickerStyle(.graphical)
    ///     .labelsHidden()
    /// ```
    func warpStyle() -> some View {
        modifier(Warp.DatePickerStyleModifier())
    }
}
