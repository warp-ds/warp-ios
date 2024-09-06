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
    @State private var options: [ExampleOption] = [
        ExampleOption(title: "Option 1", state: .notSelected, extraContent: nil, indentationLevel: 0),
        ExampleOption(title: "Option 2", state: .selected, extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)), indentationLevel: 1),
        ExampleOption(title: "Option 3", state: .partiallySelected, extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)), indentationLevel: 2),
        ExampleOption(title: "Option 4", state: .notSelected, extraContent: nil, indentationLevel: 2),
        ExampleOption(title: "Option 5", state: .selected, extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary)), indentationLevel: 1),
        ExampleOption(title: "Option 6", state: .partiallySelected, extraContent: nil, indentationLevel: 0)
    ]
    @State private var style: Warp.CheckboxStyle = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical
    @State private var isIndentationEnabled: Bool = false
    @State private var enableStateTransition: Bool = true

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                titleAndHelpTextFields
                stylePicker
                layoutDirectionPicker
                indentationToggle
//                stateTransitionToggle
                checkboxGroup
            }
            .padding()
        }
        .navigationTitle("Checkboxes")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var titleAndHelpTextFields: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Help Text", text: $helpText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
        }
    }

    private var stylePicker: some View {
        Picker("Pick your style", selection: $style.animation(.interpolatingSpring())) {
            ForEach(Warp.CheckboxStyle.allCases, id: \.self) { style in
                Text(style.rawValue.capitalized)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 20)
    }

    private var layoutDirectionPicker: some View {
        Picker("Pick layout direction", selection: $layoutDirection.animation(.interpolatingSpring())) {
            ForEach(LayoutDirection.allCases, id: \.self) { direction in
                Text(direction.rawValue.capitalized)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 20)
    }

    private var indentationToggle: some View {
        Toggle("Enable Indentations", isOn: $isIndentationEnabled.animation(.interpolatingSpring()))
            .padding(.horizontal)
            .padding(.bottom, 20)
    }

    private var stateTransitionToggle: some View {
        Toggle("Override State Transition", isOn: $enableStateTransition)
            .padding(.horizontal)
            .padding(.bottom, 20)
    }

    private var checkboxGroup: some View {
        Warp.CheckboxGroup(
            title: title,
            helpText: helpText,
            options: Binding(
                get: {
                    options.map { option in
                        var updatedOption = option
                        updatedOption.indentationLevel = isIndentationEnabled ? option.indentationLevel : 0
                        return updatedOption
                    }
                },
                set: { newOptions in
                    options = newOptions
                }
            ),
            label: { $0.title },
            style: style,
            extraContent: { $0.extraContent ?? AnyView(EmptyView()) },
            axis: layoutDirection.axis,
            onSelection: { latestSelection, options in
                print("Selected: \(latestSelection.title)")
                print("Currently selected options: \(options.map { "\($0.title) is \($0.state)ed" })")
            },
            stateTransition: enableStateTransition ? { currentState in
                switch currentState {
                case .notSelected:
                    return .partiallySelected
                case .partiallySelected:
                    return .selected
                case .selected:
                    return .notSelected
                }
            } : nil
        )
        .id(isIndentationEnabled)  // Force re-render on change
    }
}

private struct ExampleOption: CheckboxOption {
    var id: String { title }
    let title: String
    var state: Warp.CheckboxState
    var extraContent: AnyView? = nil
    var indentationLevel: Int
    
    func updatedState(_ newState: Warp.CheckboxState) -> Self {
        return ExampleOption(title: title, state: newState, extraContent: extraContent, indentationLevel: indentationLevel)
    }
    
    static func ==(lhs: ExampleOption, rhs: ExampleOption) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#Preview {
    CheckboxView()
}
