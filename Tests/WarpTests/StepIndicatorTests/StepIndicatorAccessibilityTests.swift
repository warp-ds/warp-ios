import Testing
@testable import Warp

@Suite
struct StepIndicatorAccessibilityTests {

    init() {
        // The localized strings resolve through the bundle selected for the current theme.
        LanguageManager.shared.setLanguage()
    }

    private static let stepIndicatorCases: [Warp.Strings] = [
        .stepIndicatorStateIncomplete,
        .stepIndicatorStateInProgress,
        .stepIndicatorStateComplete,
        .stepIndicatorStateError
    ]

    // MARK: - Translations

    @Test
    func everyStepIndicatorKeyIsTranslated() {
        for key in Self.stepIndicatorCases {
            #expect(key.localized != key.rawValue, "\(key.rawValue) should have a translation")
        }
    }

    // MARK: - Progress labels

    @Test
    func everyProgressHasSpokenState() {
        let progressKeys: [(Warp.StepIndicatorItem.Progress, Warp.Strings)] = [
            (.incomplete, .stepIndicatorStateIncomplete),
            (.inProgress, .stepIndicatorStateInProgress),
            (.complete, .stepIndicatorStateComplete),
            (.error, .stepIndicatorStateError)
        ]

        for (progress, key) in progressKeys {
            #expect(!progress.accessibilityLabel.isEmpty)
            #expect(progress.accessibilityLabel != key.rawValue)
            #expect(progress.accessibilityLabel == key.localized)
        }
    }

    // MARK: - Label format

    @Test
    func middleInProgressStepJoinsTitleDescriptionAndState() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Vehicle",
            description: "Enter the registration number",
            progress: .inProgress
        )

        let expected = [
            "Vehicle",
            "Enter the registration number",
            Warp.Strings.stepIndicatorStateInProgress.localized
        ].joined(separator: ", ")

        #expect(label == expected)
    }

    @Test
    func emptyDescriptionIsSkippedWithoutDoubledSeparator() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Vehicle",
            description: "",
            progress: .complete
        )

        let expected = "Vehicle, \(Warp.Strings.stepIndicatorStateComplete.localized)"

        #expect(label == expected)
        #expect(!label.contains(", ,"))
    }

    @Test
    func errorStepReadsErrorState() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Payment",
            description: "Card was declined",
            progress: .error
        )

        let expected = "Payment, Card was declined, \(Warp.Strings.stepIndicatorStateError.localized)"

        #expect(label == expected)
    }

    @Test
    func firstStepLabelUsesItsOwnContentAndState() {
        let first = Warp.StepIndicatorItem(title: "Start", description: "Begin here", progress: .complete)

        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: first.title,
            description: first.description,
            progress: first.progress
        )

        let expected = "Start, Begin here, \(Warp.Strings.stepIndicatorStateComplete.localized)"

        #expect(label == expected)
    }

    @Test
    func lastStepLabelUsesItsOwnContentAndState() {
        let last = Warp.StepIndicatorItem(title: "Finish", description: "Almost done", progress: .incomplete)

        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: last.title,
            description: last.description,
            progress: last.progress
        )

        let expected = "Finish, Almost done, \(Warp.Strings.stepIndicatorStateIncomplete.localized)"

        #expect(label == expected)
    }
}
