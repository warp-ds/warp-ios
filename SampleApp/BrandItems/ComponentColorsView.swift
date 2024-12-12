import SwiftUI
import Warp

struct ComponentColorsView: View {
    private let colorProvider = Warp.Color

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "badgeNeutralBackground",
                           colors: [colorProvider.badgeNeutralBackground])
                createView(for: "badgePositiveBackground",
                           colors: [colorProvider.badgePositiveBackground])
                createView(for: "badgeInfoBackground",
                           colors: [colorProvider.badgeInfoBackground])
                createView(for: "badgeWarningBackground",
                           colors: [colorProvider.badgeWarningBackground])
                createView(for: "badgeNegativeBackground",
                           colors: [colorProvider.badgeNegativeBackground])
                createView(for: "badgeSponsoredBackground",
                           colors: [colorProvider.badgeSponsoredBackground])
                createView(for: "badgePriceBackground",
                           colors: [colorProvider.badgePriceBackground])
                createView(for: "buttonPrimaryBackground",
                           colors: [colorProvider.buttonPrimaryBackground])
                createView(for: "buttonPrimaryBackgroundHover",
                           colors: [colorProvider.buttonPrimaryBackgroundHover])
                createView(for: "buttonPrimaryBackgroundActive",
                           colors: [colorProvider.buttonPrimaryBackgroundActive])
                createView(for: "buttonPillBackgroundHover",
                           colors: [colorProvider.buttonPillBackgroundHover])
                createView(for: "buttonPillBackgroundActive",
                           colors: [colorProvider.buttonPillBackgroundActive])
                createView(for: "calloutBackground",
                           colors: [colorProvider.calloutBackground])
                createView(for: "calloutBorder",
                           colors: [colorProvider.calloutBorder])
                createView(for: "cardBackground",
                           colors: [colorProvider.cardBackground])
                createView(for: "navbarIconSelected",
                           colors: [colorProvider.navbarIconSelected])
                createView(for: "navbarBorderSelected",
                           colors: [colorProvider.navbarBorderSelected])
                createView(for: "pageIndicatorBackground",
                           colors: [colorProvider.pageIndicatorBackground])
                createView(for: "pageIndicatorBackgroundHover",
                           colors: [colorProvider.pageIndicatorBackgroundHover])
                createView(for: "pillSuggestionBackground",
                           colors: [colorProvider.pillSuggestionBackground])
                createView(for: "pillSuggestionBackgroundHover",
                           colors: [colorProvider.pillSuggestionBackgroundHover])
                createView(for: "pillSuggestionBackgroundActive",
                           colors: [colorProvider.pillSuggestionBackgroundActive])
                createView(for: "tooltipBackgroundStatic",
                           colors: [colorProvider.tooltipBackgroundStatic])
                createView(for: "switchHandleBackground",
                           colors: [colorProvider.switchHandleBackground])
                createView(for: "switchHandleBackgroundHover",
                           colors: [colorProvider.switchHandleBackgroundHover])
            }
            .padding(.horizontal)
            .navigationTitle("ComponentColors")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func createView(for colorGroup: String, colors: [Color]) -> some View {
        return GroupBox(
            content: {
                HStack(spacing: 1) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(height: 25)
                    }
                }
            }, label: {
                Text(colorGroup)
            }
        )
    }
}

#Preview {
    ComponentColorsView()
}
