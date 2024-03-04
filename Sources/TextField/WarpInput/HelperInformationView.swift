import Foundation
import SwiftUI

/// Helper view that will be shown at the bottom of TextField.
struct HelperInformationView: View, Hashable {
    /// State of TextField.
    let textFieldState: Warp.TextFieldState

    /// Information state, with possible associated message.
    let informationState: Warp.TextField.InformationState

    /// Object responsible for providing colors.
    let colorProvider: ColorProvider

    static func == (lhs: HelperInformationView, rhs: HelperInformationView) -> Bool {
        lhs.textFieldState == rhs.textFieldState &&
        lhs.informationState == rhs.informationState
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(textFieldState)
        hasher.combine(informationState)
    }

    init(
        textFieldState: Warp.TextFieldState,
        informationState: Warp.TextField.InformationState,
        colorProvider: ColorProvider
    ) {
        self.textFieldState = textFieldState
        self.informationState = informationState
        self.colorProvider = colorProvider
    }

    private var foregroundColor: Color {
        if textFieldState == .error {
            return colorProvider.inputTextNegative
        }

        return FinnColors.gray700
    }

    var body: some View {
        if let helperText = informationState.helperText {
            Text(helperText)
                .foregroundColor(foregroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
    }
}
