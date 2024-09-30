import SwiftUI

extension Warp {
    /**

     Expandable allows users to interact with expandable/collapsible sections of content. Also known as “accordion”

     **When to use**

     Use the Expandable component when presenting content that can be optionally revealed to users.
     Consider it for long content that may overwhelm users if displayed all at once.

     **Usage**

     Provide the `Warp.Expandable` with:

     - A `Warp.ExpandableStyle`, choose from:
     - `default`: for a non bordered expandable.
     - `box`: for a bordered expandable with rounded corners.
     - `boxBleed`: for a bordered expandable with sharp corners.
     - A `title`.
     - Either:
       - A `subtitle` String
       - An `expandableView` `View`
     - A boolean `isAnimated` to determine if the expand/collapse transition is animated or not. **Optional** _default value is `true` if none is specified_.
     - A `ColorProvider`. **Optional:** _default is read from `Warp.Color` if none is specified_.
     */
#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Expandable<Content: View>: View {
        @State private var isExpanded: Bool

        let title: String

        @ViewBuilder let expandableView: Content

        let style: Warp.ExpandableStyle
        let isAnimated: Bool

        let colorProvider: ColorProvider

        public init(
            style: Warp.ExpandableStyle,
            title: String,
            @ViewBuilder expandableView: () -> Content,
            isAnimated: Bool = true,
            isExpanded: Bool = false,
            colorProvider: ColorProvider = Warp.Color
        ) {
            self.style = style
            self.title = title
            self.expandableView = expandableView()
            self.isAnimated = isAnimated
            self.isExpanded = isExpanded
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
            SwiftUI.Button(action: {
                if isAnimated {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                } else {
                    isExpanded.toggle()
                }
            }, label: {
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
            })
            .buttonStyle(NonHighlightedButtonStyle())
        }
    }
}

// We need this to allow us to create an `Expandable` from a simple String
extension Warp.Expandable where Content == Warp.ExpandableStringWrapperView {
    public init(
        style: Warp.ExpandableStyle,
        title: String,
        subtitle: String,
        isAnimated: Bool = true,
        isExpanded: Bool = false,
        colorProvider: ColorProvider = Warp.Color
    ) {
        self.init(
            style: style,
            title: title,
            expandableView: { Warp.ExpandableStringWrapperView(subtitle: subtitle, colorProvider: colorProvider) },
            isAnimated: isAnimated,
            isExpanded: isExpanded,
            colorProvider: colorProvider
        )
    }
}

public extension Warp {
    /*
     This is a simple wrapper view to ensure that our `subtitle` String 
     looks pretty
     */
    struct ExpandableStringWrapperView: View {
        let subtitle: String
        let colorProvider: ColorProvider

        public var body: some View {
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

extension Warp {
    // This allows us to have a button for the alwaysVisible part that doesn't
    // hightlight/flash when tapped
    fileprivate struct NonHighlightedButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
        }
    }
}

#Preview("Default") {
    Warp.Expandable(
        style: .default,
        title: "Expandable box",
        subtitle: "Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. Add your text here."
    )
}

#Preview("Default -  Expanded") {
    Warp.Expandable(
        style: .default,
        title: "Expandable box",
        subtitle: "Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. Add your text here.",
        isExpanded: true
    )
}

#Preview("Box") {
    Warp.Expandable(
        style: .box,
        title: "Expandable box",
        subtitle: "Add your text here. "
    )
}

#Preview("Box Bleed") {
    Warp.Expandable(
        style: .boxBleed,
        title: "Expandable box",
        subtitle: "Add your text here. Add your text here. Add your text here. Add your text here. Add your text here. Add your text here."
    )
}

#Preview("Own Content") {
    Warp.Expandable(
        style: .box,
        title: "Can you see my custom view"
    ) {
        SwiftUI.Text("How does this look")
            .font(.title)
            .foregroundStyle(.red)
    }
}
