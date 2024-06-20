import SwiftUI

extension Warp {
    public struct StepIndicator: View {
        public enum LayoutOrientation {
            case horizontal
            case vertical
        }
        let layoutOrientation: LayoutOrientation

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        fileprivate let orderedSteps: [OrderedStepIndicatorItem]

        public init(
            layoutOrientation: LayoutOrientation,
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
                            stepLocation: step.location
                        )
                    }
                }
            }
        }

        @ViewBuilder
        private var horizontalScrollView: some View {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(orderedSteps) { step in
                        HorizontalItemView(
                            step: step.item,
                            stepLocation: step.location
                        )
                    }
                }
            }
        }
    }

    fileprivate struct OrderedStepIndicatorItem: Identifiable {
        let item: StepIndicatorItem
        let location: StepIndicatorItem.StepLocation
        var id: UUID {
            item.id
        }

        init?(item: StepIndicatorItem, items: [StepIndicatorItem]) {
            guard !items.isEmpty else { return nil }
            // find index of item
            guard let itemIndex = items.firstIndex(where: { $0 == item}) else { return nil }

            self.item = item

            // is there only one item?
            if items.count == 1 {
                self.location = .first(nextProgress: nil)
            } else {
                // first item
                if itemIndex == 0 {
                    // trust no one :)
                    if items.count > 1 {
                        self.location = .first(nextProgress: items[1].progress)
                    } else {
                        self.location = .first(nextProgress: nil)
                    }
                } else {
                    // last item
                    if itemIndex == items.count - 1 {
                        if itemIndex > 0 {
                            let previousProgress = items[itemIndex - 1].progress
                           self.location = .last(previousProgress: previousProgress)
                        } else {
                            self.location = .first(nextProgress: nil)
                        }
                    } else {
                        // middle item
                        let previousProgress = items[itemIndex - 1].progress
                       if itemIndex > 0 && itemIndex <= items.count - 2 {
                            self.location = .middle(
                                previousProgress: previousProgress,
                                nextProgress: items[itemIndex + 1].progress
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
