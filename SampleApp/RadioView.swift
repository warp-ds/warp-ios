import Warp
import SwiftUI

struct RadioView: View {
    @State private var selectedOption1 = ExampleOption(name: "Option 1", extraContent: nil)
    @State private var selectedOption2 = ExampleOption(name: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)))
    @State private var selectedOption3 = ExampleOption(name: "Option 3", extraContent: AnyView(Text("Extra Info").foregroundColor(Warp.Token.textSubtle)))
    @State private var state: Warp.RadioButtonState = .default
    
    let options = [
        ExampleOption(name: "Option 1", extraContent: nil),
        ExampleOption(name: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary))),
        ExampleOption(name: "Option 3", extraContent: AnyView(Text("Extra Info").foregroundColor(Warp.Token.textSubtle)))
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // Picker for selecting the state
            Picker("Pick your state", selection: $state.animation(.interpolatingSpring())) {
                ForEach(Warp.RadioButtonState.allCases, id: \.self) { state in
                    Text(state.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding(.bottom, 20)
            
            // First Radio without extraContent
            Warp.RadioGroup(
                selectedOption: $selectedOption1,
                options: options,
                label: { $0.name },
                state: state
            )
            
            // Second Radio with extraContent, arranged horizontally
            Warp.RadioGroup(
                selectedOption: $selectedOption2,
                options: options,
                label: { $0.name },
                state: state,
                extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                contentLayout: .horizontal
            )
            
            // Third Radio with extraContent, arranged vertically
            Warp.RadioGroup(
                selectedOption: $selectedOption3,
                options: options,
                label: { $0.name },
                state: state,
                extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                contentLayout: .vertical
            )
        }
        .padding()
        .background(Warp.Token.surfaceElevated200)
    }
}

struct ExampleOption: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let extraContent: AnyView? // Optional extra content for this option.
    
    static func ==(lhs: ExampleOption, rhs: ExampleOption) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

#Preview {
    RadioView()
}
