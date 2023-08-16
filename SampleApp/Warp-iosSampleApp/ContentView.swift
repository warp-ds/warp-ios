import SwiftUI
import Warp_ios

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("PrimaryButton")
            PrimaryButton(title: "Button")
            PrimaryButton(title: "Disabled", disbled: true)
            Text("SecondaryButton")
            SecondaryButton(title: "Button")
            SecondaryButton(title: "Disabled", disbled: true)
            Text("TertiaryButton")
            TertiaryButton(title: "Button")
            TertiaryButton(title: "Disabled", disbled: true)
            Text("CriticalButton")
            CriticalButton(title: "Button")
            CriticalButton(title: "Disabled", disbled: true)
            Text("CriticalTertiaryButton")
            CriticalTertiaryButton(title: "Button")
            CriticalTertiaryButton(title: "Disabled", disbled: true)
            Text("UtilityButton")
            UtilityButton(title: "Button")
            UtilityButton(title: "Disabled", disbled: true)
            Text("WarpInput")
            WarpInput(title: "WarpInput", text: "")
        }
    }
}

#Preview {
    ContentView()
}
