import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite
@MainActor
struct DatePickerSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotInlineDatePicker(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView =  Warp.DatePicker(
            date: .constant(fixedDate)
        )
        .padding()
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView, as: .warpImage, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotInlineRangedDatePicker(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView =  Warp.DatePicker(
            date: .constant(fixedDate),
            range: Calendar.current.date(byAdding: .day, value: -7, to: fixedDate)!...Calendar.current.date(byAdding: .day, value: 7, to: fixedDate)!
        )
        .padding()
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView, as: .warpImage, named: snapshotName)
    }
}
