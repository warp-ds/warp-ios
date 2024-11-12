import SwiftUI
import Warp

struct ButtonGroupView: View {
    @State private var buttons = [
        (title: "Option 1", isSelected: false),
        (title: "Option 2", isSelected: false),
        (title: "Option 3", isSelected: false)
    ]

    var body: some View {
        VStack {
            Warp.ButtonGroup(buttons: $buttons) { updatedButtons in
                print("Updated button states:", updatedButtons)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ButtonGroupView()
}
