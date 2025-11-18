import Testing
import UIKit
@testable import Warp

struct StateViewModelTests {

    @Test
    func testInitialValues() {
        let vm = StateViewModel(
            title: "Test Title",
            description: "Test Description",
            actionButtonTitle: "Primary",
            primaryAction: {},
            secondaryButtonTitle: "Secondary",
            secondaryAction: {}
        )

        #expect(vm.title == "Test Title", "Title should match the initial value")
        #expect(vm.description == "Test Description", "Description should match the initial value")
        #expect(vm.actionButtonTitle == "Primary", "Action button title should match the initial value")
        #expect(vm.secondaryButtonTitle == "Secondary", "Secondary button title should match the initial value")

        vm.tintColor = .red
        #expect(vm.tintColor == .red, "Tint color should update correctly")

        vm.actionButtonTitle = "New Primary"
        #expect(vm.actionButtonTitle == "New Primary", "Action button title should update correctly")
    }

    @Test
    func testUpdatingTitleReflectsInModel() {
        let vm = StateViewModel()
        vm.title = "New Title"
        #expect(vm.title == "New Title", "Title should update correctly")
        #expect(vm.description == nil, "Description should be nil initially")

        vm.title = "Old title"
        vm.description = vm.title
        #expect(vm.title == "Old title", "Title should update correctly")
        #expect(vm.description == "Old title", "Description should reflect the updated title")
    }

    @Test
    func testPrimaryButtonActionCalled() {
        var actionCalled = false
        let vm = StateViewModel(
            actionButtonTitle: "Go",
            primaryAction: {
                actionCalled = true
            }
        )

        vm.primaryAction()
        #expect(actionCalled == true, "Primary action should be called")
    }

    @Test
    func testSecondaryButtonActionCalled() {
        var actionCalled = false
        let vm = StateViewModel(
            secondaryButtonTitle: "Second button",
            secondaryAction: {
                actionCalled = true
            }
        )

        vm.secondaryAction()
        #expect(actionCalled == true, "Secondary action should be called")
    }
}