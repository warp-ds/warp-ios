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

    /// A date picker with a title and optional additional information above it.
    ///
    /// Renders a `Warp.Label` above a native `DatePicker` with `.warpStyle()`.
    /// Apply `.datePickerStyle(_:)` to change the native style. The default is `.compact`.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.DatePicker(
    ///     title: "Date of birth",
    ///     additionalInformation: "Optional",
    ///     selection: $date,
    ///     displayedComponents: [.date]
    /// )
    /// ```
    public struct DatePicker: View {

        // MARK: - Properties

        /// The main title text to display.
        private let title: String

        /// Optional text to display after the title.
        private let additionalInformation: String?

        /// Binding to the selected date.
        @Binding private var selection: Date

        /// An optional range of selectable dates.
        private let range: ClosedRange<Date>?

        /// The date components the picker shows.
        private let displayedComponents: SwiftUI.DatePickerComponents

        // MARK: - Initialization

        /// Creates a new `DatePicker` instance.
        ///
        /// - Parameters:
        ///   - title: The main title text to display. An empty title hides the label.
        ///   - additionalInformation: Optional text to display after the title.
        ///   - selection: Binding to the selected date.
        ///   - range: An optional closed range of selectable dates.
        ///   - displayedComponents: The date components the picker shows.
        public init(
            title: String = "",
            additionalInformation: String? = nil,
            selection: Binding<Date>,
            in range: ClosedRange<Date>? = nil,
            displayedComponents: SwiftUI.DatePickerComponents = [.date, .hourAndMinute]
        ) {
            self.title = title
            self.additionalInformation = additionalInformation
            self._selection = selection
            self.range = range
            self.displayedComponents = displayedComponents
        }

        // MARK: - Body

        public var body: some View {
            VStack(alignment: .leading, spacing: Warp.Spacing.spacing50) {
                if !title.isEmpty {
                    Warp.Label(
                        title: title,
                        additionalInformation: additionalInformation
                    )
                }

                nativeDatePicker
                    .labelsHidden()
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
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 30) {
        Warp.DatePicker(
            title: "Label",
            additionalInformation: "Optional",
            selection: .constant(Date()),
            displayedComponents: [.date]
        )

        Divider()

        Warp.DatePicker(
            title: "Label",
            selection: .constant(Date())
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
