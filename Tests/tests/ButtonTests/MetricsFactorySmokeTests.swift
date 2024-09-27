import XCTest
@testable import Warp

@preconcurrency @MainActor
final class MetricsFactorySmokeTests: XCTestCase {
    private typealias UIMetricsFactory = Warp.Button.UIMetricsFactory

    func testBorderWidth_Parameterized_ShouldBeEqual() {
        let defaultBorderWidthExpectation = 4.0

        let mockButtonVariants: [ButtonVariant<CGFloat>] = [
            // Primary
            ButtonVariant(
                type: .primary,
                expectation: defaultBorderWidthExpectation
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                expectation: defaultBorderWidthExpectation
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                expectation: defaultBorderWidthExpectation
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                expectation: defaultBorderWidthExpectation
            ),

            // Critical Tertiary
            ButtonVariant(
                type: .criticalTertiary,
                expectation: defaultBorderWidthExpectation
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                expectation: defaultBorderWidthExpectation / 2
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                expectation: defaultBorderWidthExpectation
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                expectation: defaultBorderWidthExpectation
            ),
        ]

        mockButtonVariants.forEach { variant in
            let sut = UIMetricsFactory(
                type: variant.type,
                size: variant.size,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(sut.borderWidth, variant.expectation)
        }
    }

    func testCornerRadius_Parameterized_ShouldBeEqual() {
        let defaultCornerRadiusExpectation = 8.0

        let mockButtonVariants: [ButtonVariant<CGFloat>] = [
            // Primary
            ButtonVariant(
                type: .primary,
                expectation: defaultCornerRadiusExpectation
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                expectation: defaultCornerRadiusExpectation
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                expectation: defaultCornerRadiusExpectation
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                expectation: defaultCornerRadiusExpectation
            ),

            // Critical Tertiary
            ButtonVariant(
                type: .criticalTertiary,
                expectation: defaultCornerRadiusExpectation
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                expectation: defaultCornerRadiusExpectation / 2
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                expectation: defaultCornerRadiusExpectation / 2
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                expectation: defaultCornerRadiusExpectation / 2
            ),
        ]

        mockButtonVariants.forEach { variant in
            let sut = UIMetricsFactory(
                type: variant.type,
                size: variant.size,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(sut.cornerRadius, variant.expectation)
        }
    }

    func testVerticalPadding_Parameterized_ShouldBeEqual() {
        let bigButtonVerticalPadding = 13.0
        let smallButtonVerticalPadding = 8.0
        let utilityRelatedButtonVerticalPadding = 8.0

        let mockButtonVariants: [ButtonVariant<CGFloat>] = [
            // Primary
            ButtonVariant(
                type: .primary,
                size: .big,
                expectation: bigButtonVerticalPadding
            ),

            ButtonVariant(
                type: .primary,
                size: .small,
                expectation: smallButtonVerticalPadding
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                size: .big,
                expectation: bigButtonVerticalPadding
            ),

            ButtonVariant(
                type: .secondary,
                size: .small,
                expectation: smallButtonVerticalPadding
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                size: .big,
                expectation: bigButtonVerticalPadding
            ),

            ButtonVariant(
                type: .tertiary,
                size: .small,
                expectation: smallButtonVerticalPadding
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                size: .big,
                expectation: bigButtonVerticalPadding
            ),

            ButtonVariant(
                type: .critical,
                size: .small,
                expectation: smallButtonVerticalPadding
            ),

            // Critical Tertiary
            ButtonVariant(
                type: .criticalTertiary,
                size: .big,
                expectation: bigButtonVerticalPadding
            ),

            ButtonVariant(
                type: .criticalTertiary,
                size: .small,
                expectation: smallButtonVerticalPadding
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                size: .big,
                expectation: utilityRelatedButtonVerticalPadding
            ),

            ButtonVariant(
                type: .utility,
                size: .small,
                expectation: utilityRelatedButtonVerticalPadding
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                size: .big,
                expectation: utilityRelatedButtonVerticalPadding
            ),

            ButtonVariant(
                type: .utilityTertiary,
                size: .small,
                expectation: utilityRelatedButtonVerticalPadding
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                size: .big,
                expectation: utilityRelatedButtonVerticalPadding
            ),

            ButtonVariant(
                type: .utilityOverlay,
                size: .small,
                expectation: utilityRelatedButtonVerticalPadding
            )
        ]

        mockButtonVariants.forEach { variant in
            let sut = UIMetricsFactory(
                type: variant.type,
                size: variant.size,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(sut.verticalPadding, variant.expectation)
        }
    }

    func testHorizontalPadding_Parameterized_ShouldBeEqual() {
        let bigButtonHorizontalPadding = 16.0
        let smallButtonHorizontalPadding = 12.0
        let utilityRelatedButtonHorizontalPadding = 8.0

        let mockButtonVariants: [ButtonVariant<CGFloat>] = [
            // Primary
            ButtonVariant(
                type: .primary,
                size: .big,
                expectation: bigButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .primary,
                size: .small,
                expectation: smallButtonHorizontalPadding
            ),

            // Secondary
            ButtonVariant(
                type: .secondary,
                size: .big,
                expectation: bigButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .secondary,
                size: .small,
                expectation: smallButtonHorizontalPadding
            ),

            // Tertiary
            ButtonVariant(
                type: .tertiary,
                size: .big,
                expectation: bigButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .tertiary,
                size: .small,
                expectation: smallButtonHorizontalPadding
            ),

            // Critical
            ButtonVariant(
                type: .critical,
                size: .big,
                expectation: bigButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .critical,
                size: .small,
                expectation: smallButtonHorizontalPadding
            ),

            // Critical Tertiary
            ButtonVariant(
                type: .criticalTertiary,
                size: .big,
                expectation: bigButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .criticalTertiary,
                size: .small,
                expectation: smallButtonHorizontalPadding
            ),

            // Utility
            ButtonVariant(
                type: .utility,
                size: .big,
                expectation: utilityRelatedButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .utility,
                size: .small,
                expectation: utilityRelatedButtonHorizontalPadding
            ),

            // UtilityTertiary
            ButtonVariant(
                type: .utilityTertiary,
                size: .big,
                expectation: utilityRelatedButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .utilityTertiary,
                size: .small,
                expectation: utilityRelatedButtonHorizontalPadding
            ),

            // UtilityOverlay
            ButtonVariant(
                type: .utilityOverlay,
                size: .big,
                expectation: utilityRelatedButtonHorizontalPadding
            ),

            ButtonVariant(
                type: .utilityOverlay,
                size: .small,
                expectation: utilityRelatedButtonHorizontalPadding
            )
        ]

        mockButtonVariants.forEach { variant in
            let sut = UIMetricsFactory(
                type: variant.type,
                size: variant.size,
                isEnabled: variant.isEnabled,
                isLoading: false
            )

            XCTAssertEqual(sut.horizontalPadding, variant.expectation)
        }
    }
}

private struct ButtonVariant<T: Numeric> {
    let type: Warp.ButtonType
    let size: Warp.ButtonSize
    let isEnabled: Bool
    let expectation: T

    init(
        type: Warp.ButtonType,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        expectation: T
    ) {
        self.type = type
        self.size = size
        self.isEnabled = isEnabled
        self.expectation = expectation
    }
}
