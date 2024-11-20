import SwiftUI
import Warp

struct BadgeView: View {
    @State private var showIcon = false
    @State private var variant = Warp.BadgeVariant.info
    @State private var position = Warp.BadgePosition.default

    var body: some View {
        ScrollView(showsIndicators: false) {
            // Switch display with dynamic state
            Warp.Badge(text: variant.rawValue,
                       icon: showIcon ? .plus : nil,
                       variant: variant,
                       position: position)
            .padding()
            
            // Controls to modify Badge's state
            GroupBox(content: {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Show or Hide Icon")
                        Spacer()
                        Warp.Switch(isOn: $showIcon.animation(.smooth))
                    }
                    Divider()
                    Text("Badge variant")
                    Picker("Pick your badge variant please", selection: $variant.animation(.smooth)) {
                        ForEach(Warp.BadgeVariant.allCases, id: \.self) { variant in
                            Text(variant.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    Divider()
                    Text("Badge position")
                    Picker("Pick your badge position please", selection: $position.animation(.smooth)) {
                        ForEach(Warp.BadgePosition.allCases, id: \.self) { position in
                            Text(position.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }, label: {
                Text("Modify Badge")
            })
        }
        .padding(.horizontal)
        .navigationTitle("Badge")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BadgeView()
}
