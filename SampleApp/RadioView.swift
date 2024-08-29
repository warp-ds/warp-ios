import Warp
import SwiftUI

enum LayoutDirection: String, Hashable, CaseIterable {
    case vertical
    case horizontal
    
    var axis: Axis.Set {
        switch self {
        case .vertical:
            return .vertical
        case .horizontal:
            return .horizontal
        }
    }
}

struct RadioView: View {
    @State private var selectedOption1 = ExampleOption(name: "Option 1", extraContent: nil)
    @State private var selectedOption2 = ExampleOption(name: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)))
    @State private var selectedOption3 = ExampleOption(name: "Option 3", extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)))
    @State private var state: Warp.RadioButtonState = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical
    
    let options = [
        ExampleOption(name: "Option 1", extraContent: nil),
        ExampleOption(name: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary))),
        ExampleOption(name: "Option 3", extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)))
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // TextFields for editing the title and helpText
                TextField("Title", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("Help Text", text: $helpText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Picker for selecting the state
                Picker("Pick your state", selection: $state.animation(.interpolatingSpring())) {
                    ForEach(Warp.RadioButtonState.allCases, id: \.self) { state in
                        Text(state.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 20)
                
                // Picker for selecting the layout direction
                Picker("Pick layout direction", selection: $layoutDirection) {
                    ForEach(LayoutDirection.allCases, id: \.self) { direction in
                        Text(direction.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 20)
                
                // First RadioGroup with dynamic alignment
                Warp.RadioGroup(
                    title: title,
                    helpText: helpText,
                    selectedOption: $selectedOption1,
                    options: options,
                    label: { $0.name },
                    state: state,
                    axis: layoutDirection.axis
                )
                
                // Second RadioGroup with dynamic alignment
                Warp.RadioGroup(
                    title: title,
                    helpText: helpText,
                    selectedOption: $selectedOption2,
                    options: options,
                    label: { $0.name },
                    state: state,
                    extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                    axis: layoutDirection.axis
                )
                
                // Third RadioGroup with dynamic alignment
                Warp.RadioGroup(
                    title: title,
                    helpText: helpText,
                    selectedOption: $selectedOption3,
                    options: options,
                    label: { $0.name },
                    state: state,
                    extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                    axis: layoutDirection.axis
                )
            }
            .padding()
        }
        .background(Warp.Token.surfaceElevated200)
        .navigationTitle("Radio")
        .navigationBarTitleDisplayMode(.inline)
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
