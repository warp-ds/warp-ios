import Foundation
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
        .stepIndicatorStateError,
        .stepIndicatorPosition
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
    func positionLabelFillsLocalizedTemplate() {
        #expect(Warp.Strings.stepIndicatorPosition.localized != Warp.Strings.stepIndicatorPosition.rawValue)
        #expect(
            Warp.StepIndicatorItem.positionLabel(number: 2, total: 5)
                == String(format: Warp.Strings.stepIndicatorPosition.localized, 2, 5)
        )
    }

    @Test
    func positionIsSpokenBeforeTitleAndState() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Payment",
            description: nil,
            progress: .inProgress,
            positionLabel: Warp.StepIndicatorItem.positionLabel(number: 2, total: 4)
        )

        let expected = [
            Warp.StepIndicatorItem.positionLabel(number: 2, total: 4),
            "Payment",
            Warp.Strings.stepIndicatorStateInProgress.localized
        ].joined(separator: ", ")

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

    @Test
    func everyProgressHasDistinctSpokenState() {
        let labels = Set(
            [Warp.StepIndicatorItem.Progress.incomplete, .inProgress, .complete, .error].map(\.accessibilityLabel)
        )

        #expect(labels.count == 4)
    }

    // MARK: - Per-language translations

    struct Translation: Sendable, CustomTestStringConvertible {
        let language: String
        let incomplete: String
        let inProgress: String
        let complete: String
        let error: String
        let position: String

        var testDescription: String { language }
    }

    @Test(arguments: [
        Translation(language: "en", incomplete: "Not started", inProgress: "In progress", complete: "Completed", error: "Error", position: "Step 2 of 5"),
        Translation(language: "nb-NO", incomplete: "Ikke påbegynt", inProgress: "Pågår", complete: "Fullført", error: "Feil", position: "Steg 2 av 5"),
        Translation(language: "sv", incomplete: "Inte påbörjad", inProgress: "Pågår", complete: "Slutförd", error: "Fel", position: "Steg 2 av 5"),
        Translation(language: "da", incomplete: "Ikke påbegyndt", inProgress: "I gang", complete: "Fuldført", error: "Fejl", position: "Trin 2 af 5"),
        Translation(language: "fi", incomplete: "Ei aloitettu", inProgress: "Kesken", complete: "Valmis", error: "Virhe", position: "Vaihe 2 / 5")
    ])
    func stepIndicatorStringsMatchCatalog(translation: Translation) throws {
        let path = try #require(NotificationBadgeStyle.bundle.path(forResource: translation.language, ofType: "lproj"))
        let bundle = try #require(Bundle(path: path))

        let states: [(Warp.Strings, String)] = [
            (.stepIndicatorStateIncomplete, translation.incomplete),
            (.stepIndicatorStateInProgress, translation.inProgress),
            (.stepIndicatorStateComplete, translation.complete),
            (.stepIndicatorStateError, translation.error)
        ]
        for (key, expected) in states {
            #expect(bundle.localizedString(forKey: key.rawValue, value: nil, table: nil) == expected)
        }

        let template = bundle.localizedString(forKey: Warp.Strings.stepIndicatorPosition.rawValue, value: nil, table: nil)
        #expect(String(format: template, 2, 5) == translation.position)
    }

    // MARK: - Separator and optional parts

    @Test
    func customSeparatorIsUsedBetweenParts() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Vehicle",
            description: "Plate",
            progress: .complete,
            positionLabel: "P",
            separator: ". "
        )

        let expected = "P. Vehicle. Plate. \(Warp.Strings.stepIndicatorStateComplete.localized)"

        #expect(label == expected)
    }

    @Test
    func nilAndEmptyPartsAreSkipped() {
        let state = Warp.Strings.stepIndicatorStateComplete.localized

        let bothNil = Warp.StepIndicatorItem.accessibilityLabel(title: nil, description: nil, progress: .complete)
        #expect(bothNil == state)

        let emptyTitle = Warp.StepIndicatorItem.accessibilityLabel(title: "", description: "Plate", progress: .complete)
        #expect(emptyTitle == "Plate, \(state)")

        let emptyPosition = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Vehicle",
            description: nil,
            progress: .complete,
            positionLabel: ""
        )
        #expect(emptyPosition == "Vehicle, \(state)")

        for label in [bothNil, emptyTitle, emptyPosition] {
            #expect(!label.hasPrefix(","))
            #expect(!label.contains(", ,"))
        }
    }

    // MARK: - Position

    @Test
    func withoutPositionLabelNothingIsPrepended() {
        let label = Warp.StepIndicatorItem.accessibilityLabel(
            title: "Vehicle",
            description: nil,
            progress: .incomplete,
            positionLabel: nil
        )

        #expect(!label.contains(Warp.StepIndicatorItem.positionLabel(number: 1, total: 3)))
        #expect(label.hasPrefix("Vehicle"))
    }

    @Test
    func positionLabelFollowsModelOrder() throws {
        let model = try Warp.StepIndicatorModel(from: [
            .init(title: "A", description: "a", progress: .complete),
            .init(title: "B", description: "b", progress: .inProgress),
            .init(title: "C", description: "c", progress: .incomplete)
        ])
        let steps = model.asOrderedSteps

        #expect(steps.map(\.index) == [1, 2, 3])
        for step in steps {
            let position = Warp.StepIndicatorItem.positionLabel(number: step.index, total: 3)
            let label = Warp.StepIndicatorItem.accessibilityLabel(
                title: step.item.title,
                description: step.item.description,
                progress: step.item.progress,
                positionLabel: position
            )

            let expected = [
                position,
                step.item.title,
                step.item.description,
                step.item.progress.accessibilityLabel
            ].joined(separator: ", ")

            #expect(label == expected)
        }
    }

    @Test
    func positionLabelContainsNumberAndTotal() {
        let label = Warp.StepIndicatorItem.positionLabel(number: 3, total: 7)

        #expect(!label.isEmpty)
        #expect(label.contains("3"))
        #expect(label.contains("7"))
        #expect(!label.contains("%"))
    }
}
