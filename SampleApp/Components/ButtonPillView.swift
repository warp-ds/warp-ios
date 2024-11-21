import SwiftUI
import Warp

struct ButtonPillView: View {
    @State private var type = Warp.ButtonPillType.flat
    @State private var isSelected = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Display ButtonPill with dynamic state
            Warp.ButtonPill(type: type, selected: $isSelected)
                .padding()
            
            // Controls to modify ButtonPill's state
            GroupBox(content: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Button Pill Type")
                        Spacer()
                        Picker("Pick your Button Pill type", selection: $type.animation(.smooth)) {
                            Text("Flat").tag(Warp.ButtonPillType.flat)
                            Text("Overlay").tag(Warp.ButtonPillType.overlay)
                        }
                        .pickerStyle(.segmented)
                    }
                }
            }, label: {
                Text("Modify Button Pill")
            })
        }
        .padding(.horizontal)
        .navigationTitle("Button Pill")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ButtonPillView()
}
