import Testing
import SwiftUI
@testable import Warp

@Suite
struct AlertDialogTests {

    // MARK: - Style.buttonRole

    @Test
    func defaultStyleHasNilButtonRole() {
        #expect(Warp.AlertDialog.Style.default.buttonRole == nil)
    }

    @Test
    func destructiveStyleHasDestructiveButtonRole() {
        #expect(Warp.AlertDialog.Style.destructive.buttonRole == .destructive)
    }

    @Test
    func cancelStyleHasCancelButtonRole() {
        #expect(Warp.AlertDialog.Style.cancel.buttonRole == .cancel)
    }

    @Test
    func primaryStyleHasNilButtonRole() {
        #expect(Warp.AlertDialog.Style.primary.buttonRole == nil)
    }

    // MARK: - Action init

    @Test
    func actionStoresTitleAndStyle() {
        let action = Warp.AlertDialog.Action(title: "Confirm", style: .primary, handler: {})
        #expect(action.title == "Confirm")
        #expect(action.style == .primary)
    }

    @Test
    func actionDefaultStyleIsDefault() {
        let action = Warp.AlertDialog.Action(title: "OK", handler: {})
        #expect(action.style == .default)
    }

    @Test
    func actionHasUniqueIDs() {
        let a = Warp.AlertDialog.Action(title: "A", handler: {})
        let b = Warp.AlertDialog.Action(title: "B", handler: {})
        #expect(a.id != b.id)
    }

    @Test
    func actionHandlerIsInvoked() {
        var called = false
        let action = Warp.AlertDialog.Action(title: "Tap", style: .primary, handler: { called = true })
        action.handler()
        #expect(called)
    }

    // MARK: - firstPrimaryID (only the first .primary gets .defaultAction)

    @Test
    func firstPrimaryIDIsIDOfFirstPrimaryAction() {
        let first = Warp.AlertDialog.Action(title: "First", style: .primary, handler: {})
        let second = Warp.AlertDialog.Action(title: "Second", style: .primary, handler: {})
        let modifier = Warp.AlertDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [first, second],
            isPresented: .constant(false),
            extraContent: EmptyView()
        )
        #expect(modifier.firstPrimaryID == first.id)
        #expect(modifier.firstPrimaryID != second.id)
    }

    @Test
    func firstPrimaryIDIsNilWhenNoPrimaryAction() {
        let modifier = Warp.AlertDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [
                .init(title: "OK", style: .default, handler: {}),
                .init(title: "Cancel", style: .cancel, handler: {})
            ],
            isPresented: .constant(false),
            extraContent: EmptyView()
        )
        #expect(modifier.firstPrimaryID == nil)
    }

    // MARK: - Style equality (drives .primary keyboard shortcut path)

    @Test
    func primaryStyleEqualsToPrimary() {
        #expect(Warp.AlertDialog.Style.primary == .primary)
    }

    @Test
    func primaryStyleNotEqualToDefault() {
        #expect(Warp.AlertDialog.Style.primary != .default)
    }

    @Test
    func primaryStyleNotEqualToDestructive() {
        #expect(Warp.AlertDialog.Style.primary != .destructive)
    }

    @Test
    func primaryStyleNotEqualToCancel() {
        #expect(Warp.AlertDialog.Style.primary != .cancel)
    }
}
