import XCTest
@testable import Warp

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

    func testErrorStepAllowedAnywhere() throws {
        let error = Warp.StepIndicatorItem(title: "E", description: "E", progress: .error)
        XCTAssertNoThrow(try Warp.StepIndicatorModel(from: [.mockCompleted, error, .mockNotStarted]))
        XCTAssertNoThrow(try Warp.StepIndicatorModel(from: [.mockInProgress, error]))
        XCTAssertNoThrow(try Warp.StepIndicatorModel(from: [.mockNotStarted, error]))
    }

    func testActiveOrCompletedAfterErrorThrows() {
        let error = Warp.StepIndicatorItem(title: "E", description: "E", progress: .error)
        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: [error, .mockCompleted]))
        XCTAssertThrowsError(try Warp.StepIndicatorModel(from: [error, .mockInProgress]))
    }

    func testOrderedStepsHaveOneBasedIndex() throws {
        let ordered = try Warp.StepIndicatorModel(from: [.mockCompleted, .mockInProgress, .mockNotStarted]).asOrderedSteps
        XCTAssertEqual(ordered.map(\.index), [1, 2, 3])
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
