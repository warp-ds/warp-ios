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

    @State private var alertSubtitle = "Use this variant to call extra attention to useful, contextual information."

    @State private var hasLink = false

    @State private var hasPrimaryButton = false

    @State private var hasSecondaryButton = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                createAlertView(basedOn: (hasLink, hasPrimaryButton, hasSecondaryButton))
                    .padding(.top)
                    .padding(.bottom, 6)

                GroupBox(
                    content: {
                        HStack {
                            Warp.Text("Style", style: .bodyStrong)
                            Picker("Pick your box style please", selection: $style.animation(.smooth)) {
                                ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
                                    Text(style.rawValue.capitalized)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        Divider()
                        HStack {
                            Warp.Text("Title", style: .bodyStrong)
                            Spacer()
                            Warp.TextField(text: $alertTitle)
                        }
                        Divider()
                        HStack {
                            Warp.Text("Subtitle", style: .bodyStrong)
                            Spacer()
                            Warp.TextField(text: $alertSubtitle)
                        }
                        Divider()
                        createToggle(binding: $hasLink, text: "Show link")
                        Divider()
                        createToggle(binding: $hasPrimaryButton, text: "Show first button")
                        Divider()
                        createToggle(binding: $hasSecondaryButton, text: "Show second button")
                    }, label: {
                        Text("Modify Alert")
                    }
                )
            }
            .padding(.horizontal, 20)
            .navigationTitle("Alert")
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
            secondaryButton: secondaryButtonProvider
        )
    }
}

#Preview {
    AlertView()
}
