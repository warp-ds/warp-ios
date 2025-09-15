import SwiftUI

extension Warp {
    /// A range of selectable dates for the `DatePicker` component.
    enum DatePickerRange {
        /// A closed range of dates.
        case closed(ClosedRange<Date>)
        /// A partial range of dates starting from a specific date.
        case from(PartialRangeFrom<Date>)
        /// A partial range of dates up to a specific date.
        case to(PartialRangeThrough<Date>)
    }
}
