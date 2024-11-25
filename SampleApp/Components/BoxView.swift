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

    @State private var hasLink = false

    @State private var hasButton = false

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
                        HStack {
                            Warp.Text("Subtitle", style: .bodyStrong)
                            Spacer()
                            Warp.TextField(text: $boxSubtitle)
                        }
                        Divider()
                        createToggle(binding: $hasLink, text: "Show link")
                        Divider()
                        createToggle(binding: $hasButton, text: "Show button")
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

        let buttonProvider: Warp.Box.ButtonConstructor? = {
            if state.hasButton {
                return (
                    title: "Click me!",
                    action: {
                        // no-op
                    }
                )
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
            shouldShowToolTipImage: shouldShowToolTipImage,
            subtitle: boxSubtitle,
            link: linkProvider,
            button: buttonProvider
        )
    }
}

#Preview {
    BoxView()
}
