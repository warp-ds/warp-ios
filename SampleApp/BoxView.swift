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
        ScrollView {
            VStack {
                createBoxView(basedOn: (hasLink, hasButton))
                    .padding(.top)
                    .padding(.bottom, 6)

                GroupBox(
                    content: {
                        Picker("Pick your box style please", selection: $style.animation(.easeIn)) {
                            ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
                                Text(style.styleName)
                            }
                        }
                        .pickerStyle(.segmented)
                        .defaultPadding()
                    }, label: {
                        Text("Style")
                    }
                )

                GroupBox(
                    content: {
                        Warp.TextField(text: $boxTitle)
                            .defaultPadding()
                    }, label: {
                        Text("Title")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $shouldShowIcon.animation(.bouncy)) {
                            HStack {
                                Text(shouldShowIcon ? "Hide icon": "Show icon")

                                Spacer()
                            }
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Tool tip icon")
                    }
                )

                GroupBox(
                    content: {
                        Warp.TextField(text: $boxSubtitle)
                            .defaultPadding()
                    }, label: {
                        Text("Subtitle")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $hasLink.defaultAnimation()) {
                            HStack {
                                let prependStaticText = !hasLink ? "Add": "Remove"

                                Text(prependStaticText + " link")

                                Spacer()
                            }
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Link")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $hasButton.defaultAnimation()) {
                            HStack {
                                let prependStaticText = !hasButton ? "Add": "Remove"

                                Text(prependStaticText + " button")

                                Spacer()
                            }
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Button")
                    }
                )
            }
            .padding(.horizontal, 20)
            .navigationTitle("Box")
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

extension Warp.BoxStyle: CaseIterable {
    public static var allCases: [Warp.BoxStyle] = [
        .neutral,
        .info,
        .bordered
    ]

    fileprivate var styleName: String {
        switch self {
            case .neutral:
                return "Neutral"

            case .info:
                return "Info"

            case .bordered:
                return "Bordered"
        }
    }
}

private extension Binding<Bool> {
    func defaultAnimation() -> Binding<Bool> {
        animation(.smooth)
    }
}

private extension View {
    func defaultPadding() -> some View {
        padding(.all, 8)
    }
}

#Preview {
    BoxView()
}
