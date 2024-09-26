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
    @State private var isSelectedOption1: Bool = false
    @State private var isSelectedOption2: Bool = true
    @State private var isSelectedOption3: Bool = false
    
    @State private var options: [ExampleOption] = []
    
    @State private var style: Warp.CheckboxStyle = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                titleAndHelpTextFields
                stylePicker
                layoutDirectionPicker
                checkboxGroup
            }
            .padding()
        }
        .onAppear {
            setupOptions()
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

    private var checkboxGroup: some View {
        Warp.CheckboxGroup(
            title: title,
            helpText: helpText,
            options: Binding(
                get: {
                    options
                },
                set: { newOptions in
                    options = newOptions
                }
            ),
            style: style,
            axis: layoutDirection.axis,
            onSelection: { latestSelection, options in
                print("Selected: \(latestSelection.title)")
                print("Currently selected options: \(options.map { "\($0.title) is \($0.isSelected.wrappedValue ? "selected" : "not selected")" })")
            }
        )
    }
    
    private func setupOptions() {
        // Initialize options with `Binding<Bool>` for `isSelected`
        options = [
            ExampleOption(title: "Option 1", isSelected: $isSelectedOption1),
            ExampleOption(title: "Option 2", isSelected: $isSelectedOption2, extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary))),
            ExampleOption(title: "Option 3", isSelected: $isSelectedOption3, extraContent: AnyView(Text("Extra Info").font(Warp.Typography.body.font).foregroundColor(Warp.Token.textSubtle)))
        ]
    }
}

private struct ExampleOption: CheckboxOption {
    var id: String { title }
    let title: String
    var isSelected: Binding<Bool>
    var extraContent: AnyView? = nil
    
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
