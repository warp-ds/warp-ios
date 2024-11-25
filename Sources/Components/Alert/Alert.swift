import Foundation
import SwiftUI

extension Warp {
    /// A view that displays high-signal messages designed to attract user attention and prompt action.
    ///
    /// This `Alert` view can be styled with different visual variants (`AlertStyle`), and it supports multiple content sections
    /// such as title, subtitle, links, and buttons. The alert adapts to various environments through the provided `ColorProvider`.
    public struct Alert: View, Hashable {
        private let alertCornerRadius = Warp.Border.borderRadius50

        /// Typealias for constructing buttons in the alert.
        public typealias ButtonConstructor = (title: String, action: () -> Void)
        
        /// The preferred style of the alert, which defines its appearance.
        private let style: AlertStyle
        
        /// The text shown at the top of the alert.
        private let title: String
        
        /// The text shown after the title, typically in the middle of the alert.
        private let subtitle: String
        
        /// A tuple that provides a title and action for creating a link view below the subtitle.
        /// Passing `nil` will skip adding the link view.
        private let linkProvider: ButtonConstructor?
        
        /// A tuple that provides a title and action for creating a primary button below the link.
        /// Passing `nil` will skip adding the primary button.
        private let primaryButtonProvider: ButtonConstructor?
        
        /// A tuple that provides a title and action for creating a secondary button below the link.
        /// Passing `nil` will skip adding the secondary button.
        private let secondaryButtonProvider: ButtonConstructor?
        
        /// Object responsible for providing colors across different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Hashing implementation for the `Alert` structure, ensuring proper usage in collections.
        public func hash(into hasher: inout Hasher) {
            hasher.combine(style)
            hasher.combine(title)
        }
        
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
        
        /// Initializes a new `Alert` view with the specified content and optional buttons.
        ///
        /// - Parameters:
        ///   - style: The visual style of the alert, which dictates its colors, icons, and overall appearance.
        ///     Use one of the predefined `AlertStyle` values: `.info`, `.warning`, `.critical`, or `.success`.
        ///   - title: The primary text displayed at the top of the alert, used to capture the user's attention.
        ///   - subtitle: Additional information displayed below the title, used to provide further context to the alert.
        ///   - link: An optional tuple containing the title and action for a clickable link that appears below the subtitle.
        ///     If `nil`, the link view will not be displayed.
        ///   - primaryButton: An optional tuple containing the title and action for a primary button.
        ///     If `nil`, the primary button will not be displayed.
        ///   - secondaryButton: An optional tuple containing the title and action for a secondary button.
        ///     If `nil`, the secondary button will not be displayed.
        public init(
            style: Warp.AlertStyle,
            title: String,
            subtitle: String,
            link: ButtonConstructor? = nil,
            primaryButton: ButtonConstructor? = nil,
            secondaryButton: ButtonConstructor? = nil
        ) {
            self.style = style
            self.title = title
            self.subtitle = subtitle
            self.linkProvider = link
            self.primaryButtonProvider = primaryButton
            self.secondaryButtonProvider = secondaryButton
        }
        
        /// The body of the alert, defining its appearance and structure.
        public var body: some View {
            foregroundView
                .background {
                    backgroundView
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
        
        // MARK: - Private Views
        
        /// The background view for the alert, including the border and background colors.
        private var backgroundView: some View {
            style.getBackgroundColor(from: colorProvider)
                .overlay(
                    RoundedRectangle(cornerRadius: alertCornerRadius)
                        .stroke(style.getBorderColor(from: colorProvider), lineWidth: 2)
                )
        }
        
        /// The foreground content of the alert, including the icon, title, subtitle, and buttons.
        private var foregroundView: some View {
            HStack(alignment: .top, spacing: 8) {
                toolTipIconView
                informationView
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
            .overlay(alignment: .leading) {
                leftLineView
                    .frame(width: 4)
            }
        }
        
        /// A view that displays a left vertical line, usually matching the alert's icon color.
        private var leftLineView: some View {
            style.getLeftLineColor(from: colorProvider)
        }
        
        /// The icon displayed at the top left of the alert.
        private var toolTipIconView: some View {
            Image(systemName: style.tooltipImageName)
                .renderingMode(.template)
                .frame(width: 16, height: 16)
                .foregroundColor(style.getIconColor(from: colorProvider))
                .accessibilityLabel(style.tooltipImageTitle)
                .offset(y: 2)
        }
        
        /// The information view, which includes the title, subtitle, link, and buttons.
        private var informationView: some View {
            VStack(alignment: .leading, spacing: 8) {
                titleView
                subtitleView
                    .fixedSize(horizontal: false, vertical: true)
                VStack(spacing: 16) {
                    linkView
                    buttonsView
                }
            }
        }
        
        /// The title text of the alert.
        private var titleView: some View {
            Warp.Text(title, style: .title4)
                .foregroundColor(colorProvider.token.text)
                .accessibilityAddTraits(.isHeader)
        }
        
        /// The subtitle text of the alert.
        private var subtitleView: some View {
            Warp.Text(subtitle, style: .body)
                .foregroundColor(colorProvider.token.text)
                .accessibilityRemoveTraits(.isHeader)
        }
        
        /// A view that displays the optional link in the alert.
        @ViewBuilder
        private var linkView: some View {
            if let linkProvider = linkProvider {
                SwiftUI.Button(
                    action: linkProvider.action,
                    label: {
                        HStack {
                            Warp.Text(
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
        
        /// A view that displays the optional primary and secondary buttons in the alert.
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
                Warp.Button(
                    title: primaryButtonProvider.title,
                    action: primaryButtonProvider.action,
                    type: .secondary
                )
            }
            
            if let secondaryButtonProvider {
                Warp.Button(
                    title: secondaryButtonProvider.title,
                    action: secondaryButtonProvider.action,
                    type: .tertiary
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

#Preview("Simple use case") {
    ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
        Warp.Alert(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            link: nil,
            primaryButton: nil,
            secondaryButton: nil
        )
    }
}

#Preview("Full experience use case") {
    ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
        Warp.Alert(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            link: (title: "Link to more information", action: {}),
            primaryButton: (title: "Button", action: {}),
            secondaryButton: (title: "Button", action: {})
        )
    }
}
