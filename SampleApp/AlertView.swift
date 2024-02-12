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
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
                Warp.Alert(
                    style: style,
                    title: "Title",
                    subtitle: "Use this variant to call extra attention to useful, contextual information.",
                    link: nil,
                    primaryButton: nil,
                    secondaryButton: nil
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
                .padding()
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
    func textFieldDefaultOverlay(basedOn colorScheme: ColorScheme) -> some View {
        overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(colorScheme == .dark ? Color.white: Color.gray.opacity(0.5), lineWidth: 1)
        }
    }

    func defaultPadding() -> some View {
        padding(.all, 8)
    }
}

#Preview {
    AlertView()
}
