import Warp
import SwiftUI

struct RadioView: View {
    @State private var selectedOption = ExampleOption(name: "Option 1")
    @State private var state: Warp.RadioButtonState = .default
    
    let options = [
        ExampleOption(name: "Option 1"),
        ExampleOption(name: "Option 2"),
        ExampleOption(name: "Option 3")
    ]
    
    var body: some View {
        VStack {
            Warp.Radio(selectedOption: $selectedOption,
                       options: options,
                       label: { $0.name },
                       state: state)
            
            Picker("Pick your shadow", selection: $state.animation(.interpolatingSpring)) {
                ForEach(Warp.RadioButtonState.allCases, id: \.self) { state in
                    Text(state.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
        }
    }
}

struct ExampleOption: Identifiable, Hashable {
    var id: String { name }
    let name: String
}

#Preview {
    RadioView()
}
