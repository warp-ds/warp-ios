import SwiftUI

extension View {
    /// Groups a whole step for VoiceOver.
    ///
    /// Default title: one element labelled with `accessibilityLabel(title:description:progress:)`.
    /// Custom title: the step keeps its children (`.contain`), so interactive content in the slot
    /// (such as buttons) stays separately focusable. The state is added as the value of the title
    /// slot instead, see the custom-title branch in the item views.
    @ViewBuilder
    func stepAccessibility(step: Warp.StepIndicatorItem, hasCustomTitle: Bool) -> some View {
        if hasCustomTitle {
            accessibilityElement(children: .contain)
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
