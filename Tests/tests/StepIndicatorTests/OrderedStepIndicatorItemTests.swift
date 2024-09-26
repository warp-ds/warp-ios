import XCTest
@testable import Warp

@MainActor
final class OrderedStepIndicatorItemTests: XCTestCase {
    func testCanCreateSingleItem() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted
        ]

        do {
            let orderedSteps = try Warp.StepIndicatorModel(from: steps).asOrderedSteps
            XCTAssertTrue(orderedSteps.count == 1)
            let firstStep = try XCTUnwrap(orderedSteps.first)
            let firstStepPosition = firstStep.position
            switch firstStepPosition {
            case .first(let nextProgress):
                XCTAssertNil(nextProgress)
            default:
                XCTFail("Expected this to be the first step, but it was not")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCannotCreateWithEmptyItems() {
        let steps: [Warp.StepIndicatorItem] = []

        do {
            let orderedSteps = try Warp.StepIndicatorModel(from: steps).asOrderedSteps
            XCTAssertTrue(orderedSteps.isEmpty)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateMultipleItems_FirstPositionWithNext() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress
        ]

        do {
            let orderedSteps = try Warp.StepIndicatorModel(from: steps).asOrderedSteps
            XCTAssertTrue(orderedSteps.count == 2)
            let firstStep = try XCTUnwrap(orderedSteps.first)
            let firstStepPosition = firstStep.position
            switch firstStepPosition {
            case .first(let nextProgress):
                XCTAssertEqual(nextProgress, steps[1].progress)
            default:
                XCTFail("Expected this to be the first step, but it was not")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateMultipleItems_MiddlePosition() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ]

        do {
            let orderedSteps = try Warp.StepIndicatorModel(from: steps).asOrderedSteps
            XCTAssertTrue(orderedSteps.count == 3)
            let middleStep = try XCTUnwrap(orderedSteps[1])
            let middleStepPosition = middleStep.position
            switch middleStepPosition {
            case .middle(let previousProgress, let nextProgress):
                XCTAssertEqual(previousProgress, steps[0].progress)
                XCTAssertEqual(nextProgress, steps[2].progress)
            default:
                XCTFail("Expected this to be a middle step, but it was not")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCanCreateMultipleItems_LastPosition() throws {
        let steps: [Warp.StepIndicatorItem] = [
            .mockCompleted,
            .mockInProgress
        ]

        do {
            let orderedSteps = try Warp.StepIndicatorModel(from: steps).asOrderedSteps
            XCTAssertTrue(orderedSteps.count == 2)
            let lastStep = try XCTUnwrap(orderedSteps.last)
            let lastStepPosition = lastStep.position
            switch lastStepPosition {
            case .last(let previousProgress):
                XCTAssertEqual(previousProgress, steps[0].progress)
            default:
                XCTFail("Expected this to be the last step, but it was not")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
