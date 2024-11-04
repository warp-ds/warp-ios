import SwiftUI
import Warp

struct SwitchView: View {
    
    @State private var isOn = true
    @State private var isDisabled = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            // Switch display with dynamic state
            Warp.Switch(
                isOn: $isOn,
                state: isDisabled ? .disabled : .default
            )
            .padding()
            
            // Controls to modify Switch's state
            GroupBox(content: {
                VStack(alignment: .leading) {
                    // Toggle Switch State
                    VStack(alignment: .leading) {
                        Text("Enable or Disable Switch")
                        Picker("Enable or Disable", selection: $isDisabled) {
                            Text("Enable").tag(false)
                            Text("Disable").tag(true)
                        }
                        .pickerStyle(SegmentedPickerStyle())
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
}

#Preview {
    SwitchView()
}
