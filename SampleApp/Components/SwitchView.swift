import SwiftUI
import Warp

struct SwitchView: View {
    
    @State private var isOn = true
    @State private var switchState: Warp.SwitchState = .default
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Switch display with dynamic state
            Warp.Switch(
                isOn: $isOn,
                state: switchState
            )
            .padding()
            
            // Controls to modify Switch's state
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Toggle Switch State
                    HStack {
                        Text("Toggle Switch State")
                        Spacer()
                        
                        Warp.Button.create(
                            for: .primary,
                            title: switchState == .default ? "Disable" : "Enable",
                            action: {
                                toggleSwitchState()
                            }
                        )
                    }
                    .padding(.top, 20)
                }
            }, label: {
                Text("Modify Switch State")
            })
        }
        .padding(.horizontal)
        .navigationTitle("Switch")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Function to toggle the switch state between default and disabled
    private func toggleSwitchState() {
        switchState = switchState == .default ? .disabled : .default
    }
}

#Preview {
    SwitchView()
}
