import Testing
import SnapshotTesting
import SwiftUI
@testable import Warp

@Suite(.disabled(reason: "Snapshot tests are rendered differently on device vs ImageRenderer, needs investigation"))
@MainActor
struct DatePickerSnapshotTests {

    @Test(arguments: Warp.Brand.allCases)
    func snapshotDefaultDatePicker(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView =  Warp.DatePicker(
            date: .constant(fixedDate),
            text: .constant(""),
            style: .default,
            placeholder: "Select a date"
        )
        .padding()
        // Set width to match iPhone 13 size
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView, as: .image, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotErrorDatePicker(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        // Set the theme to the current brand
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView =  Warp.DatePicker(
                    date: .constant(fixedDate),
                    text: .constant(""),
                    style: .error,
                    helpText: "This is an error",
                    placeholder: "Select a date"
                )
                .padding()
                // Set width to match iPhone 13 size
                .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView, as: .image, named: snapshotName)
    }
}
