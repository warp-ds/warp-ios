//
//  BoxView.swift
//  Finn
//
//  Created by Sajad Vishkai on 2024-02-08.
//

import SwiftUI
import Warp

struct BoxView: View {
    @State private var style: Warp.BoxStyle = .info

    @State private var shouldShowIcon = true

    @State private var boxTitle = "Title"

    @State private var boxSubtitle = "Use this variant to call extra attention to useful, contextual information."

    @State private var boxbadge: Warp.BadgeVariant? = nil

    @State private var hasLink = false

    @State private var hasButton = false

    @State private var type: Warp.ButtonType = .primary

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                createBoxView(basedOn: (hasLink, hasButton))
                    .padding(.top)
                    .padding(.bottom, 6)

                GroupBox(
                    content: {
                        HStack {
                            Warp.Text("Style", style: .bodyStrong)
                            Picker("Pick your box style please", selection: $style.animation(.easeIn)) {
                                ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
                                    Text(style.rawValue.capitalized)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        Divider()
                        HStack {
                            Warp.Text("Title", style: .bodyStrong)
                            Spacer()
                            Warp.TextField(text: $boxTitle)
                        }
                        Divider()
                        createToggle(binding: $shouldShowIcon, text: "Show icon")
                        Divider()
                        VStack(alignment: .leading) {
                            Warp.Text("Select a Badge Variant", style: .bodyStrong)
                            // Picker to choose a badge
                            Picker("Badge Variant", selection: $boxbadge) {
                                ForEach(badgeOptions, id: \.self) { option in
                                    Text(option?.rawValue ?? "none")
                                        .tag(option)
                                }
                            }
                            .pickerStyle(WheelPickerStyle()) // Wheel picker style for better UX
                        }
                        Divider()
                        HStack {
                            Warp.Text("Subtitle", style: .bodyStrong)
                            Spacer()
                            Warp.TextField(text: $boxSubtitle)
                        }
                        Divider()
                        createToggle(binding: $hasLink, text: "Show link")
                        Divider()
                        createToggle(binding: $hasButton, text: "Show button")
                        if hasButton {
                            Divider()
                            HStack {
                                Warp.Text("Type", style: .bodyStrong)
                                Picker("Pick your box style please", selection: $type.animation(.smooth)) {
                                    ForEach(Warp.ButtonType.allCases, id: \.self) { type in
                                        Text(type.rawValue)
                                    }
                                }
                                .pickerStyle(.wheel)
                            }
                        }
                    }, label: {
                        Text("Modify Box")
                    }
                )
            }
            .padding(.horizontal, 20)
            .navigationTitle("Box")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func createToggle(binding: Binding<Bool>, text: String) -> some View {
        HStack {
            Warp.Text(text, style: .bodyStrong)
            Spacer()
            Warp.Switch(isOn: binding.animation(.smooth))
        }
    }

    private func createBoxView(basedOn state: (hasLink: Bool, hasButton: Bool)) -> some View {
        let linkProvider: Warp.Box.ButtonConstructor? = {
            if state.hasLink {
                return (
                    title: "Link",
                    action: {
                        UIApplication.shared.open(URL(string: "https://github.com/warp-ds/warp-ios")!)
                    }
                )
            }
            
            return nil
        }()

        let buttonProvider: Warp.Button? = {
            if state.hasButton {
                return Warp.Button(title: "Button",
                                   action: {},
                                   type: type)
            }

            return nil
        }()

        let style = style
        let title = boxTitle
        let shouldShowToolTipImage = shouldShowIcon
        let boxSubtitle = boxSubtitle

        return Warp.Box(
            style: style,
            title: title,
            badge: boxbadge == nil ? nil : Warp.Badge(text: "Badge", variant: boxbadge ?? .info),
            shouldShowToolTipImage: shouldShowToolTipImage,
            subtitle: boxSubtitle,
            link: linkProvider,
            button: buttonProvider
        )
    }

    // Computed list with "None" first, then all badge variants
    private var badgeOptions: [Warp.BadgeVariant?] {
        [nil] + Warp.BadgeVariant.allCases
    }
}

#Preview {
    BoxView()
}
