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
        - `numbered`: when `true`, active and upcoming steps show their 1-based step number.
          Completed steps keep the checkmark and error steps keep the X icon. **Optional:** _default is `false`_.

     */
    public struct StepIndicator: View {
        /// Orientation of the Step Indicator
        public enum LayoutOrientation: Sendable {
            case horizontal
            case vertical
        }

        let layoutOrientation: LayoutOrientation
        let numbered: Bool

        /// The current theme from the environment.
        @Environment(\.warpTheme) private var theme

        /// Object responsible for providing colors in different environments and variants.
        private var colorProvider: ColorProvider {
            theme.colors
        }

        private let orderedSteps: [StepIndicatorModel.OrderedStepIndicatorItem]

        public init(
            layoutOrientation: LayoutOrientation = .vertical,
            numbered: Bool = false,
            stepModel: Warp.StepIndicatorModel
        ) {
            self.layoutOrientation = layoutOrientation
            self.numbered = numbered
            self.orderedSteps = stepModel.asOrderedSteps
        }

        public var body: some View {
            switch layoutOrientation {
            case .horizontal:
                horizontalScrollView
                    .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            case .vertical:
                VStack(spacing: -1) {
                    ForEach(orderedSteps) { step in
                        VerticalItemView(
                            step: step.item,
                            stepPosition: step.position,
                            number: numbered ? step.index : nil
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
                            stepPosition: step.position,
                            number: numbered ? step.index : nil
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
