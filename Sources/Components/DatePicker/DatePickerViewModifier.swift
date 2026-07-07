import SwiftUI

extension Warp {

    struct DatePickerViewModifier: ViewModifier {

        /// The selected date.
        @Binding var date: Date

        /// The range of selectable dates.
        let range: DatePickerRange?

        public func body(content: Content) -> some View {
            content
                .overlay {
                    GeometryReader { proxy in
                        nativeDatePicker
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .scaleEffect(proxy.size)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .contentShape(Rectangle().size(proxy.size))
                        .colorMultiply(.clear)
                    }
                }
                .clipped()
        }

        private var nativeDatePicker: some View {
            switch range {
            case .none:
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    displayedComponents: [.date]
                )
            case .closed(let closedRange):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: closedRange,
                    displayedComponents: [.date]
                )
            case .from(let partialRangeFrom):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: partialRangeFrom,
                    displayedComponents: [.date]
                )
            case .to(let partialRangeThrough):
                return SwiftUI.DatePicker(
                    "",
                    selection: $date,
                    in: partialRangeThrough,
                    displayedComponents: [.date]
                )
            }
        }
    }
}

public extension View {

    /// A view modifier that adds a dialog style WARP date picker to the view.
    /// Note: Applying this modifier will intercept all touch events on the view.
    @available(*, deprecated, message: "Use a native DatePicker with .warpStyle() instead")
    func warpDatePicker(date: Binding<Date>) -> some View {
        modifier(Warp.DatePickerViewModifier(date: date, range: nil))
    }

    @available(*, deprecated, message: "Use a native DatePicker with .warpStyle() instead")
    func warpDatePicker(date: Binding<Date>, range: ClosedRange<Date>) -> some View {
        modifier(Warp.DatePickerViewModifier(date: date, range: .closed(range)))
    }

    @available(*, deprecated, message: "Use a native DatePicker with .warpStyle() instead")
    func warpDatePicker(date: Binding<Date>, range: PartialRangeFrom<Date>) -> some View {
        modifier(Warp.DatePickerViewModifier(date: date, range: .from(range)))
    }

    @available(*, deprecated, message: "Use a native DatePicker with .warpStyle() instead")
    func warpDatePicker(date: Binding<Date>, range: PartialRangeThrough<Date>) -> some View {
        modifier(Warp.DatePickerViewModifier(date: date, range: .to(range)))
    }
}
