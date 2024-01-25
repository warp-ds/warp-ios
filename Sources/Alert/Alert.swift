import Foundation
import SwiftUI
private struct ButtonsView: View, Hashable {
    let primaryButtonProvider: Warp.Alert.ButtonConstructor?

    let secondaryButtonProvider: Warp.Alert.ButtonConstructor?

    let colorProvider: ColorProvider

    static func == (lhs: ButtonsView, rhs: ButtonsView) -> Bool {
        let primaryComparison: Bool

        switch (lhs.primaryButtonProvider, rhs.primaryButtonProvider) {
            case let (.some(lhsProvider), .some(rhsProvider)):
                primaryComparison = lhsProvider.title == rhsProvider.title

            case (nil, nil):
                primaryComparison = true

            case (.some, nil):
                primaryComparison = false

            case (nil, .some):
                primaryComparison = false
        }

        let secondaryComparison: Bool

        switch (lhs.secondaryButtonProvider, rhs.secondaryButtonProvider) {
            case let (.some(lhsProvider), .some(rhsProvider)):
                secondaryComparison = lhsProvider.title == rhsProvider.title

            case (nil, nil):
                secondaryComparison = true

            case (.some, nil):
                secondaryComparison = false

            case (nil, .some):
                secondaryComparison = false
        }

        return primaryComparison && secondaryComparison
    }

    func hash(into hasher: inout Hasher) {
        if let primaryButtonProvider {
            hasher.combine(primaryButtonProvider.title)
        }

        if let secondaryButtonProvider {
            hasher.combine(secondaryButtonProvider.title)
        }
    }

    init?(
        primaryButtonProvider: Warp.Alert.ButtonConstructor?,
        secondaryButtonProvider: Warp.Alert.ButtonConstructor?,
        colorProvider: ColorProvider
    ) {
        if primaryButtonProvider == nil, secondaryButtonProvider == nil {
            return nil
        }

        self.primaryButtonProvider = primaryButtonProvider
        self.secondaryButtonProvider = secondaryButtonProvider
        self.colorProvider = colorProvider
    }

    var body: some View {
        HStack {
            if let primaryButtonProvider {
                Warp.Button.createSecondary(
                    title: primaryButtonProvider.title,
                    action: primaryButtonProvider.action
                )
            }

            if let secondaryButtonProvider {
                Warp.Button.createTertiary(
                    title: secondaryButtonProvider.title,
                    action: secondaryButtonProvider.action
                )
            }

            Spacer()
        }
    }
}

private struct UnderlinedLinkModifier: ViewModifier {
    private var linkColor: Color {
        Color.blue
    }

    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .underline(true, color: linkColor)
        } else {
            content
                .background(lineBackground)
        }
    }

    private var lineBackground: some View {
        linkColor
            .frame(height: 1)
            .offset(y: 8)
    }
}

extension Warp.AlertStyle {
    fileprivate func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua50

            case .warning:
                return FinnColors.yellow50

            case .critical:
                return FinnColors.red50

            case .success:
                return FinnColors.green50
        }
    }

    fileprivate func getBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua300

            case .warning:
                return FinnColors.yellow300

            case .critical:
                return FinnColors.red300

            case .success:
                return FinnColors.green300
        }
    }

    fileprivate func getLeftLineColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return FinnColors.aqua500

            case .warning:
                return FinnColors.yellow500

            case .critical:
                return FinnColors.red500

            case .success:
                return FinnColors.green500
        }
    }

    fileprivate var titleImageName: String {
        switch self {
            case .info:
                return "info.circle.fill"

            case .warning, .critical:
                return "exclamationmark.circle.fill"

            case .success:
                return "checkmark.circle.fill"
        }
    }
}
}
