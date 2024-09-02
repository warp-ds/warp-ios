import Warp
import SwiftUI

private enum LayoutDirection: String, Hashable, CaseIterable {
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

struct CheckboxView: View {
    @State private var selectedOptions: [ExampleOption] = []
    @State private var style: Warp.CheckboxStyle = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical
    @State private var isIndentationEnabled: Bool = false
    
    private let options = [
        ExampleOption(title: "Option 1", state: .notSelected, extraContent: nil, indentationLevel: 0),
        ExampleOption(title: "Option 2", state: .selected, extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)), indentationLevel: 1),
        ExampleOption(title: "Option 3", state: .partiallySelected, extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)), indentationLevel: 2),
        ExampleOption(title: "Option 4", state: .notSelected, extraContent: nil, indentationLevel: 2),
        ExampleOption(title: "Option 5", state: .selected, extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)), indentationLevel: 1),
        ExampleOption(title: "Option 6", state: .partiallySelected, extraContent: nil, indentationLevel: 0)
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
                
                // Picker for selecting the style
                Picker("Pick your style", selection: $style.animation(.interpolatingSpring())) {
                    ForEach(Warp.CheckboxStyle.allCases, id: \.self) { style in
                        Text(style.rawValue.capitalized)
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
                Toggle("Enable Indentations", isOn: $isIndentationEnabled)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                Warp.CheckboxGroup(
                    title: title,
                    helpText: helpText,
                    selectedOptions: $selectedOptions,
                    options: options.map { option in
                        ExampleOption(title: option.title, state: option.state, extraContent: option.extraContent, indentationLevel: isIndentationEnabled ? option.indentationLevel : 0)
                    },
                    label: { $0.title },
                    style: style,
                    extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
                    axis: layoutDirection.axis,
                    onSelection: { latestSelection, selectedOptions in
                        print("Selected: \(latestSelection.title)")
                        print("Currently selected options: \(selectedOptions.map { $0.title })")
                    }
                )
                .id(isIndentationEnabled)  // Force re-render on change
            }
            .padding()
        }
        .background(Warp.Token.surfaceElevated200)
        .navigationTitle("Checkboxes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct ExampleOption: CheckboxOption {
    var id: String { title }
    let title: String
    var state: Warp.CheckboxState
    var extraContent: AnyView? = nil // Optional extra content for this option.
    var indentationLevel: Int // Indentation level for this option.
    
    static func ==(lhs: ExampleOption, rhs: ExampleOption) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#Preview {
    NavigationView {
        CheckboxView()
    }
}
