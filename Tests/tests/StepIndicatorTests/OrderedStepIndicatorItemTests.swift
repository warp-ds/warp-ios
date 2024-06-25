import XCTest
@testable import Warp

final class OrderedStepIndicatorItemTests: XCTestCase {
    func testCanCreateSingleItem() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted
        ]

        let stepIndicator = Warp.StepIndicator(stepModel: stepModel(from: steps))
        XCTAssertTrue(stepIndicator.orderedSteps.count == 1)
        let firstStep = try XCTUnwrap(stepIndicator.orderedSteps.first)
        let firstStepPosition = firstStep.position
        switch firstStepPosition {
        case .first(let nextProgress):
            XCTAssertNil(nextProgress)
        default:
            XCTFail("Expected this to be the first step, but it was not")
        }
    }

    func testCannotCreateWithEmptyItems() {
        let steps: [Warp.StepIndicatorItem] = []

        let stepIndicator = Warp.StepIndicator(stepModel: stepModel(from: steps))
        XCTAssertTrue(stepIndicator.orderedSteps.isEmpty)
    }

    func testCanCreateMultipleItems_FirstPositionWithNext() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress
        ]

        let stepIndicator = Warp.StepIndicator(stepModel: stepModel(from: steps))
        XCTAssertTrue(stepIndicator.orderedSteps.count == 2)
        let firstStep = try XCTUnwrap(stepIndicator.orderedSteps.first)
        let firstStepPosition = firstStep.position
        switch firstStepPosition {
        case .first(let nextProgress):
            XCTAssertEqual(nextProgress, steps[1].progress)
        default:
            XCTFail("Expected this to be the first step, but it was not")
        }
    }

    func testCanCreateMultipleItems_MiddlePosition() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ]

        let stepIndicator = Warp.StepIndicator(stepModel: stepModel(from: steps))
        XCTAssertTrue(stepIndicator.orderedSteps.count == 3)
        let middleStep = try XCTUnwrap(stepIndicator.orderedSteps[1])
        let middleStepPosition = middleStep.position
        switch middleStepPosition {
        case .middle(let previousProgress, let nextProgress):
            XCTAssertEqual(previousProgress, steps[0].progress)
            XCTAssertEqual(nextProgress, steps[2].progress)
        default:
            XCTFail("Expected this to be a middle step, but it was not")
        }
    }

    func testCanCreateMultipleItems_LastPosition() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress
        ]

        let stepIndicator = Warp.StepIndicator(stepModel: stepModel(from: steps))
        XCTAssertTrue(stepIndicator.orderedSteps.count == 2)
        let lastStep = try XCTUnwrap(stepIndicator.orderedSteps.last)
        let lastStepPosition = lastStep.position
        switch lastStepPosition {
        case .last(let previousProgress):
            XCTAssertEqual(previousProgress, steps[0].progress)
        default:
            XCTFail("Expected this to be the last step, but it was not")
        }
    }

    private func stepModel(from steps: [Warp.StepIndicatorItem]) -> Warp.StepIndicatorModel {
        do {
            return try Warp.StepIndicatorModel(from: steps)
        } catch {
            XCTFail(error.localizedDescription)
            return try! Warp.StepIndicatorModel(from: [])
        }
    }
}
