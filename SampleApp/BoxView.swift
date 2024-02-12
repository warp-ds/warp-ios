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
                Warp.Box(
                    style: style,
                    title: "Title",
                    subtitle: "Use this variant to call extra attention to useful, contextual information.",
                    link: nil,
                    button: nil
                )
                .padding()
            }

            ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
                Warp.Box(
                    style: style,
                    title: "Title",
                    subtitle: "Information",
                    link: (title: "Link to more information", action: { print("Link") }),
                    button: (title: "Button", action: { print("Button") })
                )
                .padding()
            }
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
