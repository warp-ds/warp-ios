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
