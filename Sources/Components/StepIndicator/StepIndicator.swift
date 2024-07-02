import SwiftUI

extension Warp {
    /**
        A step indicator displays a user’s progress through a set of steps, guiding toward the completion of a specified process.

        **When to use**

        Use step indicators to keep the user on track when completing a specific set of tasks or processes.

        **Usage**

        Provide the `Warp.StepIndicator` with:

        - A `Warp.StepIndicator.LayoutOrientation`. **Optional:** _default is `.vertical` if none is specified_.
        - An array of `Warp.StepIndicatorItem`s.
        - A `ColorProvider`. **Optional:** _default is read from `Config.colorProvider` if none is specified_.

     */
    public struct StepIndicator: View {
        /// Orientation of the Step Indicator
        public enum LayoutOrientation {
            case horizontal
            case vertical
        }

        let layoutOrientation: LayoutOrientation

        let colorProvider: ColorProvider

        private let orderedSteps: [StepIndicatorModel.OrderedStepIndicatorItem]

        public init(
            layoutOrientation: LayoutOrientation = .vertical,
            stepModel: Warp.StepIndicatorModel,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.layoutOrientation = layoutOrientation
            self.orderedSteps = stepModel.asOrderedSteps
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
            .padding(.bottom, 1)
        }
    }
}

#Preview("Horizontal") {
    do {
        let stepModel = try Warp.StepIndicatorModel(from: [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ])

        return Warp.StepIndicator(
            layoutOrientation: .horizontal,
            stepModel: stepModel
        )
    } catch {
        return EmptyView()
    }
}

#Preview("Vertical") {
    do {
        let stepModel = try Warp.StepIndicatorModel(from: [
            .mockCompleted,
            .mockInProgress,
            .mockNotStarted
        ])

        return Warp.StepIndicator(
            layoutOrientation: .vertical,
            stepModel: stepModel
        )
    } catch {
        return EmptyView()
    }
}
