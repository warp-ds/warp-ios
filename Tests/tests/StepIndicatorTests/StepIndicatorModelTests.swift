import XCTest
@testable import Warp

@MainActor
final class StepIndicatorModelTests: XCTestCase {
    func testCanCreateCorrect() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ]

        do {
            let model = try Warp.StepIndicatorModel(from: steps)
            XCTAssertTrue(model.steps.count == steps.count)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateEmpty() {
        let steps: [Warp.StepIndicatorItem] = []
        
        do {
            let model = try Warp.StepIndicatorModel(from: steps)
            XCTAssertTrue(model.steps.count == steps.count)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateSingleItem() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockNotStarted
        ]

        do {
            let model = try Warp.StepIndicatorModel(from: steps)
            XCTAssertTrue(model.steps.count == steps.count)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateWithCompletedAndIncompleteSteps() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockNotStarted
        ]

        do {
            let model = try Warp.StepIndicatorModel(from: steps)
            XCTAssertTrue(model.steps.count == steps.count)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testWillFailWithInProgressAfterIncomplete() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockNotStarted,
            .mockInProgress
        ]

        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: steps)) { error in
            XCTAssertEqual(error as? Warp.StepIndicatorError, .stepInProgressAfterIncompleteStep)
        }
    }

    func testWillFailWithInProgressAfterAnotherInProgress() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress,
            .mockInProgress
        ]

        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: steps)) { error in
            XCTAssertEqual(error as? Warp.StepIndicatorError, .stepInProgressAfterAnotherStepInProgress)
        }
    }

    func testWillFailWithCompleteAfterInProgress() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockInProgress,
            .mockCompleted
        ]

        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: steps)) { error in
            XCTAssertEqual(error as? Warp.StepIndicatorError, .completedStepAfterInProgressStep)
        }
    }

    func testWillFailWithCompleteAfterIncomplete() {
        let steps: [Warp.StepIndicatorItem] = [
            .mockNotStarted,
            .mockCompleted
        ]

        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: steps)) { error in
            XCTAssertEqual(error as? Warp.StepIndicatorError, .completedStepAfterIncompletedStep)
        }
    }
}
