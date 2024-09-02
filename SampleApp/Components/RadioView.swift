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
    @State private var selectedOption = ExampleOption(title: "Option 2")
    @State private var state: Warp.RadioButtonState = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical
    @State private var isIndentationEnabled: Bool = false
    
    let options = [
        ExampleOption(title: "Option 1", extraContent: nil, indentationLevel: 0),
        ExampleOption(title: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)), indentationLevel: 1),
        ExampleOption(title: "Option 3", extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)), indentationLevel: 2)
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
                
                // Switch for enabling/disabling indentations
//                Toggle("Enable Indentations", isOn: $isIndentationEnabled)
//                    .padding(.horizontal)
//                    .padding(.bottom, 20)
                
                Warp.RadioGroup(
                    title: title,
                    helpText: helpText,
                    selectedOption: $selectedOption,
                    options: options.map { option in
                        ExampleOption(title: option.title, extraContent: option.extraContent, indentationLevel: isIndentationEnabled ? option.indentationLevel : 0)
                    },
                    label: { $0.title },
                    state: state,
                    extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                    axis: layoutDirection.axis,
                    onSelection: { oldSelection, newSelection in
                        print("Changed from \(oldSelection.title) to \(newSelection.title)")
                    }
                )
                .id(isIndentationEnabled)  // Force re-render on change
            }
            .padding()
        }
        .background(Warp.Token.surfaceElevated200)
        .navigationTitle("Radio")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExampleOption: RadioOption {
    var id: String { title }
    let title: String
    var extraContent: AnyView? = nil // Optional extra content for this option.
    var indentationLevel: Int? = 0 // Indentation level for this option.
    
    static func ==(lhs: ExampleOption, rhs: ExampleOption) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#Preview {
    RadioView()
}
