import Foundation
import SwiftUI

/// Helper view that will be shown at the bottom of TextField.
struct HelperInformationView: View, Hashable {
    /// State of TextField.
    let textFieldState: Warp.TextFieldState

    /// Object responsible for providing colors.
    let colorProvider: ColorProvider

    static func == (lhs: HelperInformationView, rhs: HelperInformationView) -> Bool {
        lhs.textFieldState == rhs.textFieldState
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(textFieldState)
    }

    init(
        textFieldState: Warp.TextFieldState,
        colorProvider: ColorProvider
    ) {
        self.textFieldState = textFieldState
        self.colorProvider = colorProvider
    }

    private var foregroundColor: Color {
        if textFieldState.hasError {
            return colorProvider.token.textNegative
        }

        return colorProvider.token.text
    }

    var body: some View {
        if let helperText = textFieldState.helperText {
            Text(helperText)
                .foregroundColor(foregroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
    }
}
