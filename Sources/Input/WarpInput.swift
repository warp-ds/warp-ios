import SwiftUI

public struct WarpInput: View {
    let title: String
    @State var text: String = ""
    @State var state: WarpInputState
    let colorProvider = Config.colorProvider
    
    public init(title: String,
                text: String,
                state: WarpInputState = .normal) {
        self.title = title
        self._state = State(initialValue: state)
        self.text = text
    }
    
    var inputBorderColor: Color {
        switch state {
        case .normal:
            return colorProvider.inputBorder
        case .active:
            return colorProvider.inputBorderActive
        case .disabled:
            return colorProvider.inputBorderDisabled
        case .error:
            return colorProvider.inputBorderNegative
        case .readOnly:
            return colorProvider.inputBorder
        }
    }
    
    var backgroundColor: Color {
        state == .disabled ? colorProvider.inputBackgroundDisabled : Color(UIColor.systemBackground)
    }
    
    var helpTextForegroundColor: Color {
        state == .error ? colorProvider.inputTextNegative : colorProvider.inputTextHint
    }
    
    var inputBorderWidth: CGFloat {
        switch state {
        case .normal:
            return 2
        case .active:
            return 4
        case .disabled:
            return 2
        case .error:
            return 2
        case .readOnly:
            return 0
        }
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.footnote)
                    .foregroundColor(colorProvider.inputTextFilled)
                Text("Optional")
                    .font(.caption)
                    .fontWeight(.thin)
                    .foregroundColor(FinnColors.gray500)
                Image(systemName: "exclamationmark.circle")
                    .foregroundColor(FinnColors.gray300)
            }
            TextField("Hint", text: $text, onEditingChanged: { startedEditing in
                if startedEditing {
                    state = .active
                } else {
                    state = .normal
                }
            })
            .font(.callout)
            .disabled(state == .disabled || state == .readOnly)
                .padding(.vertical)
                .padding(.horizontal, state == .readOnly ? 0 : 8)
                .background(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(inputBorderColor, lineWidth: inputBorderWidth))
                .cornerRadius(4)
            Text(state == .error ? "Error text" : "Help text")
                .foregroundColor(helpTextForegroundColor)
                .font(.caption)
                .fontWeight(.thin)
        }
        .padding()
    }
}

public enum WarpInputState {
    case normal, active, disabled, error, readOnly
}

#Preview {
    VStack {
        WarpInput(title: "Label", text: "Text")
        WarpInput(title: "Label", text: "Text", state: .disabled)
        WarpInput(title: "Label", text: "Text", state: .error)
        WarpInput(title: "Label", text: "Text", state: .readOnly)
    }
}
