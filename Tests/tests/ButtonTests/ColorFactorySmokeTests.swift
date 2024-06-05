import XCTest
import struct SwiftUI.Color
@testable import Warp

final class ColorFactorySmokeTests: XCTestCase {
    private typealias ColorFactory = Warp.Button.ColorFactory

    func testForegroundColor_Parameterized_ShouldBeEqual() throws {
        // INS
        let colorProvider = Warp.Config.colorProvider

        let disabledTextColor = colorProvider.buttonDisabledText

        let mockButtonVariants: [ButtonVariant] = [
            // Primary
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                expectedColor: colorProvider.buttonPrimaryText
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: false,
                expectedColor: colorProvider.buttonPrimaryTextDisabled
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                expectedColor: colorProvider.buttonSecondaryText
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                isEnabled: true,
                expectedColor: colorProvider.buttonQuietText
            ),
            ButtonVariant(
                type: .tertiary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                expectedColor: colorProvider.buttonNegativeText
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // CriticalTertiary
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: true,
                expectedColor: colorProvider.buttonNegativeQuietText
            ),
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                expectedColor: colorProvider.buttonUtilityText
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: true,
                expectedColor: colorProvider.buttonUtilityQuietText
            ),
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: false,
                expectedColor: disabledTextColor
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                expectedColor: colorProvider.buttonUtilityQuietText
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

            XCTAssertEqual(sut.makeForegroundColor(), variant.expectedColor)
        }
    }

    func testBackgroundColor_Parameterized_ShouldBeEqual() throws {
        // INS
        let colorProvider = Warp.Config.colorProvider

        let disabledBackgroundColor = colorProvider.buttonDisabledBackground
        let utilityDisabledBackgroundColor = colorProvider.buttonUtilityBackgroundDisabled

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
                expectedColor: colorProvider.buttonPrimaryBackgroundDisabled
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonSecondaryBackground
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonSecondaryBackgroundActive
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: colorProvider.buttonSecondaryBackgroundDisabled
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonQuietBackground
            ),
            ButtonVariant(
                type: .tertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonQuietBackgroundActive
            ),
            ButtonVariant(
                type: .tertiary,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonNegativeBackground
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonNegativeBackgroundActive
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),

            // CriticalTertiary
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonNegativeQuietBackground
            ),
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonNegativeQuietBackgroundActive
            ),
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: false,
                expectedColor: disabledBackgroundColor
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonUtilityBackground
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityBackgroundActive
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: utilityDisabledBackgroundColor
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonUtilityQuietBackground
            ),
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityQuietBackgroundActive
            ),
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: false,
                expectedColor: utilityDisabledBackgroundColor
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonUtilityBackground
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityBackground
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: false,
                expectedColor: utilityDisabledBackgroundColor
            ),
        ]

        mockButtonVariants.forEach { variant in
            let sut = ColorFactory(
                for: variant.type,
                consuming: colorProvider,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(
                sut.makeBackgroundColor(isPressed: variant.isPressed),
                variant.expectedColor
            )
        }
    }

    func testBorderColor_Parameterized_ShouldBeEqual() throws {
        // INS
        let colorProvider = Warp.Config.colorProvider

        let clearColor = Color.clear

        let disabledBorderColor = colorProvider.buttonDisabledQuietBorder

        let mockButtonVariants: [ButtonVariant] = [
            // Primary
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonPrimaryBorder
            ),
            ButtonVariant(
                type: .primary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonPrimaryBorderActive
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
                expectedColor: colorProvider.buttonSecondaryBorder
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonSecondaryBorderActive
            ),
            ButtonVariant(
                type: .secondary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonQuietBackground
            ),
            ButtonVariant(
                type: .tertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: clearColor
            ),
            ButtonVariant(
                type: .tertiary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonNegativeBorder
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonNegativeBorderActive
            ),
            ButtonVariant(
                type: .critical,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // CriticalTertiary
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonNegativeQuietBorder
            ),
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonNegativeQuietBorderActive
            ),
            ButtonVariant(
                type: .criticalTertiary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: false,
                expectedColor: colorProvider.buttonUtilityBorder
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityBorderActive
            ),
            ButtonVariant(
                type: .utility,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: true,
                isPressed: false,
                expectedColor: clearColor
            ),
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityQuietBorderActive
            ),
            ButtonVariant(
                type: .utilityTertiary,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: false,
                expectedColor: clearColor
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: true,
                isPressed: true,
                expectedColor: colorProvider.buttonUtilityBackground
            ),
            ButtonVariant(
                type: .utilityOverlay,
                isEnabled: false,
                expectedColor: disabledBorderColor
            ),
        ]

        mockButtonVariants.forEach { variant in
            let sut = ColorFactory(
                for: variant.type,
                consuming: colorProvider,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(
                sut.makeBorderColor(isPressed: variant.isPressed),
                variant.expectedColor
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
