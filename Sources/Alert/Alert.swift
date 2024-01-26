import Foundation
import SwiftUI

extension Warp {
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
            lhs.style == rhs.style && lhs.title == rhs.title
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
                    .border(style.getBorderColor(from: colorProvider), width: 1)
            }
            .cornerRadius(4)
        }

        private var backgroundView: some View {
            style.getBackgroundColor(from: colorProvider)
        }

        private var foregroundView: some View {
            HStack(spacing: 8) {
                leftLineView
                    .frame(width: 5)

                toolTipView

                informationView
                    .padding(.vertical, 16)

                Spacer()
            }
        }

        private var leftLineView: some View {
            style.getLeftLineColor(from: colorProvider)
        }

        private var toolTipView: some View {
            VStack {
                Spacer()
                    .frame(height: 17)

                Image(systemName: style.titleImageName)
                    .foregroundStyle(style.getLeftLineColor(from: colorProvider))
                    .frame(width: 16, height: 16)
                    .padding(.leading, 8)

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
            Text(title)
                .font(from: Typography.title4)
                .foregroundColor(.black)
                .accessibilityAddTraits(.isHeader)
        }

        private var subtitleView: some View {
            Text(subtitle)
                .font(from: Typography.body)
                .foregroundColor(colorProvider.boxInfoText)
        }

        @ViewBuilder
        private var linkView: some View {
            if let linkProvider = linkProvider {
                SwiftUI.Button(
                    action: linkProvider.action,
                    label: {
                        HStack {
                            Text(linkProvider.title)
                                .font(from: Typography.caption)
                                .modifier(UnderlinedLinkModifier())

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

extension Warp.AlertStyle {
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
