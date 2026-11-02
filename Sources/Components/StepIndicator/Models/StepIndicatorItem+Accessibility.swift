import SwiftUI

extension View {
    /// Groups a whole step for VoiceOver.
    ///
    /// Default title: one element labelled with `accessibilityLabel(title:description:progress:)`.
    /// Custom title: the step keeps its children (`.contain`), so interactive content in the slot
    /// (such as buttons) stays separately focusable. The state is added as the value of the title
    /// slot instead, see the custom-title branch in the item views.
    @ViewBuilder
    func stepAccessibility(step: Warp.StepIndicatorItem, hasCustomTitle: Bool, positionLabel: String? = nil) -> some View {
        if hasCustomTitle {
            accessibilityElement(children: .contain)
        } else {
            accessibilityElement(children: .ignore)
                .accessibilityLabel(
                    Warp.StepIndicatorItem.accessibilityLabel(
                        title: step.title,
                        description: step.description,
                        progress: step.progress,
                        positionLabel: positionLabel
                    )
                )
        }
    }
}

extension Warp.StepIndicatorItem {
    /// Spoken position of a numbered step, e.g. "Step 2 of 5".
    static func positionLabel(number: Int, total: Int) -> String {
        String(format: Warp.Strings.stepIndicatorPosition.localized, number, total)
    }

    /// Spoken label of a whole step: position (if any), title, description, then state, joined by `separator`.
    ///
    /// Same parts and order as Android's `WarpStepIndicator`: the step text first, then the state
    /// (Android exposes it as `stateDescription`). Empty or `nil` title/description are skipped.
    static func accessibilityLabel(
        title: String?,
        description: String?,
        progress: Progress,
        positionLabel: String? = nil,
        separator: String = ", "
    ) -> String {
        [positionLabel, title, description, progress.accessibilityLabel]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
            .joined(separator: separator)
    }
}
