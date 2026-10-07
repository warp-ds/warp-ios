import Testing
import SwiftUI
import UIKit
@testable import Warp

/// VoiceOver semantics for icons that act as buttons through `onTapGesture` (#242, FEP-210).
@Suite @MainActor
struct TappableIconAccessibilityTests {

    private var closeName: String { Warp.Strings.iconClose.localized }
    private var infoName: String { Warp.Strings.iconInfo.localized }

    // MARK: - Modal

    @Test
    func modalCloseIconIsAButton() throws {
        let presented = Flag(true)
        let close = try #require(
            hostedElements(Warp.Modal(title: "Title", bodyText: "Body", hasCloseButton: true, isPresented: presented.binding))
                .first { $0.accessibilityLabel == closeName },
            "The close icon must be reachable by its localized name"
        )

        #expect(close.accessibilityTraits.contains(.button))
    }

    @Test
    func modalCloseIconDismissesThroughVoiceOverActivation() throws {
        let presented = Flag(true)
        var didDismiss = false
        let close = try #require(
            hostedElements(Warp.Modal(
                title: "Title",
                bodyText: "Body",
                hasCloseButton: true,
                onDismiss: { didDismiss = true },
                isPresented: presented.binding
            ))
            .first { $0.accessibilityLabel == closeName }
        )

        _ = close.accessibilityActivate()

        #expect(presented.value == false)
        #expect(didDismiss)
    }

    @Test
    func modalTitleIsAHeader() throws {
        let presented = Flag(true)
        let title = try #require(
            hostedElements(Warp.Modal(title: "Title", bodyText: "Body", isPresented: presented.binding))
                .first { $0.accessibilityLabel == "Title" },
            "The title must be its own element, not merged into the modal"
        )

        #expect(title.accessibilityTraits.contains(.header))
    }

    // MARK: - Label

    @Test
    func labelInfoIconIsAButton() throws {
        let info = try #require(
            hostedElements(Warp.Label(title: "Price", tooltipInfoAction: {}))
                .first { $0.accessibilityLabel == infoName }
        )

        #expect(info.accessibilityTraits.contains(.button))
    }

    @Test
    func labelInfoIconRunsTheInfoActionThroughVoiceOverActivation() throws {
        var didRun = false
        let info = try #require(
            hostedElements(Warp.Label(title: "Price", tooltipInfoAction: { didRun = true }))
                .first { $0.accessibilityLabel == infoName }
        )

        _ = info.accessibilityActivate()

        #expect(didRun)
    }

    @Test
    func labelInfoIconShowsTheTooltipThroughVoiceOverActivation() throws {
        let host = AccessibilityHost(Warp.Label(title: "Price", tooltipContent: AnyView(Text("Includes VAT"))))
        defer { host.tearDown() }
        let info = try #require(host.elements().first { $0.accessibilityLabel == infoName })
        #expect(host.elements().contains { $0.accessibilityLabel == "Includes VAT" } == false)

        _ = info.accessibilityActivate()

        #expect(host.elements().contains { $0.accessibilityLabel == "Includes VAT" })
    }

    // MARK: - Broadcast (deprecated, still public)

    @Test
    func broadcastCloseIconIsAButtonThatDismisses() throws {
        let presented = Flag(true)
        let close = try #require(
            hostedElements(Warp.Broadcast(text: "Maintenance tonight", broadcastEdge: .top, isPresented: presented.binding))
                .first { $0.accessibilityLabel == closeName }
        )

        #expect(close.accessibilityTraits.contains(.button))

        _ = close.accessibilityActivate()

        #expect(presented.value == false)
    }

    @Test
    func nonDismissableBroadcastHasNoCloseButton() {
        let presented = Flag(true)
        let elements = hostedElements(
            Warp.Broadcast(text: "Maintenance tonight", broadcastEdge: .top, isDismissable: false, isPresented: presented.binding)
        )

        #expect(elements.contains { $0.accessibilityLabel == closeName } == false)
    }
}
