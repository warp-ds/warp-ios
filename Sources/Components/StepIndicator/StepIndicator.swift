import SwiftUI

extension Warp {
    /**
        A step indicator displays a user’s progress through a set of steps, guiding toward the completion of a specified process.

        **When to use**

        Use step indicators to keep the user on track when completing a specific set of tasks or processes.

        **Usage**

        You need to provide the `Warp.StepIndicator` with:

        - A `Warp.StepIndicator.LayoutOrientation`. **Optional:** _default is `.vertical` if none is specified_
        - An array of `Warp.StepIndicatorItem`s
        - A `ColorProvider`. **Optional:** _default is read from `Config.colorProvider` if none is specified_

     */
    public struct StepIndicator: View {
        /// Orientation of the Step Indicator
        public enum LayoutOrientation {
            case horizontal
            case vertical
        }

        let layoutOrientation: LayoutOrientation

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        internal let orderedSteps: [OrderedStepIndicatorItem]

        public init(
            layoutOrientation: LayoutOrientation = .vertical,
            steps: [StepIndicatorItem],
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.layoutOrientation = layoutOrientation
            self.orderedSteps = steps.compactMap { step in
                OrderedStepIndicatorItem(item: step, items: steps)
            }
            self.colorProvider = colorProvider
        }

        public var body: some View {
            switch layoutOrientation {
            case .horizontal:
                if #available(iOS 16.4, *) {
                    horizontalScrollView
                        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
                } else {
                    horizontalScrollView
                }
            case .vertical:
                VStack(spacing: -1) {
                    ForEach(orderedSteps) { step in
                        VerticalItemView(
                            step: step.item,
                            stepPosition: step.position
                        )
                    }
                }
            }
        }

        @ViewBuilder
        private var horizontalScrollView: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(orderedSteps) { step in
                        HorizontalItemView(
                            step: step.item,
                            stepPosition: step.position
                        )
                    }
                }
            }
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
        static func == (lhs: Warp.OrderedStepIndicatorItem, rhs: Warp.OrderedStepIndicatorItem) -> Bool {
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

#Preview("Horizontal") {
    Warp.StepIndicator(
        layoutOrientation: .horizontal,
        steps: [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ]
    )
}

#Preview("Vertical") {
    Warp.StepIndicator(
        layoutOrientation: .vertical,
        steps: [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ]
    )
}
