import Foundation
import SwiftUI

struct TextFieldView: View {
    /// <#Description#>
    let placeholder: String

    /// <#Description#>
    let text: Binding<String>

    /// <#Description#>
    let isAnimated: Bool

    /// <#Description#>
    let lineLimit: ClosedRange<UInt8>

    /// <#Description#>
    var isFocused: FocusState<Bool>.Binding

    /// <#Description#>
    var state: Binding<Warp.InputState>

    var body: some View {
        TextField(
            placeholder,
            text: text,
            onEditingChanged: { startedEditing in
                let updateState = {
                    if startedEditing {
                        state.wrappedValue = .active
                    } else {
                        state.wrappedValue = .normal
                    }
                }

                if isAnimated {
                    withAnimation {
                        updateState()
                    }
                } else {
                    updateState()
                }
            }
        )
        .focused(isFocused)
        .textFieldStyle(
            .innerStyle(
                state: state.wrappedValue,
                lineLimit: lineLimit
            )
        )
    }
}
