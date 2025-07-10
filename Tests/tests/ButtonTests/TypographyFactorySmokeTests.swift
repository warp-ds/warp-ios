import XCTest
import struct SwiftUI.Font
import struct SwiftUI.Text
@testable import Warp

final class TypographyFactorySmokeTests: XCTestCase {
    private typealias TypographyFactory = Warp.Button.TypographyFactory
    
    func testFonts_Parameterized_ShouldBeEqual() throws {
        let calloutFont = Warp.Typography.title4.font
        let captionFont = Warp.Typography.detailStrong.font
        
        let typesWithExpectations: [(type: Warp.ButtonType, expectedFont: Font)] = [
            (.primary, calloutFont),
            (.secondary, calloutFont),
            (.critical, calloutFont),
            
            (.utility, captionFont),
            (.utilityQuiet, captionFont),
            (.utilityOverlay, captionFont)
        ]
        
        typesWithExpectations.forEach { typeWithExpectation in
            let sut = TypographyFactory(for: typeWithExpectation.type, size: .big)
            
            XCTAssertEqual(sut.font, typeWithExpectation.expectedFont)
        }
    }
    
    func testLineLimit_Parameterized_ShouldBeEqual() {
        let onlyOneLineLimit = 1
        
        let typesWithExpectations: [(type: Warp.ButtonType, expectedLineLimit: Int)] = [
            (.primary, onlyOneLineLimit),
            (.secondary, onlyOneLineLimit),
            (.critical, onlyOneLineLimit),
            
            (.utility, onlyOneLineLimit),
            (.utilityQuiet, onlyOneLineLimit),
            (.utilityOverlay, onlyOneLineLimit)
        ]
        
        typesWithExpectations.forEach { typeWithExpectation in
            let sut = TypographyFactory(for: typeWithExpectation.type, size: .big)
            
            XCTAssertEqual(sut.lineLimit, typeWithExpectation.expectedLineLimit)
        }
    }
    
    func testTruncationMode_Parameterized_ShouldBeEqual() {
        let middleTruncationMode = Text.TruncationMode.middle
        
        let typesWithExpectations: [(type: Warp.ButtonType, expectedTruncationMode: Text.TruncationMode)] = [
            (.primary, middleTruncationMode),
            (.secondary, middleTruncationMode),
            (.critical, middleTruncationMode),
            
            (.utility, middleTruncationMode),
            (.utilityQuiet, middleTruncationMode),
            (.utilityOverlay, middleTruncationMode)
        ]
        
        typesWithExpectations.forEach { typeWithExpectation in
            let sut = TypographyFactory(for: typeWithExpectation.type, size: .big)
            
            XCTAssertEqual(sut.truncationMode, typeWithExpectation.expectedTruncationMode)
        }
    }
}
