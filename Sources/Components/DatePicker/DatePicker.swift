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
