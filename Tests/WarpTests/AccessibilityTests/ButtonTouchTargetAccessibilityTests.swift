import Testing
import SwiftUI
import UIKit
@testable import Warp

extension AccessibilityHostingTests {
    /// The 44 pt minimum touch target of `Warp.Button` only grows the tappable area (FEP-242).
    /// VoiceOver's focus frame must stay on the visible button, not on the larger tap area.
    @Suite @MainActor
    struct ButtonTouchTargetAccessibilityTests {

        @Test
        func smallButtonFocusFrameStaysTheVisualSize() async throws {
            let element = try #require(
                await hostedElements(Warp.Button(title: "Small", action: {}, size: .small))
                    .first { $0.accessibilityLabel == "Small" }
            )

            // A small button is about 30-32 pt tall at the default text size. Its tap area is 44 pt,
            // but the focus frame VoiceOver draws must not grow with it.
            #expect(element.accessibilityFrame.height < 40)
        }

        @Test
        func utilityButtonFocusFrameStaysTheVisualSize() async throws {
            let element = try #require(
                await hostedElements(Warp.Button(title: "Utility", action: {}, type: .utility, size: .big))
                    .first { $0.accessibilityLabel == "Utility" }
            )

            #expect(element.accessibilityFrame.height < 40)
        }
    }
}
