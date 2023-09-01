import SwiftUI
import Warp_ios
import Shimmer

struct ButtonView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("PrimaryButton")
                HStack {
                    PrimaryButton(title: "Button")
                    PrimaryButton(title: "Loading", disbled: true)
                        .shimmering()
                    PrimaryButton(title: "Disabled", disbled: true)
                }
                HStack {
                    PrimaryButton(title: "Button", size: .small)
                    PrimaryButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                PrimaryButton(title: "Button with icon", icon: "square.and.arrow.up")
                PrimaryButton(title: "Very very very long button")
                PrimaryButton(title: "Too looooooooooooooooooooooooooooong button")
                PrimaryButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("SecondaryButton")
                HStack {
                    SecondaryButton(title: "Button")
                    SecondaryButton(title: "Loading", disbled: true)
                        .shimmering()
                    SecondaryButton(title: "Disabled", disbled: true)
                }
                HStack {
                    SecondaryButton(title: "Button", size: .small)
                    SecondaryButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                SecondaryButton(title: "Button with icon", icon: "square.and.arrow.up")
                SecondaryButton(title: "Very very very long button")
                SecondaryButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("TertiaryButton")
                HStack {
                    TertiaryButton(title: "Button")
                    TertiaryButton(title: "Loading", disbled: true)
                        .shimmering()
                    TertiaryButton(title: "Disabled", disbled: true)
                }
                HStack {
                    TertiaryButton(title: "Button", size: .small)
                    TertiaryButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                TertiaryButton(title: "Button with icon", icon: "square.and.arrow.up")
                TertiaryButton(title: "Very very very long button")
                    .padding(.bottom)
                Divider()
                Text("CriticalButton")
                HStack {
                    CriticalButton(title: "Button")
                    CriticalButton(title: "Loading", disbled: true)
                        .shimmering()
                    CriticalButton(title: "Disabled", disbled: true)
                }
                HStack {
                    CriticalButton(title: "Button", size: .small)
                    CriticalButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                CriticalButton(title: "Button with icon", icon: "square.and.arrow.up")
                CriticalButton(title: "Very very very long button")
                CriticalButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("CriticalTertiaryButton")
                HStack {
                    CriticalTertiaryButton(title: "Button")
                    CriticalTertiaryButton(title: "Loading", disbled: true)
                        .shimmering()
                    CriticalTertiaryButton(title: "Disabled", disbled: true)
                }
                HStack {
                    CriticalTertiaryButton(title: "Button", size: .small)
                    CriticalTertiaryButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                CriticalTertiaryButton(title: "Button with icon", icon: "square.and.arrow.up")
                CriticalTertiaryButton(title: "Very very very long button")
                CriticalTertiaryButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("UtilityButton")
                HStack {
                    UtilityButton(title: "Button")
                    UtilityButton(title: "Loading", disbled: true)
                        .shimmering()
                    UtilityButton(title: "Disabled", disbled: true)
                }
                HStack {
                    UtilityButton(title: "Button", size: .small)
                    UtilityButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                UtilityButton(title: "Button with icon", icon: "square.and.arrow.up")
                UtilityButton(title: "Very very very long button")
                UtilityButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("UtilityTertiaryButton")
                HStack {
                    UtilityTertiaryButton(title: "Button")
                    UtilityTertiaryButton(title: "Loading", disbled: true)
                        .shimmering()
                    UtilityTertiaryButton(title: "Disabled", disbled: true)
                }
                HStack {
                    UtilityTertiaryButton(title: "Button", size: .small)
                    UtilityTertiaryButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                UtilityTertiaryButton(title: "Button with icon", icon: "square.and.arrow.up")
                UtilityTertiaryButton(title: "Very very very long button")
                UtilityTertiaryButton(title: "I get my width from my parent", fullWidth: true)
                    .padding(.bottom)
                Divider()
                Text("UtilityOverlayButton")
                HStack {
                    UtilityOverlayButton(title: "Button")
                    UtilityOverlayButton(title: "Loading", disbled: true)
                        .shimmering()
                    UtilityOverlayButton(title: "Disabled", disbled: true)
                }
                HStack {
                    UtilityOverlayButton(title: "Button", size: .small)
                    UtilityOverlayButton(title: "Button", icon: "square.and.arrow.up", size: .small)
                }
                UtilityOverlayButton(title: "Button with icon", icon: "square.and.arrow.up")
                UtilityOverlayButton(title: "Very very very long button")
                UtilityOverlayButton(title: "I get my width from my parent", fullWidth: true)
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
