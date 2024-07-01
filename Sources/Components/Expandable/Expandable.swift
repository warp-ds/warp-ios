import SwiftUI

extension Warp {
    public struct Expandable: View{
        @State var isExpanded: Bool = false
        @State var opacity: Double = 0.0

        let fadeAnimationTime: Double = 0.1
        let expandAnimationTime: Double = 0.2

        let title: String
        let subtitle: String
        let style: Warp.ExpandableStyle
        let isAnimated: Bool

        /// Object responsible for providing colors in different environments and variants.
        var colorProvider: ColorProvider = Config.colorProvider

        public init(
            isExpanded: Bool = false, // default value, not sure if this should be exposed actually
            title: String,
            subtitle: String,
            style: Warp.ExpandableStyle,
            isAnimated: Bool = true,
            colorProvider: ColorProvider = Config.colorProvider
        ) {
            self.isExpanded = isExpanded
            self.title = title
            self.subtitle = subtitle
            self.style = style
            self.isAnimated = isAnimated
            self.colorProvider = colorProvider
        }

        #warning("Rebase and use Warp.Spacing")
        public var body: some View {
            VStack(spacing: 16) {
                alwaysVisibleView

                if isExpanded {
                    expandableView
                }
            }
            .frame(maxWidth: .infinity)
            .padding(16)
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
                        withAnimation(.easeIn(duration: fadeAnimationTime)) {
                            opacity = 0
                        }

                        withAnimation(.easeOut(duration: expandAnimationTime).delay(fadeAnimationTime)) {
                            isExpanded = false
                        }
                    } else {
                        opacity = 0
                        isExpanded = false
                    }
                } else {
                    if isAnimated {
                        withAnimation(.easeIn(duration: expandAnimationTime)){
                            isExpanded = true
                        }
                        withAnimation(.easeOut(duration: fadeAnimationTime).delay(expandAnimationTime)) {
                            opacity = 1
                        }
                    } else {
                        isExpanded = true
                        opacity = 1
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
            .padding(.top, 16)
            .opacity(opacity)
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
