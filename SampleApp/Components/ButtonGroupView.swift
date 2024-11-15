import SwiftUI
import Warp

struct ButtonGroupView: View {
    @State private var multiSelect = false
    @State private var buttons = [
        (title: "Option 1", isSelected: false),
        (title: "Option 2", isSelected: false),
        (title: "Option 3", isSelected: false)
    ]

    var body: some View {
        VStack {
            Warp.ButtonGroup(buttons: $buttons, singleSelect: !multiSelect) { updatedButtons in
                print("Updated button states:", updatedButtons)
            }
            .padding(.vertical)
            GroupBox {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Supports multiSelect")
                        Spacer()
                        Warp.Switch(isOn: $multiSelect)
                    }
                    .padding(.top, 20)
                }
            } label: {
                Text("Modify ButtonGroup")
            }
        }
        .padding()
    }
}

#Preview {
    ButtonGroupView()
}
