import SwiftUI

struct DatePickerStyleModifier: ViewModifier {
    var foregroundColor: Color
    var selectionColor: Color

    func body(content: Content) -> some View {
        content
                .foregroundColor(foregroundColor)
                .accentColor(selectionColor)
    }
}

public extension DatePicker {
    func warpDatePicker() -> some View {
        self.modifier(
            DatePickerStyleModifier(
                foregroundColor: Color.blue,
                selectionColor: Color.red
            )
        )
    }
}


