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
                )
                .padding()
            }

            ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
                Warp.Alert(
                    style: style,
                    title: "Title",
                    subtitle: "Use this variant to call extra attention to useful, contextual information.",
                    link: (title: "Link to more information", action: {}),
                    primaryButton: (title: "Button", action: {}),
                    secondaryButton: (title: "Button", action: {})
                )
                .padding()
            }
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
}

#Preview {
    AlertView()
}
