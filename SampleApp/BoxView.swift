//
//  BoxView.swift
//  Finn
//
//  Created by Sajad Vishkai on 2024-02-08.
//

import SwiftUI
import Warp

struct BoxView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
    @ViewBuilder
    private func createBoxView(basedOn state: (hasLink: Bool, hasButton: Bool)) -> some View {
        lazy var linkProvider: Warp.Box.ButtonConstructor = {
            (
                title: "Link",
                action: {
                    UIApplication.shared.open(URL(string: "https://github.com/warp-ds/warp-ios")!)
                }
            )
        }()

        lazy var buttonProvider: Warp.Box.ButtonConstructor = {
            (
                title: "Click me!",
                action: {
                    // no-op
                }
            )
        }()

        switch state {
            case (true, true):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: linkProvider,
                    button: buttonProvider
                )

            case (true, false):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: linkProvider,
                    button: nil
                )

            case (false, true):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: nil,
                    button: buttonProvider
                )

            case (false, false):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: nil,
                    button: nil
                )
        }
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
}

#Preview {
    BoxView()
}
