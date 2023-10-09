import Foundation
import SwiftUI

/// Helper view that will be shown at the bottom of input.
struct HelperInformationView: View, Hashable {
    /// State of input.
    let state: Warp.InputState

    /// Lazy error message that will be shown in case of state gets changed to `Warp.InputState.error`.
    let errorMessage: () -> String?

    /// Helper message that will be shown at the bottom when state is not error..
    let helpMessage: String?
    
    /// Object responsible for providing colors.
    let colorProvider: ColorProvider

    public static func == (lhs: HelperInformationView, rhs: HelperInformationView) -> Bool {
        lhs.state == rhs.state
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(state)
    }

    init(
        state: Warp.InputState,
        errorMessage: @autoclosure @escaping () -> String?,
        helpMessage: String?,
        colorProvider: ColorProvider
    ) {
        self.state = state
        self.errorMessage = errorMessage
        self.helpMessage = helpMessage
        self.colorProvider = colorProvider
    }

    var foregroundColor: Color {
        if state == .error {
            return colorProvider.inputTextNegative
        }

        return FinnColors.gray700
    }

    var body: some View {
        if let helperTextView = helperTextView {
            Text(helperTextView)
                .foregroundColor(foregroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
    }

    private var helperTextView: String? {
        let stateText = state == .error ? errorMessage(): helpMessage

        return stateText
    }
}
