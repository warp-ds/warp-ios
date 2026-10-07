import Testing
import SwiftUI
import UIKit
import ViewInspector
@testable import Warp

/// Accessibility semantics for the selection controls that draw their own shapes.
///
/// `Radio`, `Checkbox` and `ButtonGroup` build their interaction out of `onTapGesture` on plain
/// `Circle`, `Image` and `Text` views rather than on a native SwiftUI control, so - unlike
/// `Switch` or `Button` - they inherit nothing from the framework and every semantic has to be
/// supplied explicitly. See warp-ios#242.
///
/// Most of this suite drives the real UIKit accessibility tree rather than ViewInspector, because
/// ViewInspector cannot reach what matters here:
///
/// - It has no reader for `accessibilityAddTraits`, so `.isButton` and `.isSelected` are
///   invisible to it.
/// - `callAccessibilityAction` throws `notSupported` on iOS 16 and later by design - see
///   `v3AccessibilityAction` in ViewInspector 0.10.3 - and this package's floor is iOS 18.
///
/// Hosting the view and walking `UIAccessibility` covers both, and tests what VoiceOver actually
/// consumes rather than what the view declares. The trade-off is that it needs a render pass, so
/// these tests are slower and depend on layout completing.
///
/// The group-name assertions stay on ViewInspector, where a static read of the declared label is
/// both sufficient and cheaper.
@Suite @MainActor
struct SelectionControlAccessibilityTests {

    // MARK: - Radio

    @Test
    func radioExposesItsLabelAndButtonTrait() throws {
        let element = try #require(
            hostedElements(Warp.Radio(isSelected: false, label: "Day", action: {}))
                .first { $0.accessibilityLabel == "Day" },
            "The option must carry its visible label as its accessible name"
        )

        #expect(element.accessibilityTraits.contains(.button))
    }

    @Test
    func selectedRadioCarriesTheSelectedTrait() throws {
        let selected = try #require(
            hostedElements(Warp.Radio(isSelected: true, label: "Week", action: {}))
                .first { $0.accessibilityLabel == "Week" }
        )
        let unselected = try #require(
            hostedElements(Warp.Radio(isSelected: false, label: "Week", action: {}))
                .first { $0.accessibilityLabel == "Week" }
        )

        #expect(selected.accessibilityTraits.contains(.selected))
        #expect(unselected.accessibilityTraits.contains(.selected) == false)
    }

    /// The regression this suite exists for. A tap gesture is not an accessibility action, so
    /// before #242 VoiceOver's double-tap had nothing to invoke and the control was unusable
    /// with the screen reader even though it looked interactive.
    @Test
    func radioIsSelectableThroughVoiceOverActivation() throws {
        var selected = false
        let element = try #require(
            hostedElements(Warp.Radio(isSelected: false, label: "Day") { selected = true })
                .first { $0.accessibilityLabel == "Day" }
        )

        _ = element.accessibilityActivate()

        #expect(selected)
    }

    @Test
    func disabledRadioIgnoresVoiceOverActivation() throws {
        var selected = false
        let element = try #require(
            hostedElements(Warp.Radio(isSelected: false, label: "Day", style: .disabled) { selected = true })
                .first { $0.accessibilityLabel == "Day" }
        )

        _ = element.accessibilityActivate()

        #expect(selected == false, "A disabled option must ignore activation from assistive technology exactly as it ignores a tap")
    }

    // MARK: - Checkbox

    @Test
    func checkboxExposesItsLabelAndButtonTrait() throws {
        let element = try #require(
            hostedElements(Warp.Checkbox(isSelected: .constant(false), label: "Send me offers", action: {}))
                .first { $0.accessibilityLabel == "Send me offers" }
        )

        #expect(element.accessibilityTraits.contains(.button))
    }

    @Test
    func selectedCheckboxCarriesTheSelectedTrait() throws {
        let selected = try #require(
            hostedElements(Warp.Checkbox(isSelected: .constant(true), label: "Send me offers", action: {}))
                .first { $0.accessibilityLabel == "Send me offers" }
        )

        #expect(selected.accessibilityTraits.contains(.selected))
    }

    @Test
    func checkboxIsTogglableThroughVoiceOverActivation() throws {
        var toggled = false
        let element = try #require(
            hostedElements(Warp.Checkbox(isSelected: .constant(false), label: "Send me offers") { toggled = true })
                .first { $0.accessibilityLabel == "Send me offers" }
        )

        _ = element.accessibilityActivate()

        #expect(toggled)
    }

    // MARK: - ButtonGroup

    @Test
    func buttonGroupSegmentsCarryButtonAndSelectedTraits() throws {
        let buttons = Binding<[(title: String, isSelected: Bool)]>(
            wrappedValue: [("Day", false), ("Week", true)]
        )
        let elements = hostedElements(Warp.ButtonGroup(buttons: buttons, singleSelect: true))

        let day = try #require(elements.first { $0.accessibilityLabel == "Day" })
        let week = try #require(elements.first { $0.accessibilityLabel == "Week" })

        #expect(day.accessibilityTraits.contains(.button))
        #expect(week.accessibilityTraits.contains(.button))
        #expect(week.accessibilityTraits.contains(.selected), "The chosen segment must be distinguishable without sight")
        #expect(day.accessibilityTraits.contains(.selected) == false)
    }

    @Test
    func buttonGroupSegmentIsSelectableThroughVoiceOverActivation() throws {
        let buttons = Binding<[(title: String, isSelected: Bool)]>(
            wrappedValue: [("Day", false), ("Week", true)]
        )
        let element = try #require(
            hostedElements(Warp.ButtonGroup(buttons: buttons, singleSelect: true))
                .first { $0.accessibilityLabel == "Day" }
        )

        _ = element.accessibilityActivate()

        #expect(buttons.wrappedValue[0].isSelected)
        #expect(buttons.wrappedValue[1].isSelected == false, "Single-select must clear the previous choice")
    }

    // MARK: - Group names

    /// The group name belongs on the container holding the options rather than on the outermost
    /// stack, so that entering the group announces the question before the first answer.
    @Test
    func radioGroupExposesItsTitleAsTheGroupName() throws {
        let options = [TestRadioOption(title: "Day"), TestRadioOption(title: "Week")]
        let group = Warp.RadioGroup(
            title: "Rental period",
            selectedOption: .constant(options[0]),
            options: options
        )

        // `find` throws when nothing matches, which is the assertion.
        _ = try group.inspect().find(where: { view in
            (try? view.accessibilityLabel().string()) == "Rental period"
        })
    }

    @Test
    func checkboxGroupExposesItsTitleAsTheGroupName() throws {
        let options = [TestCheckboxOption(title: "Email"), TestCheckboxOption(title: "SMS")]
        let group = Warp.CheckboxGroup(
            title: "How should we contact you?",
            options: .constant(options)
        )

        _ = try group.inspect().find(where: { view in
            (try? view.accessibilityLabel().string()) == "How should we contact you?"
        })
    }

    /// An untitled group must not announce an empty name, which would make VoiceOver stop on a
    /// nameless element on the way in.
    @Test
    func untitledRadioGroupDoesNotDeclareAnEmptyGroupName() throws {
        let options = [TestRadioOption(title: "Day")]
        let group = Warp.RadioGroup(selectedOption: .constant(options[0]), options: options)

        let emptyNamed = try? group.inspect().find(where: { view in
            (try? view.accessibilityLabel().string()) == ""
        })

        #expect(emptyNamed == nil)
    }
}

// MARK: - Hosting

/// Renders `view` in a real window and returns every accessibility element SwiftUI produced.
///
/// A window rather than a detached `UIHostingController` because SwiftUI does not build the
/// accessibility tree for a view that was never placed in one, and `layoutIfNeeded` alone leaves
/// `accessibilityElements` empty.
@MainActor
private func hostedElements(_ view: some View) -> [NSObject] {
    let host = UIHostingController(rootView: view)
    let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
    window.rootViewController = host
    window.makeKeyAndVisible()
    host.view.setNeedsLayout()
    host.view.layoutIfNeeded()

    // SwiftUI populates accessibility lazily, after the first render rather than at layout, so a
    // brief runloop spin is the difference between a populated tree and an empty one.
    RunLoop.current.run(until: Date().addingTimeInterval(0.1))

    return collectAccessibilityElements(from: host.view)
}

/// Walks both trees SwiftUI uses: the view hierarchy, and the `accessibilityElements` arrays
/// hanging off it.
///
/// Descending into `accessibilityElements` recursively matters for anything declaring
/// `.accessibilityElement(children: .contain)`, such as `ButtonGroup` and the option groups.
/// A container is a `UIAccessibilityElement` rather than a `UIView`, and its options are nested
/// inside *its* `accessibilityElements`, so a walk that only followed `subviews` would collect
/// the container and silently miss every option inside it.
@MainActor
private func collectAccessibilityElements(from root: UIView) -> [NSObject] {
    var found: [NSObject] = []
    var visited = Set<ObjectIdentifier>()

    func visit(_ object: NSObject) {
        // Containers can appear under both a parent's element list and the view hierarchy, so
        // without this the same option is collected twice.
        guard visited.insert(ObjectIdentifier(object)).inserted else { return }

        if object.isAccessibilityElement {
            found.append(object)
        }
        for child in object.accessibilityElements ?? [] {
            if let child = child as? NSObject {
                visit(child)
            }
        }
        if let view = object as? UIView {
            for subview in view.subviews {
                visit(subview)
            }
        }
    }

    visit(root)
    return found
}

private struct TestRadioOption: RadioOption {
    var id: String { title }
    let title: String
    var extraContent: AnyView? = nil

    static func == (lhs: TestRadioOption, rhs: TestRadioOption) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

private struct TestCheckboxOption: CheckboxOption {
    var id: String { title }
    let title: String
    var isSelected: Binding<Bool> = .constant(false)
    var extraContent: AnyView? = nil

    static func == (lhs: TestCheckboxOption, rhs: TestCheckboxOption) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
