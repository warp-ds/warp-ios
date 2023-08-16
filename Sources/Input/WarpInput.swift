import SwiftUI

public struct WarpInput: View {
    let title: String
    @State var text: String = ""
    @State var state: WarpInputState = .normal
    let colorProvider = Config.colorProvider
    
    public init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    var inputBorderColor: Color {
        switch state {
        case .normal:
            return FinnColors.gray300
        case .active:
            return colorProvider.inputActiveBorderColor
        }
    }
    
    var inputBorderWidth: CGFloat {
        switch state {
        case .normal:
            return 1
        case .active:
            return 4
        }
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .foregroundColor(colorProvider.inputOptionalHelpTextForegroundColor)
                Text("Optional")
                    .font(.caption2)
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
                .padding(.vertical)
                .padding(.horizontal, 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(inputBorderColor, lineWidth: inputBorderWidth))
                .cornerRadius(4)
            Text("Help text")
                .foregroundColor(colorProvider.inputOptionalHelpTextForegroundColor)
        }
        .padding()
    }
}

enum WarpInputState {
    case normal, active
}

#Preview {
    WarpInput(title: "Label", text: "Text")
}
