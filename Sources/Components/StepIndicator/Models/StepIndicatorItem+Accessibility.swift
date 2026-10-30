import SwiftUI

extension View {
    /// Makes a whole step a single VoiceOver element.
    ///
    /// Default title: one element labelled with `accessibilityLabel(title:description:progress:)`.
    /// Custom title: its own accessibility content is kept (combined) and the state is added as the
    /// value, like Android's `stateDescription`, because the title text is unknown to us.
    @ViewBuilder
    func stepAccessibility(step: Warp.StepIndicatorItem, hasCustomTitle: Bool) -> some View {
        if hasCustomTitle {
            accessibilityElement(children: .combine)
                .accessibilityValue(step.progress.accessibilityLabel)
        } else {
            accessibilityElement(children: .ignore)
                .accessibilityLabel(
                    Warp.StepIndicatorItem.accessibilityLabel(
                        title: step.title,
                        description: step.description,
                        progress: step.progress
                    )
                )
        }
    }
}

extension Warp.StepIndicatorItem {
    /// Spoken label of a whole step: title, description, then state, joined by `separator`.
    ///
    /// Same parts and order as Android's `WarpStepIndicator`: the step text first, then the state
    /// (Android exposes it as `stateDescription`). Empty or `nil` title/description are skipped.
    static func accessibilityLabel(
        title: String?,
        description: String?,
        progress: Progress,
        separator: String = ", "
    ) -> String {
        [title, description, progress.accessibilityLabel]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: separator)
    }
}
