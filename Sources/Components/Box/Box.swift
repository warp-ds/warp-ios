import Foundation
import SwiftUI

extension Warp {
    private static let boxCornerRadius = 8.0

    /// Box is a layout component to display information in addition to the main content of a page.
    public struct Box: View, Hashable {
        /// Preferred style of box.
        let style: BoxStyle
        
        /// Flag indicating tooltip image should be shown.
        let shouldShowToolTipImage: Bool
        
        /// Text that will be shown as box's heading.
        let title: String?
        
        /// Text that will be shown after title in the middle of the box.
        let subtitle: String

        /// Optional badge that will be beside the title.
        let badge: Badge?

        public typealias ButtonConstructor = (title: String, action: () -> Void)
        
        /// The optional title and an action for creating a link view below subtitle.
        /// Passing `nil` will skip adding link view.
        let linkProvider: ButtonConstructor?

        /// The optional button view below link.
        /// Passing `nil` will skip adding button view.
        let buttonProvider: Warp.Button?

        /// Object responsible for providing colors in different environments and variants.
        let colorProvider: ColorProvider = Warp.Color

        public static func == (lhs: Box, rhs: Box) -> Bool {
            let styleComparison = lhs.style == rhs.style
            lazy var titleComparison = lhs.title == rhs.title
            lazy var badgeComparison = lhs.badge == rhs.badge
            lazy var iconComparison = lhs.shouldShowToolTipImage == rhs.shouldShowToolTipImage
            lazy var subtitleComparison = lhs.subtitle == rhs.subtitle
            lazy var linkProviderComparison = lhs.linkProvider?.title == rhs.linkProvider?.title
            lazy var buttonProviderComparison = lhs.buttonProvider == rhs.buttonProvider
            
            return styleComparison &&
            titleComparison &&
            badgeComparison &&
            iconComparison &&
            subtitleComparison &&
            linkProviderComparison &&
            buttonProviderComparison
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(style)
            hasher.combine(title)
            hasher.combine(subtitle)
        }
        
        public init(
            style: Warp.BoxStyle,
            title: String?,
            badge: Badge? = nil,
            shouldShowToolTipImage: Bool = true,
            subtitle: String,
            link: ButtonConstructor? = nil,
            button: Warp.Button? = nil
        ) {
            self.style = style
            self.title = title
            self.badge = badge
            self.shouldShowToolTipImage = shouldShowToolTipImage
            self.subtitle = subtitle
            self.linkProvider = link
            self.buttonProvider = button
        }

        public var body: some View {
            ZStack {
                backgroundView
                
                foregroundView
                    .padding(.all, 24)
            }
            .cornerRadius(boxCornerRadius)
            .accessibilityElement(children: .combine)
            .modifier(
                AccessibilityTraitBuilder(
                    buttonProvider: buttonProvider,
                    linkProvider: linkProvider
                )
            )
            .modifier(AccessibilityButtonActionBuilder(buttonProvider: buttonProvider))
        }
        
        private var backgroundView: some View {
            style.getBackgroundColor(from: colorProvider)
            // View with rounded edges,
            // and optional border.
                .overlay(borderView)
        }
        
        @ViewBuilder
        private var borderView: some View {
            RoundedRectangle(cornerRadius: boxCornerRadius)
                .stroke(style.getBorderColor(from: colorProvider), lineWidth: 2)
        }
        
        private var foregroundView: some View {
            HStack(spacing: 8) {
                toolTipIconView
                    .accessibilityHidden(true)
                
                informationView
                    .padding(.leading, 8)

                Spacer()
            }
        }
        
        @ViewBuilder
        private var toolTipIconView: some View {
            if shouldShowToolTipImage {
                VStack {
                    Warp.IconView(.checkShield)
                        .foregroundColor(colorProvider.token.iconSelected)
                    
                    Spacer()
                }
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
            }
        }
        
        @ViewBuilder
        private var titleView: some View {
            HStack(spacing: Spacing.spacing200) {
                if let title, !title.isEmpty {
                    Text(title, style: .title3)
                        .foregroundColor(colorProvider.token.text)
                        .accessibilityAddTraits(.isHeader)
                }
                if let badge {
                    badge
                }
            }
        }
        
        private var subtitleView: some View {
            Text(subtitle, style: .body)
                .foregroundColor(colorProvider.token.text)
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
            ButtonView(
                buttonProvider: buttonProvider,
                colorProvider: colorProvider
            )
        }
    }
}

private struct AccessibilityTraitBuilder: ViewModifier {
    let buttonProvider: Warp.Button?
    let linkProvider: Warp.Box.ButtonConstructor?
    
    func body(content: Content) -> some View {
        switch (linkProvider, buttonProvider) {
        case (.some, .some):
            content
                .accessibilityAddTraits(.isLink)
                .accessibilityAddTraits(.isButton)
            
        case (.some, .none):
            content
                .accessibilityAddTraits(.isLink)
            
        case (.none, .some):
            content
                .accessibilityAddTraits(.isButton)
            
        case (.none, .none):
            content
                .accessibilityAddTraits(.isStaticText)
        }
    }
}

private struct AccessibilityButtonActionBuilder: ViewModifier {
    let buttonProvider: Warp.Button?

    func body(content: Content) -> some View {
        if let buttonProvider {
            content
                .accessibilityAction(.default, buttonProvider.action)
        } else {
            content
        }
    }
}

private struct ButtonView: View, Hashable {
    let buttonProvider: Warp.Button

    let colorProvider: ColorProvider
    
    static func == (lhs: ButtonView, rhs: ButtonView) -> Bool {
        lhs.buttonProvider == rhs.buttonProvider
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(buttonProvider)
    }
    
    init?(
        buttonProvider: Warp.Button?,
        colorProvider: ColorProvider
    ) {
        guard let buttonProvider else {
            return nil
        }
        
        self.buttonProvider = buttonProvider
        self.colorProvider = colorProvider
    }
    
    var body: some View {
        HStack {
            buttonProvider

            Spacer()
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

extension Warp.BoxStyle {
    fileprivate func getBackgroundColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .neutral:
            return colorProvider.token.backgroundSubtle
            
        case .info:
            return colorProvider.token.backgroundInfoSubtle
            
        case .bordered:
            return colorProvider.token.background
        }
    }
    
    fileprivate func getBorderColor(from colorProvider: ColorProvider) -> Color {
        switch self {
        case .bordered:
            return colorProvider.token.border
            
        default:
            return colorProvider.token.backgroundTransparent0
        }
    }
}

#Preview("Simple use case") {
    ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
        Warp.Box(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information."
        )
    }
}

#Preview("Full experience use case") {
    ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
        Warp.Box(
            style: style,
            title: "Title",
            subtitle: "Use this variant to call extra attention to useful, contextual information.",
            link: (title: "Link to more information", action: {}),
            button: Warp.Button(title: "Button") {}
        )
    }
}
