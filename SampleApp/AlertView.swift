//
//  AlertView.swift
//  Finn
//
//  Created by Sajad Vishkai on 2024-01-25.
//

import Foundation
import SwiftUI
import Warp

struct AlertView: View {
    @State private var style: Warp.AlertStyle = .info

    @State private var alertTitle = "Title"

    @State private var alertSubtitle = "Due to regulatory requirements, we need to collect your social security number. Therefore, please verify your information again. We apologize for the inconvenience."

    @State private var hasLink = false

    @State private var hasPrimaryButton = false

    @State private var hasSecondaryButton = false

    var body: some View {
        ScrollView {
            VStack {
                createAlertView(basedOn: (hasLink, hasPrimaryButton, hasSecondaryButton))
                    .padding(.top)
                    .padding(.bottom, 6)

                GroupBox(
                    content: {
                        Picker("Pick your box style please", selection: $style.animation(.smooth)) {
                            ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
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
                        Warp.TextField(text: $alertTitle)
                            .defaultPadding()
                    }, label: {
                        Text("Title")
                    }
                )

                GroupBox(
                    content: {
                        Warp.TextField(text: $alertSubtitle)
                            .defaultPadding()
                    }, label: {
                        Text("Subtitle")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $hasLink.defaultAnimation()) {
                            createToggleLabelView(hasValue: hasLink, tag: "link")
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Link")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $hasPrimaryButton.defaultAnimation()) {
                            createToggleLabelView(hasValue: hasPrimaryButton, tag: "primary button")
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Primary button")
                    }
                )

                GroupBox(
                    content: {
                        Toggle(isOn: $hasSecondaryButton) {
                            createToggleLabelView(hasValue: hasSecondaryButton, tag: "secondary button")
                        }
                        .defaultPadding()
                    }, label: {
                        Text("Secondary button")
                    }
                )
            }
            .padding(.horizontal, 20)
        }
    }

    private func createAlertView(
        basedOn state: (hasLink: Bool, hasPrimaryButton: Bool, hasSecondaryButton: Bool)
    ) -> some View {
        let linkProvider: Warp.Alert.ButtonConstructor? = {
            if state.hasLink {
                return (
                    title: "Visit this link for more information",
                    action: {
                        UIApplication.shared.open(URL(string: "https://github.com/warp-ds/warp-ios")!)
                    }
                )
            }

            return nil
        }()

        let primaryButtonProvider: Warp.Alert.ButtonConstructor? = {
            if state.hasPrimaryButton {
                return (
                    title: "Click me!",
                    action: {
                        // no-op
                    }
                )
            }

            return nil
        }()

        let secondaryButtonProvider: Warp.Alert.ButtonConstructor? = {
            if state.hasSecondaryButton {
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
        let title = alertTitle
        let subtitle = alertSubtitle

        return Warp.Alert(
            style: style,
            title: title,
            subtitle: subtitle,
            link: linkProvider,
            primaryButton: primaryButtonProvider,
            secondaryButton: secondaryButtonProvider,
            colorProvider: Warp.Config.colorProvider
        )
    }

    private func createToggleLabelView(hasValue: Bool, tag: String) -> some View {
        HStack {
            let prependStaticText = !hasValue ? "Add": "Remove"

            Text(prependStaticText + " \(tag)")

            Spacer()
        }
    }
}

extension Warp.AlertStyle: CaseIterable {
    public static var allCases: [Warp.AlertStyle] = [
        .info,
        .warning,
        .critical,
        .success
    ]

    fileprivate var styleName: String {
        switch self {
            case .info:
                return "Info"

            case .warning:
                return "Warning"

            case .critical:
                return "Critical"

            case .success:
                return "Success"
        }
    }
}

private extension Binding<Bool> {
    func defaultAnimation() -> Binding<Bool> {
        animation(.bouncy)
    }
}

private extension View {
    func defaultPadding() -> some View {
        padding(.all, 8)
    }
}

#Preview {
    AlertView()
}
