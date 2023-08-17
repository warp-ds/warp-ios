import SwiftUI
import Warp_ios

struct ButtonView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("PrimaryButton")
                HStack {
                    PrimaryButton(title: "Button")
                    PrimaryButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
                Text("SecondaryButton")
                HStack {
                    SecondaryButton(title: "Button")
                    SecondaryButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
                Text("TertiaryButton")
                HStack {
                    TertiaryButton(title: "Button")
                    TertiaryButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
                Text("CriticalButton")
                HStack {
                    CriticalButton(title: "Button")
                    CriticalButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
                Text("CriticalTertiaryButton")
                HStack {
                    CriticalTertiaryButton(title: "Button")
                    CriticalTertiaryButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
                Text("UtilityButton")
                HStack {
                    UtilityButton(title: "Button")
                    UtilityButton(title: "Disabled", disbled: true)
                }
                .padding(.bottom)
                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ButtonView()
}
