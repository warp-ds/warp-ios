import XCTest
import struct SwiftUI.Font
import struct SwiftUI.Text
@testable import Warp

@preconcurrency @MainActor
final class TypographyFactorySmokeTests: XCTestCase {
    private typealias TypographyFactory = Warp.Button.TypographyFactory

    func testFonts_Parameterized_ShouldBeEqual() throws {
        let calloutFont = Warp.Typography.title4.font
        let captionFont = Warp.Typography.detailStrong.font

        let typesWithExpectations: [(type: Warp.ButtonType, expectedFont: Font)] = [
            (.primary, calloutFont),
            (.secondary, calloutFont),
            (.tertiary, calloutFont),

            (.critical, calloutFont),
            (.criticalTertiary, calloutFont),

            (.utility, captionFont),
            (.utilityTertiary, captionFont),
            (.utilityOverlay, captionFont)
        ]

//        typesWithExpectations.forEach { typeWithExpectation in
//            let sut = TypographyFactory(for: typeWithExpectation.type)
//
//            XCTAssertEqual(sut.font, typeWithExpectation.expectedFont)
//        }
    }

    func testFontWeight_Parameterized_ShouldBeEqual() throws {
        let mediumFontWeight = Font.Weight.medium
        let regularFontWeight = Font.Weight.regular

        let typesWithExpectations: [(type: Warp.ButtonType, expectedFontWeight: Font.Weight)] = [
            (.primary, mediumFontWeight),
            (.secondary, mediumFontWeight),
            (.tertiary, mediumFontWeight),

            (.critical, mediumFontWeight),
            (.criticalTertiary, mediumFontWeight),

            (.utility, regularFontWeight),
            (.utilityTertiary, regularFontWeight),
            (.utilityOverlay, regularFontWeight)
        ]

//        typesWithExpectations.forEach { typeWithExpectation in
//            let sut = TypographyFactory(for: typeWithExpectation.type)
//
//            XCTAssertEqual(sut.fontWeight, typeWithExpectation.expectedFontWeight)
//        }
    }

    func testLineLimit_Parameterized_ShouldBeEqual() {
        let onlyOneLineLimit = 1

        let typesWithExpectations: [(type: Warp.ButtonType, expectedLineLimit: Int)] = [
            (.primary, onlyOneLineLimit),
            (.secondary, onlyOneLineLimit),
            (.tertiary, onlyOneLineLimit),

            (.critical, onlyOneLineLimit),
            (.criticalTertiary, onlyOneLineLimit),

            (.utility, onlyOneLineLimit),
            (.utilityTertiary, onlyOneLineLimit),
            (.utilityOverlay, onlyOneLineLimit)
        ]

//        typesWithExpectations.forEach { typeWithExpectation in
//            let sut = TypographyFactory(for: typeWithExpectation.type)
//
//            XCTAssertEqual(sut.lineLimit, typeWithExpectation.expectedLineLimit)
//        }
    }

    func testTruncationMode_Parameterized_ShouldBeEqual() {
        let middleTruncationMode = Text.TruncationMode.middle

        let typesWithExpectations: [(type: Warp.ButtonType, expectedTruncationMode: Text.TruncationMode)] = [
            (.primary, middleTruncationMode),
            (.secondary, middleTruncationMode),
            (.tertiary, middleTruncationMode),

            (.critical, middleTruncationMode),
            (.criticalTertiary, middleTruncationMode),

            (.utility, middleTruncationMode),
            (.utilityTertiary, middleTruncationMode),
            (.utilityOverlay, middleTruncationMode)
        ]

//        typesWithExpectations.forEach { typeWithExpectation in
//            let sut = TypographyFactory(for: typeWithExpectation.type)
//
//            XCTAssertEqual(sut.truncationMode, typeWithExpectation.expectedTruncationMode)
//        }
    }
}
