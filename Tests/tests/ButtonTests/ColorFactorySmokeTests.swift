import XCTest
import SwiftUI
@testable import Warp

@available(iOS 17.0, *) // resolve(in:) color method supported from iOS 17.0
final class ColorFactorySmokeTests: XCTestCase {
    private typealias ColorFactory = Warp.Button.ColorFactory
    
    func testForegroundColor_Parameterized_ShouldBeEqual() throws {
        let environment = EnvironmentValues()
        
        let colorProvider = Warp.Color
        let disabledTextColor = colorProvider.token.textInverted
        
        let mockButtonVariants: [ButtonVariant] = [
            // Primary
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                expectedColor: colorProvider.token.textInverted
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // Secondary
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                expectedColor: colorProvider.token.textLink
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // Quiet
            ButtonVariant(
                type: .quiet,
                isEnabled: true,
                expectedColor: colorProvider.token.textLink
            ),
            ButtonVariant(
                type: .quiet,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                expectedColor: colorProvider.token.textInverted
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // CriticalQuiet
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: true,
                expectedColor: colorProvider.token.textNegative
            ),
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                expectedColor: colorProvider.token.text
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // UtilityQuiet
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: true,
                expectedColor: colorProvider.token.text
            ),
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),
            
            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                expectedColor: colorProvider.token.text
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: false,
                expectedColor: disabledTextColor
            )
        ]
        
        mockButtonVariants.forEach { variant in
            let sut = ColorFactory(
                for: variant.type,
                consuming: colorProvider,
                isEnabled: variant.isEnabled,
                isLoading: false
            )
            
            XCTAssertEqual(
                sut.makeForegroundColor().resolve(in: environment),
                variant.expectedColor.resolve(in: environment)
            )
        }
    }
    
    func testBackgroundColor_Parameterized_ShouldBeEqual() throws {
        let environment = EnvironmentValues()
        
        let colorProvider = Warp.Color
        let disabledBackgroundColor = colorProvider.token.backgroundDisabled
        let loadingBackgroundColor = colorProvider.token.backgroundTransparent0
        
        let mockButtonVariants: [ButtonVariant] = [
            // Primary
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonPrimaryBackground
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonPrimaryBackgroundActive
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // Secondary
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.background
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundActive
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // Quiet
            ButtonVariant(
                type: .quiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .quiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundActive
            ),
            ButtonVariant(
                type: .quiet,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundNegative
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundNegativeActive
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // CriticalQuiet
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundNegativeSubtleActive
            ),
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.background
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundActive
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // UtilityQuiet
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundActive
            ),
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),
            
            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.surfaceElevated300
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.surfaceElevated300Active
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            )
        ]
        
        mockButtonVariants.forEach { variant in
            let sut = ColorFactory(
                for: variant.type,
                consuming: colorProvider,
                isEnabled: variant.isEnabled,
                isLoading: false
            )
            
            XCTAssertEqual(
                sut.makeBackgroundColor(isPressed: variant.isPressed).resolve(in: environment),
                variant.expectedColor.resolve(in: environment)
            )
        }
    }
    
    func testBorderColor_Parameterized_ShouldBeEqual() throws {
        let environment = EnvironmentValues()
        
        let colorProvider = Warp.Color
        let disabledBorderColor = colorProvider.token.backgroundTransparent0
        let loadingBorderColor = colorProvider.token.backgroundTransparent0
        
        let mockButtonVariants: [ButtonVariant] = [
            // Primary
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // Secondary
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.border
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.borderActive
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // Quiet
            ButtonVariant(
                type: .quiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .quiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .quiet,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // CriticalQuiet
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .criticalQuiet,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.border
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.borderActive
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // UtilityQuiet
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .utilityQuiet,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
            
            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.token.backgroundTransparent0
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: false,
                expectedColor: disabledBorderColor
            )
        ]
        
        mockButtonVariants.forEach { variant in
            let sut = ColorFactory(
                for: variant.type,
                consuming: colorProvider,
                isEnabled: variant.isEnabled,
                isLoading: false
            )
            
            XCTAssertEqual(
                sut.makeBorderColor(isPressed: variant.isPressed).resolve(in: environment),
                variant.expectedColor.resolve(in: environment)
            )
        }
    }
}

private struct ButtonVariant {
    let type: Warp.ButtonType
    let isEnabled: Bool
    let isPressed: Bool
    let expectedColor: Color
    
    init(
        type: Warp.ButtonType,
        isEnabled: Bool = true,
        isPressed: Bool = false,
        expectedColor: Color
    ) {
        self.type = type
        self.isEnabled = isEnabled
        self.isPressed = isPressed
        self.expectedColor = expectedColor
    }
}
