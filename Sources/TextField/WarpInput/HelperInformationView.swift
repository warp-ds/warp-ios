import Foundation
import SwiftUI

/// Helper view that will be shown at the bottom of TextField.
struct HelperInformationView: View, Hashable {
    /// State of TextField.
    let state: Warp.TextFieldState

    /// Lazy error message that will be shown in case of state gets changed to `Warp.TextFieldState.error`.
    let errorMessage: () -> String?

    /// Helper message that will be shown at the bottom when state is not error..
    let helpMessage: String?
    
    /// Object responsible for providing colors.
    let colorProvider: ColorProvider

    static func == (lhs: HelperInformationView, rhs: HelperInformationView) -> Bool {
        lhs.state == rhs.state
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(state)
    }

    init(
        state: Warp.TextFieldState,
        errorMessage: @autoclosure @escaping () -> String?,
        helpMessage: String?,
        colorProvider: ColorProvider
    ) {
        self.state = state
        self.errorMessage = errorMessage
        self.helpMessage = helpMessage
        self.colorProvider = colorProvider
    }

    private var foregroundColor: Color {
        if state == .error {
            return colorProvider.inputTextNegative
        }

        return FinnColors.gray700
    }

    private var helperTextView: String? {
        let stateText = state == .error ? errorMessage(): helpMessage

        return stateText
    }

    var body: some View {
        if let helperTextView = helperTextView {
            Text(helperTextView)
                .foregroundColor(foregroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
    }
}
