import Testing
import SwiftUI
@testable import Warp

@Suite
struct ConfirmationDialogTests {

    // MARK: - Style.buttonRole

    @Test
    func defaultStyleHasNilButtonRole() {
        #expect(Warp.ConfirmationDialog.Style.default.buttonRole == nil)
    }

    @Test
    func destructiveStyleHasDestructiveButtonRole() {
        #expect(Warp.ConfirmationDialog.Style.destructive.buttonRole == .destructive)
    }

    @Test
    func cancelStyleHasCancelButtonRole() {
        #expect(Warp.ConfirmationDialog.Style.cancel.buttonRole == .cancel)
    }

    @Test
    func primaryStyleHasNilButtonRole() {
        #expect(Warp.ConfirmationDialog.Style.primary.buttonRole == nil)
    }

    // MARK: - Action init

    @Test
    func actionStoresTitleAndStyle() {
        let action = Warp.ConfirmationDialog.Action(title: "Share", style: .primary, handler: {})
        #expect(action.title == "Share")
        #expect(action.style == .primary)
    }

    @Test
    func actionDefaultStyleIsDefault() {
        let action = Warp.ConfirmationDialog.Action(title: "OK", handler: {})
        #expect(action.style == .default)
    }

    @Test
    func actionHasUniqueIDs() {
        let a = Warp.ConfirmationDialog.Action(title: "A", handler: {})
        let b = Warp.ConfirmationDialog.Action(title: "B", handler: {})
        #expect(a.id != b.id)
    }

    @Test
    func actionHandlerIsInvoked() {
        var called = false
        let action = Warp.ConfirmationDialog.Action(title: "Tap", style: .primary, handler: { called = true })
        action.handler()
        #expect(called)
    }

    // MARK: - Style equality

    @Test
    func primaryStyleEqualsToPrimary() {
        #expect(Warp.ConfirmationDialog.Style.primary == .primary)
    }

    @Test
    func primaryStyleNotEqualToDefault() {
        #expect(Warp.ConfirmationDialog.Style.primary != .default)
    }

    @Test
    func primaryStyleNotEqualToDestructive() {
        #expect(Warp.ConfirmationDialog.Style.primary != .destructive)
    }

    @Test
    func primaryStyleNotEqualToCancel() {
        #expect(Warp.ConfirmationDialog.Style.primary != .cancel)
    }

    // MARK: - sortedActions (primary floats to top)

    @Test
    func primaryActionsAppearBeforeDefaultActions() {
        let modifier = Warp.ConfirmationDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [
                .init(title: "A", style: .default, handler: {}),
                .init(title: "B", style: .primary, handler: {}),
                .init(title: "C", style: .destructive, handler: {})
            ],
            isPresented: .constant(false)
        )
        let sorted = modifier.sortedActions
        #expect(sorted.first?.style == .primary)
    }

    @Test
    func nonPrimaryActionsPreserveRelativeOrder() {
        let modifier = Warp.ConfirmationDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [
                .init(title: "First", style: .default, handler: {}),
                .init(title: "Second", style: .destructive, handler: {}),
                .init(title: "Third", style: .cancel, handler: {})
            ],
            isPresented: .constant(false)
        )
        let sorted = modifier.sortedActions.map(\.title)
        #expect(sorted == ["First", "Second", "Third"])
    }

    @Test
    func onlyFirstCancelActionIsKept() {
        let modifier = Warp.ConfirmationDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [
                .init(title: "Never mind", style: .cancel, handler: {}),
                .init(title: "Dismiss", style: .cancel, handler: {})
            ],
            isPresented: .constant(false)
        )
        let cancelActions = modifier.sortedActions.filter { $0.style == .cancel }
        #expect(cancelActions.count == 1)
        #expect(cancelActions.first?.title == "Never mind")
    }

    @Test
    func multipleCancelKeptOnlyFirstWithOtherActions() {
        let modifier = Warp.ConfirmationDialogViewModifier(
            title: "Test",
            message: nil,
            actions: [
                .init(title: "Share", style: .default, handler: {}),
                .init(title: "Never mind", style: .cancel, handler: {}),
                .init(title: "Extra Cancel", style: .cancel, handler: {})
            ],
            isPresented: .constant(false)
        )
        let sorted = modifier.sortedActions
        #expect(sorted.filter { $0.style == .cancel }.count == 1)
        #expect(sorted.map(\.title).contains("Never mind"))
        #expect(!sorted.map(\.title).contains("Extra Cancel"))
    }
}
