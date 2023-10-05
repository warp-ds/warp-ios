import Foundation
import SwiftUI

/// Helper view that will be shown at the bottom of input.
struct HelperInformationView: View {
    /// State of input.
    let state: Warp.InputState

    /// Lazy error message that will be shown in case of state gets changed to `Warp.InputState.error`.
    let errorMessage: () -> String?

    /// Helper message that will be shown at the bottom when state is not error..
    let helpMessage: String?

    init(
        state: Warp.InputState,
        errorMessage: @autoclosure @escaping () -> String?,
        helpMessage: String?
    ) {
        self.state = state
        self.errorMessage = errorMessage
        self.helpMessage = helpMessage
    }

    var body: some View {
        if let helperTextView = helperTextView {
            Text(helperTextView)
                .foregroundColor(state.foregroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
    }

    private var helperTextView: String? {
        let stateText = state == .error ? errorMessage(): helpMessage

        return stateText
    }
}

extension Warp.InputState {
    /// <#Description#>
    fileprivate var foregroundColor: Color {
        let colorProvider = Config.colorProvider

        if self == .error {
            return colorProvider.inputTextNegative
        }

        return FinnColors.gray700
    }
}
