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
                    linkProvider: nil,
                    primaryButtonProvider: nil,
                    secondaryButtonProvider: nil
                )
                .padding()
            }

            ForEach(Warp.AlertStyle.allCases, id: \.self) { style in
                Warp.Alert(
                    style: style,
                    title: "Title",
                    subtitle: "Use this variant to call extra attention to useful, contextual information.",
                    linkProvider: (title: "Link to more information", action: {}),
                    primaryButtonProvider: (title: "Button", action: {}),
                    secondaryButtonProvider: (title: "Button", action: {})
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
