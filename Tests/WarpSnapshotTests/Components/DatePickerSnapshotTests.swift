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
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView = DatePicker(
            "",
            selection: .constant(fixedDate),
            displayedComponents: [.date]
        )
        .warpStyle()
        .datePickerStyle(.graphical)
        .labelsHidden()
        .padding()
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView.warpTheme(brand), as: .warpImage, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotInlineRangedDatePicker(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let datePickerView = DatePicker(
            "",
            selection: .constant(fixedDate),
            in: Calendar.current.date(byAdding: .day, value: -7, to: fixedDate)!...Calendar.current.date(byAdding: .day, value: 7, to: fixedDate)!,
            displayedComponents: [.date]
        )
        .warpStyle()
        .datePickerStyle(.graphical)
        .labelsHidden()
        .padding()
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView.warpTheme(brand), as: .warpImage, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotInlineDatePickerWithTime(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15, hour: 9, minute: 41))!

        let datePickerView = DatePicker(
            "",
            selection: .constant(fixedDate),
            displayedComponents: [.date, .hourAndMinute]
        )
        .warpStyle()
        .datePickerStyle(.graphical)
        .labelsHidden()
        .padding()
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: datePickerView.warpTheme(brand), as: .warpImage, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotWarpDatePickerWithAdditionalInformation(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15, hour: 9, minute: 41))!

        let view = Warp.DatePicker(
            title: "Date",
            additionalInformation: "Optional",
            selection: .constant(fixedDate)
        )
        .padding(8)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: view.warpTheme(brand), as: .warpImage, named: snapshotName)
    }

    @Test(arguments: Warp.Brand.allCases)
    func snapshotWarpDatePickerWithTitleOnly(brand: Warp.Brand) {
        let snapshotName = ".\(brand.description)"
        Warp.Theme = brand
        let fixedDate = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 15))!

        let view = Warp.DatePicker(
            title: "Date",
            selection: .constant(fixedDate),
            displayedComponents: [.date]
        )
        .padding(8)
        .frame(width: ViewImageConfig.iPhone13.size!.width)

        assertSnapshot(of: view.warpTheme(brand), as: .warpImage, named: snapshotName)
    }
}
