import Testing
import SwiftUI
import ViewInspector
@testable import Warp

/// The 44 x 44 pt minimum touch target of `Warp.Button` and `.buttonStyle(.warp(...))` (FEP-242).
@Suite
struct MinimumTouchTargetTests {
    private typealias TouchTargetShape = Warp.Button.MinimumTouchTargetShape

    @Test(arguments: [
        // Small and utility buttons at the default text size: 6 pt above and below.
        (CGRect(x: 0, y: 0, width: 120, height: 32), CGRect(x: 0, y: -6, width: 120, height: 44)),
        // Icon-only utility button: grows on every side.
        (CGRect(x: 10, y: 20, width: 32, height: 32), CGRect(x: 4, y: 14, width: 44, height: 44)),
        // Small button enlarged by Dynamic Type, still under 44 pt.
        (CGRect(x: 0, y: 0, width: 140, height: 40), CGRect(x: 0, y: -2, width: 140, height: 44)),
        // Tall but narrow: grows sideways only.
        (CGRect(x: 0, y: 0, width: 30, height: 60), CGRect(x: -7, y: 0, width: 44, height: 60)),
    ])
    func growsSmallerButtonsToTheMinimum(frame: CGRect, expected: CGRect) {
        #expect(TouchTargetShape.touchTarget(for: frame) == expected)
        #expect(TouchTargetShape().path(in: frame).boundingRect == expected)
    }

    @Test(arguments: [
        CGRect(x: 0, y: 0, width: 44, height: 44),
        // Big button at the default text size.
        CGRect(x: 0, y: 0, width: 160, height: 48),
        // Small button at a large Dynamic Type size.
        CGRect(x: 0, y: 0, width: 220, height: 64),
    ])
    func leavesButtonsOfAtLeastTheMinimumUnchanged(frame: CGRect) {
        #expect(TouchTargetShape.touchTarget(for: frame) == frame)
    }

    /// `Warp.Button` renders through `WarpButtonStyle`, so this covers both entry points.
    @Test(arguments: Warp.ButtonType.allCases, Warp.ButtonSize.allCases)
    @MainActor
    func warpButtonStyleUsesTheMinimumTouchTargetShape(type: Warp.ButtonType, size: Warp.ButtonSize) throws {
        let style = WarpButtonStyle(
            type: type,
            size: size,
            colorProvider: Warp.Color,
            isEnabled: true,
            isLoading: false
        )

        _ = try style.inspect(isPressed: false).contentShape(TouchTargetShape.self)
    }
}
