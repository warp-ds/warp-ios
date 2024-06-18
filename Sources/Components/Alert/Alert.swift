import Foundation
import SwiftUI

@MainActor extension Warp {
    private static let alertCornerRadius = 4.0

    /// View that show high-signal messages meant to be noticed and prompting users to take action.
    public struct Alert: View, Hashable {
        /// Preferred style of alert.
        let style: AlertStyle
        
        /// Text that will be shown at the top of alert.
        let title: String
        
        /// Text that will be shown after title in the middle of the alert.
        let subtitle: String

        public typealias ButtonConstructor = (title: String, action: () -> Void)
        
        /// Tuple that will provide a title and an action for creating a link view below subtitle.
        /// Passing `nil` will skip adding link view.
        let linkProvider: ButtonConstructor?
        
        /// Tuple that will provide a title and an action for creating a primary button view below link.
        /// Passing `nil` will skip adding primary button view.
        let primaryButtonProvider: ButtonConstructor?
        
        /// Tuple that will provide a title and an action for creating a secondary button view below link.
        /// Passing `nil` will skip adding secondary button view.
        let secondaryButtonProvider: ButtonConstructor?
        
        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider

        public static func == (lhs: Alert, rhs: Alert) -> Bool {
            let styleComparison = lhs.style == rhs.style
            lazy var titleComparison = lhs.title == rhs.title
            lazy var subtitleComparison = lhs.subtitle == rhs.subtitle
            lazy var linkProviderComparison = lhs.linkProvider?.title == rhs.linkProvider?.title
            lazy var primaryButtonProviderComparison = lhs.primaryButtonProvider?.title == rhs.primaryButtonProvider?.title
            lazy var secondaryButtonProviderComparison = lhs.secondaryButtonProvider?.title == rhs.secondaryButtonProvider?.title

            return styleComparison &&
            titleComparison &&
            subtitleComparison &&
            linkProviderComparison &&
            primaryButtonProviderComparison &&
            secondaryButtonProviderComparison
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(style)
            hasher.combine(title)
        }

        public init(
            style: Warp.AlertStyle,
            title: String,
            subtitle: String,
            link: ButtonConstructor? = nil,
            primaryButton: ButtonConstructor? = nil,
            secondaryButton: ButtonConstructor? = nil,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.style = style
            self.title = title
            self.subtitle = subtitle
            self.linkProvider = link
            self.primaryButtonProvider = primaryButton
            self.secondaryButtonProvider = secondaryButton
            self.colorProvider = colorProvider
        }

        init(
            style: Warp.AlertStyle,
            title: String,
            subtitle: String,
            linkProvider: ButtonConstructor?,
            primaryButtonProvider: ButtonConstructor?,
            secondaryButtonProvider: ButtonConstructor?,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.style = style
            self.title = title
            self.subtitle = subtitle
            self.linkProvider = linkProvider
            self.primaryButtonProvider = primaryButtonProvider
            self.secondaryButtonProvider = secondaryButtonProvider
            self.colorProvider = colorProvider
        }

        public var body: some View {
            ZStack {
                backgroundView

                foregroundView
            }
            .cornerRadius(alertCornerRadius)
            .accessibilityElement(children: .combine)
            .modifier(
                AccessibilityTraitBuilder(
                    primaryButtonProvider: primaryButtonProvider,
                    secondaryButtonProvider: secondaryButtonProvider,
                    linkProvider: linkProvider
                )
            )
            .modifier(
                AccessibilityButtonActionBuilder(
                    primaryButtonProvider: primaryButtonProvider,
                    secondaryButtonProvider: secondaryButtonProvider
                )
            )
        }

        private var backgroundView: some View {
            style.getBackgroundColor(from: colorProvider)
                // Border with rounded edges.
                .overlay(
                    RoundedRectangle(cornerRadius: alertCornerRadius)
                        .stroke(style.getBorderColor(from: colorProvider), lineWidth: 2)
                )
        }

        private var foregroundView: some View {
            HStack(spacing: 8) {
                leftLineView
                    .frame(width: 5)

                toolTipIconView

                informationView
                    .padding(.vertical, 16)

                Spacer()
            }
        }

        private var leftLineView: some View {
            style.getLeftLineColor(from: colorProvider)
        }

        private var toolTipIconView: some View {
            VStack {
                Spacer()
                    .frame(height: 17)

                Image(systemName: style.tooltipImageName)
                    .renderingMode(.template)
                    .frame(width: 16, height: 16)
                    .foregroundColor(style.getLeftLineColor(from: colorProvider))
                    .padding(.leading, 8)
                    .accessibilityLabel(style.tooltipImageTitle)

                Spacer()
            }
        }

        private var informationView: some View {
            VStack(alignment: .leading, spacing: 8) {
                titleView

                subtitleView

                linkView
                    .padding(.vertical, 8)

                buttonsView
                    .padding(.top, 4)
                    .padding(.bottom, 8)
            }
        }

        private var titleView: some View {
            Text(title, style: .title4)
                .foregroundColor(style.getTextColor(from: colorProvider))
                .accessibilityAddTraits(.isHeader)
        }

        private var subtitleView: some View {
            Text(subtitle, style: .body)
                .foregroundColor(colorProvider.boxInfoText)
                .accessibilityRemoveTraits(.isHeader)
        }

        @ViewBuilder
        private var linkView: some View {
            if let linkProvider = linkProvider {
                SwiftUI.Button(
                    action: linkProvider.action,
                    label: {
                        HStack {
                            Text(
                                linkProvider.title,
                                style: .caption,
                                color: colorProvider.token.textLink
                            )
                            .modifier(UnderlinedLinkModifier(colorProvider: colorProvider))

                            Spacer()
                        }
                    }
                )
                .accessibilityRemoveTraits(.isButton)
                .accessibilityAddTraits(.isLink)
            }
        }

        private var buttonsView: some View {
            ButtonsView(
                primaryButtonProvider: primaryButtonProvider,
                secondaryButtonProvider: secondaryButtonProvider,
                colorProvider: colorProvider
            )
        }
    }
}

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

private struct AccessibilityTraitBuilder: ViewModifier {
    let primaryButtonProvider: Warp.Alert.ButtonConstructor?
    let secondaryButtonProvider: Warp.Alert.ButtonConstructor?
    let linkProvider: Warp.Alert.ButtonConstructor?

    func body(content: Content) -> some View {
        let hasButton: Bool = {
            let isPrimaryButtonAvailable = primaryButtonProvider != nil
            lazy var isSecondaryButtonAvailable = primaryButtonProvider != nil

            return isPrimaryButtonAvailable || isSecondaryButtonAvailable
        }()

        let hasLink = linkProvider != nil

        switch (hasLink, hasButton) {
            case (true, true):
                content
                    .accessibilityAddTraits(.isLink)
                    .accessibilityAddTraits(.isButton)

            case (true, false):
                content
                    .accessibilityAddTraits(.isLink)

            case (false, true):
                content
                    .accessibilityAddTraits(.isButton)

            case (false, false):
                content
                    .accessibilityAddTraits(.isStaticText)
        }
    }
}

private struct AccessibilityButtonActionBuilder: ViewModifier {
    let primaryButtonProvider: Warp.Alert.ButtonConstructor?
    let secondaryButtonProvider: Warp.Alert.ButtonConstructor?

    func body(content: Content) -> some View {
        switch (primaryButtonProvider, secondaryButtonProvider) {
            case (.some(let primaryButtonProvider), .some(let secondaryButtonProvider)):
                content
                    .accessibilityAction(.default, primaryButtonProvider.action)
                    .accessibilityAction(.escape, secondaryButtonProvider.action)

            case (.some(let buttonProvider), .none):
                content
                    .accessibilityAction(.default, buttonProvider.action)

            case (.none, .some(let buttonProvider)):
                content
                    .accessibilityAction(.default, buttonProvider.action)

            case (.none, .none):
                content
        }
    }
}

private struct UnderlinedLinkModifier: ViewModifier {
    let colorProvider: ColorProvider

    private var linkColor: Color {
        colorProvider.token.textLink
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

@MainActor extension Warp.AlertStyle {
    fileprivate func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return colorProvider.alertInfoBackground

            case .warning:
                return colorProvider.alertWarningBackground

            case .critical:
                return colorProvider.alertNegativeBackground

            case .success:
                return colorProvider.alertPositiveBackground
        }
    }

    fileprivate func getBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return colorProvider.alertInfoSubtleBorder

            case .warning:
                return colorProvider.alertWarningSubtleBorder

            case .critical:
                return colorProvider.alertNegativeSubtleBorder

            case .success:
                return colorProvider.alertPositiveSubtleBorder
        }
    }

    fileprivate func getLeftLineColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return colorProvider.alertInfoIcon

            case .warning:
                return colorProvider.alertWarningIcon

            case .critical:
                return colorProvider.alertNegativeIcon

            case .success:
                return colorProvider.alertPositiveIcon
        }
    }

    fileprivate func getTextColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return colorProvider.alertInfoText

            case .warning:
                return colorProvider.alertWarningText

            case .critical:
                return colorProvider.alertNegativeText

            case .success:
                return colorProvider.alertPositiveText
        }
    }

    fileprivate var tooltipImageName: String {
        switch self {
        case .info:
            return "exclamationmark.circle.fill"
            
        case .warning:
            return "exclamationmark.triangle.fill"
            
        case .critical:
            return "exclamationmark.octagon.fill"
            
        case .success:
            return "exclamationmark.circle.fill"
        }
    }

    fileprivate var tooltipImageTitle: String {
        switch self {
            case .info:
                return "Info"

            case .warning:
                return "Warning"

            case .critical:
                return "Error"

            case .success:
                return "Success"
        }
    }

    fileprivate func getToolTipIconColor(from colorProvider: ColorProvider) -> Color {
        switch self {
            case .info:
                return colorProvider.alertInfoIcon

            case .warning:
                return colorProvider.alertWarningIcon

            case .critical:
                return colorProvider.alertNegativeIcon

            case .success:
                return colorProvider.alertPositiveIcon
        }
    }
}

@MainActor extension Warp.AlertStyle {
    fileprivate static var allCases: [Warp.AlertStyle] = [
        .info,
        .warning,
        .critical,
        .success
    ]
}

#Preview("Simple use case") {
    ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
        Warp.Alert(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            linkProvider: nil,
            primaryButtonProvider: nil,
            secondaryButtonProvider: nil
        )
    }
}

#Preview("Full experience use case") {
    ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
        Warp.Alert(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            linkProvider: (title: "Link to more information", action: {}),
            primaryButtonProvider: (title: "Button", action: {}),
            secondaryButtonProvider: (title: "Button", action: {})
        )
    }
}
