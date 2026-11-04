import XCTest
@testable import Warp

final class ButtonTypeTests: XCTestCase {
    func testAllCases_ListsNegativeTypesInPlaceOfCriticalTypes() {
        XCTAssertEqual(
            Warp.ButtonType.allCases,
            [.primary, .secondary, .quiet, .negative, .negativeQuiet, .utility, .utilityQuiet, .utilityOverlay]
        )
    }

    func testRawValue_NegativeTypes_UseNewNames() {
        XCTAssertEqual(Warp.ButtonType.negative.rawValue, "negative")
        XCTAssertEqual(Warp.ButtonType.negativeQuiet.rawValue, "negativeQuiet")
    }

    func testInitRawValue_NewNames_ReturnNegativeTypes() {
        XCTAssertEqual(Warp.ButtonType(rawValue: "negative"), .negative)
        XCTAssertEqual(Warp.ButtonType(rawValue: "negativeQuiet"), .negativeQuiet)
    }

    func testInitRawValue_LegacyCriticalNames_ReturnNegativeTypes() {
        XCTAssertEqual(Warp.ButtonType(rawValue: "critical"), .negative)
        XCTAssertEqual(Warp.ButtonType(rawValue: "criticalQuiet"), .negativeQuiet)
    }

    func testInitRawValue_EveryCase_RoundTrips() {
        for type in Warp.ButtonType.allCases {
            XCTAssertEqual(Warp.ButtonType(rawValue: type.rawValue), type)
        }
    }

    func testInitRawValue_UnknownValue_ReturnsNil() {
        XCTAssertNil(Warp.ButtonType(rawValue: "destructive"))
        XCTAssertNil(Warp.ButtonType(rawValue: ""))
    }

    // Deprecated context, so using the deprecated aliases here adds no build warnings.
    @available(*, deprecated, message: "Exercises the deprecated critical aliases")
    func testDeprecatedCriticalAliases_EqualNegativeTypes() {
        XCTAssertEqual(Warp.ButtonType.critical, .negative)
        XCTAssertEqual(Warp.ButtonType.criticalQuiet, .negativeQuiet)
    }

    @available(*, deprecated, message: "Exercises the deprecated critical aliases")
    func testDeprecatedCriticalAliases_MatchNegativeTypesInSwitch() {
        func matchesCritical(_ type: Warp.ButtonType) -> Bool {
            switch type {
            case .critical, .criticalQuiet: return true
            default: return false
            }
        }

        XCTAssertTrue(matchesCritical(.negative))
        XCTAssertTrue(matchesCritical(.negativeQuiet))
        XCTAssertFalse(matchesCritical(.primary))
    }
}
