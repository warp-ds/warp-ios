import SwiftUI

extension Warp {
    /**

    Expandable allows users to interact with expandable/collapsible sections of content. Also known as “accordion”

    **When to use**

     Use the Expandable component when presenting content that can be optionally revealed to users.
     Consider it for long content that may overwhelm users if displayed all at once.

     **Usage**

     Provide the `Warp.Expandable` with:

     - A title.
     - A subtitle.
     - A `Warp.ExpandableStyle`, choose from:
        - `default`: for a non bordered expandable.
        - `box`: for a bordered expandable with rounded corners.
        - `boxBleed`: for a bordered expandable with sharp corners.
     - A boolean `isAnimated` to determine if the expand/collapse transition is animated or not. **Optional** _default value is `true` if none is specified_.
     - A `ColorProvider`. **Optional:** _default is read from `Config.colorProvider` if none is specified_.
     */
    public struct Expandable: View {
        /**
        **Collapsed by default**

         Expendables begins in the collapsed state with all content panels closed.
         Starting in a collapsed state gives the user a high-level overview of the available information.
        */
        @State private var isExpanded: Bool = false

        private let fadeAnimationTime: Double = 0.1
        private let expandAnimationTime: Double = 0.2

        let title: String
        let subtitle: String
        let style: Warp.ExpandableStyle
        let isAnimated: Bool

        let colorProvider: ColorProvider

        public init(
            title: String,
            subtitle: String,
            style: Warp.ExpandableStyle,
            isAnimated: Bool = true,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.title = title
            self.subtitle = subtitle
            self.style = style
            self.isAnimated = isAnimated
            self.colorProvider = colorProvider
        }

        public var body: some View {
            VStack(spacing: Warp.Spacing.spacing200) {
                alwaysVisibleView

                if isExpanded {
                    expandableView
                }
            }
            .frame(maxWidth: .infinity)
            .padding(Warp.Spacing.spacing200)
            .background(style.backgroundColor(using: colorProvider))
            .cornerRadius(style.cornerRadius)
        }

        @ViewBuilder private var alwaysVisibleView: some View {
            HStack {
                Warp.Text(
                    title,
                    style: .bodyStrong,
                    color: colorProvider.expandableTitleText
                )

                if style != .default {
                    Spacer()
                }

                Image("icon-expandable-chevron", bundle: .module)
                    .renderingMode(.template)
                    .foregroundColor(colorProvider.expandableIcon)
                    .frame(width: 16, height: 16)
                    .rotationEffect(.degrees(isExpanded ? 180 : 0))

                if style == .default {
                    Spacer()
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                if isExpanded {
                    if isAnimated {
                        withAnimation(.easeInOut) {
                            isExpanded = false
                        }
                    } else {
                        isExpanded = false
                    }
                } else {
                    if isAnimated {
                        withAnimation(.easeInOut) {
                            isExpanded = true
                        }
                    } else {
                        isExpanded = true
                    }
                }
            }
        }

        @ViewBuilder private var expandableView: some View {
            VStack(spacing: 0) {
                HStack {
                    Warp.Text(
                        subtitle,
                        style: .body,
                        color: colorProvider.expandableParagraphText
                    )

                    Spacer()
                }
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview("Default") {
    Warp.Expandable(
        title: "Expandable box",
        subtitle: "Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. ",
        style: .default
    )
}

#Preview("Box") {
    Warp.Expandable(
        title: "Expandable box",
        subtitle: "Add your text here. ",
        style: .box
    )
}
#Preview("Box Bleed") {
    Warp.Expandable(
        title: "Expandable box",
        subtitle: "Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. ",
        style: .boxBleed
    )
}
