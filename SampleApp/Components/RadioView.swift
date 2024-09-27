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

struct RadioView: View {
    @State private var selectedOption = ExampleOption(title: "Option 4")
    @State private var style: Warp.RadioStyle = .default
    @State private var title: String = "Title"
    @State private var helpText: String = "Help text"
    @State private var layoutDirection: LayoutDirection = .vertical
    @State private var showAlert: Bool = false
    
    @State private var options = [ExampleOption]()
    
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
                    ForEach(Warp.RadioStyle.allCases, id: \.self) { style in
                        Text(style.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 20)
                
                // Picker for selecting the layout direction
                Picker("Pick layout direction", selection: $layoutDirection.animation(.interpolatingSpring())) {
                    ForEach(LayoutDirection.allCases, id: \.self) { direction in
                        Text(direction.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 20)
                
                Warp.RadioGroup(
                    title: title,
                    helpText: helpText,
                    selectedOption: $selectedOption,
                    options: options,
                    style: style,
                    axis: layoutDirection.axis,
                    onSelection: { oldSelection, newSelection in
                        style = .default
                        print("Changed from \(oldSelection.title) to \(newSelection.title)")
                    }
                )
            }
            .padding()
            
            Button {
                if options.contains(selectedOption) {
                    style = .default
                    showAlert = true
                } else {
                    style = .error
                }
            } label: {
                Text("Go next")
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Thank you for selecting \(selectedOption.title)"))
        }
        .onAppear {
            populateOptions()
        }
        .onChange(of: style) { _ in
            populateOptions()
        }
        .navigationTitle("Radio")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func populateOptions() {
        options = [
            ExampleOption(title: "Option 1", extraContent: nil),
            ExampleOption(title: "Option 2", extraContent: AnyView(Image(systemName: "star.fill").foregroundColor(Warp.Token.iconPrimary))),
            ExampleOption(title: style == .disabled ? "Option disabled" : "Option 3", extraContent: AnyView(Text("Extra Info").font(from: .body).foregroundColor(style == .disabled ? Warp.Token.textDisabled : Warp.Token.textSubtle)))
        ]
    }
}

private struct ExampleOption: RadioOption {
    var id: String { title }
    let title: String
    var extraContent: AnyView? = nil // Optional extra content for this option.
    
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
