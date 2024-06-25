import Foundation

extension Warp {
    public enum StepIndicatorError: Error, LocalizedError {
        case stepInProgressAfterIncompleteStep
        case completedStepAfterIncompletedStep
        case completedStepAfterInProgressStep

        public var errorDescription: String? {
            switch self {
            case .completedStepAfterInProgressStep:
                "You cannot add a completed step after a step in progress"
            case .completedStepAfterIncompletedStep:
                "You cannot add a completed step after an incompleted step"
            case .stepInProgressAfterIncompleteStep:
                "You cannot add a step in progress after an incompleted step"
            }
        }
    }

    /**
    A model to be used with the `StepIndicator`

    The purpose of the `StepIndicatorModel` is to ensure that you can not create a `StepIndicator` with steps in a not valid order.
     
    That means that you can not:

    - add an `.inProgress` or `.complete` step after a `.incomplete` step
    - add a `.complete` step after an `.inProgress` step

    Doing so will throw an error on `init`
     */
    public struct StepIndicatorModel {
        public let steps: [Warp.StepIndicatorItem]

        /**

        - Parameters
            - steps: The steps to create a `StepIndicatorModel` from
        - throws: Warp.StepIndicatorError if a wrong order of steps is presented
         */
        public init(from steps: [Warp.StepIndicatorItem]) throws {
            /* 
             run through all steps and ensure that there are
             - no inProgress steps after an incompleted step
             - no incomplete steps after an incompleted step
             - no completed steps after an in progress step
             */

            try self.steps = steps.reduce([Warp.StepIndicatorItem]()) { (existingItems, currentItem) in
                var mutableExistingItems = existingItems
                // what is the previous step, if any?
                if let previousStep = existingItems.last {
                    switch previousStep.progress {
                    case .complete: // all good, everything can follow a completed step
                        mutableExistingItems.append(currentItem)
                        return mutableExistingItems
                    case .inProgress:
                        // we do not accept completed steps after a step in progress
                        if currentItem.progress == .complete {
                            throw StepIndicatorError.completedStepAfterInProgressStep
                        } else {
                            mutableExistingItems.append(currentItem)
                            return mutableExistingItems
                        }
                    case .incomplete:
                        switch currentItem.progress {
                        case .incomplete:
                            // all good
                            mutableExistingItems.append(currentItem)
                            return mutableExistingItems
                        case .inProgress:
                            // we do not accept a step in progress _after_ an incomplete step
                            throw StepIndicatorError.stepInProgressAfterIncompleteStep
                        case .complete:
                            // we do not accept a completed step _after_ an incomplete step
                            throw StepIndicatorError.completedStepAfterIncompletedStep
                        }
                    }
                } else {
                    mutableExistingItems.append(currentItem)
                    return mutableExistingItems
                }
            }
        }
    }
}
