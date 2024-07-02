import Foundation

extension Warp {
    public enum StepIndicatorError: Error, LocalizedError {
        case completedStepAfterIncompletedStep
        case completedStepAfterInProgressStep
        case stepInProgressAfterIncompleteStep
        case stepInProgressAfterAnotherStepInProgress

        public var errorDescription: String? {
            switch self {
            case .completedStepAfterInProgressStep:
                "You cannot add a completed step after a step in progress"
            case .completedStepAfterIncompletedStep:
                "You cannot add a completed step after an incompleted step"
            case .stepInProgressAfterIncompleteStep:
                "You cannot add a step in progress after an incompleted step"
            case .stepInProgressAfterAnotherStepInProgress:
                "You cannot add a step in progress after another step in progress"
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
             - no completed steps after an incompleted step
             - no completed steps after an inProgress step
             - one inProgress step at a time
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
                        switch currentItem.progress {
                        case .incomplete:
                            // all good
                            mutableExistingItems.append(currentItem)
                            return mutableExistingItems
                        case .inProgress:
                            // we do not accept another in progress after a step in progress
                            throw StepIndicatorError.stepInProgressAfterAnotherStepInProgress
                        case .complete:
                            // we do not accept completed steps after a step in progress
                            throw StepIndicatorError.completedStepAfterInProgressStep
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

        var asOrderedSteps: [OrderedStepIndicatorItem] {
            steps.compactMap { step in
                OrderedStepIndicatorItem(item: step, items: steps)
            }
        }

        /*
         In order to draw the lines between steps with the correct colors, we need to know the state of:

         - the next step is this is the first step
         - the previous and next steps if this is a middle step
         - the previous step if this is the last step

         To not expose that to the consumers of this API we've introduced this internal `OrderedStepIndicatorItem` which
         we map regular `StepIndicatorItem`s into when we initialize the view.

         We can then use the `position` when we want do draw lines in the `HorizontalProgressView`
         and the `VerticalProgressView`.
         */
        internal struct OrderedStepIndicatorItem: Identifiable, Equatable {
            static func == (lhs: OrderedStepIndicatorItem, rhs: OrderedStepIndicatorItem) -> Bool {
                lhs.id == rhs.id
            }

            let item: StepIndicatorItem
            let position: StepIndicatorItem.Position
            var id: UUID { item.id }

            /**
             Initialize an `OrderedStepIndicatorItem` from
             - the current `StepIndicatorItem`
             - the entire list if items (in order for us to potentially fetch previous and next items to know their progress)
             */
            init?(item: StepIndicatorItem, items: [StepIndicatorItem]) {
                guard !items.isEmpty else { return nil }
                // find index of item
                guard let itemIndex = items.firstIndex(where: { $0 == item}) else { return nil }

                self.item = item

                // is there only one item?
                if items.count == 1 {
                    self.position = .first(nextProgress: nil)
                } else {
                    // first item
                    if itemIndex == 0 {
                        // trust no one :)
                        if items.count > 1 {
                            self.position = .first(nextProgress: items[itemIndex.advanced(by: 1)].progress)
                        } else {
                            self.position = .first(nextProgress: nil)
                        }
                    } else {
                        // last item
                        if itemIndex == items.count - 1 {
                            if itemIndex > 0 {
                                let previousProgress = items[itemIndex.advanced(by: -1)].progress
                                self.position = .last(previousProgress: previousProgress)
                            } else {
                                // we should've caught this earlier but for good measure :)
                                self.position = .first(nextProgress: nil)
                            }
                        } else {
                            // middle item
                            if itemIndex > 0 && itemIndex <= items.count - 2 {
                                self.position = .middle(
                                    previousProgress: items[itemIndex.advanced(by: -1)].progress,
                                    nextProgress: items[itemIndex.advanced(by: 1)].progress
                                )
                            } else {
                                return nil
                            }
                        }
                    }
                }
            }
        }

    }
}
