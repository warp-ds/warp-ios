import Foundation
import SwiftUI

struct HelperInformationView: View {
    /// <#Description#>
    let state: Warp.InputState

    /// <#Description#>
    let errorMessage: () -> String?

    /// <#Description#>
    let helpMessage: () -> String?

    init(
        state: Warp.InputState,
        errorMessage: @autoclosure @escaping () -> String?,
        helpMessage: @autoclosure @escaping () -> String?
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
        let stateText = state == .error ? errorMessage(): helpMessage()

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
