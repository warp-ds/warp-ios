import SwiftUI

extension Warp {
    /// A customizable button group component that can function as a segmented controller or a multi-select button group.
    ///
    /// - Parameters:
    ///   - buttons: An array of tuples, each containing a title and a selection state (`Bool`) for each button.
    ///   - singleSelect: A boolean value indicating if only one button can be selected at a time (`true` for single-select mode, `false` for multi-select mode).
    ///   - onSelectionChange: An optional closure that is called whenever the selection state of the buttons changes.
    ///
    /// `ButtonGroup` provides two modes:
    /// - **Single-select mode** (`singleSelect = true`): Behaves like a segmented controller, where selecting one button deselects all others.
    /// - **Multi-select mode** (`singleSelect = false`): Allows multiple buttons to be selected independently.
    public struct ButtonGroup: View {
        @Binding public var buttons: [(title: String, isSelected: Bool)]
        public let onSelectionChange: (([(String, Bool)]) -> Void)?
        public let singleSelect: Bool
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes the ButtonGroup view with an array of buttons, selection mode, and a selection change handler.
        ///
        /// - Parameters:
        ///   - buttons: A binding to an array of tuples representing each button's title and selection state.
        ///   - singleSelect: Specifies the selection behavior. If `true`, only one button can be selected at a time. If `false`, multiple buttons can be selected.
        ///   - onSelectionChange: An optional closure that receives the updated button array whenever the selection changes.
        public init(buttons: Binding<[(title: String, isSelected: Bool)]>, singleSelect: Bool = false, onSelectionChange: (([(String, Bool)]) -> Void)? = nil) {
            self._buttons = buttons
            self.singleSelect = singleSelect
            self.onSelectionChange = onSelectionChange
        }
        
        public var body: some View {
            HStack(spacing: 0) {
                ForEach(buttons.indices, id: \.self) { index in
                    SwiftUI.Text(buttons[index].title)
                        .font(from: .captionStrong)
                        .foregroundColor(textColor(for: buttons[index].isSelected))
                        .padding(.vertical, Warp.Spacing.spacing100)
                        .padding(.horizontal, Warp.Spacing.spacing150)
                        .background(backgroundColor(for: buttons[index].isSelected))
                        .cornerRadius(Warp.Border.borderRadius100, corners: corners(for: index))
                        .overlay(
                            // Add a conditional border on the right side only
                            Rectangle()
                                .fill(colorProvider.token.border)
                                .frame(width: index < buttons.count - 1 ? 1 : 0)
                                .frame(maxHeight: .infinity)
                                .offset(x: 0.5),
                            alignment: .trailing
                        )
                        .onTapGesture {
                            toggleSelection(at: index)
                        }
                }
            }
            .background(colorProvider.token.background)
            .overlay(
                RoundedRectangle(cornerRadius: Warp.Border.borderRadius100)
                    .stroke(colorProvider.token.border, lineWidth: 1)
            )
        }
        
        /// Updates the selection state of the button at a specific index.
        ///
        /// - Parameter index: The index of the button being tapped.
        ///
        /// If `singleSelect` is `true`, it deselects all other buttons and selects only the tapped button.
        /// Otherwise, it toggles the selection state of the tapped button, allowing multiple selections.
        private func toggleSelection(at index: Int) {
            if singleSelect {
                buttons.indices.forEach { buttons[$0].isSelected = ($0 == index) }
            } else {
                buttons[index].isSelected.toggle()
            }
            onSelectionChange?(buttons)
        }
        
        private func textColor(for isSelected: Bool) -> Color {
            isSelected ? colorProvider.token.textInverted : colorProvider.token.textLink
        }
        
        private func backgroundColor(for isSelected: Bool) -> Color {
            isSelected ? colorProvider.token.backgroundPrimary : colorProvider.token.background
        }
        
        private func corners(for index: Int) -> UIRectCorner {
            if index == 0 {
                return [.topLeft, .bottomLeft]
            } else if index == buttons.count - 1 {
                return [.topRight, .bottomRight]
            } else {
                return []
            }
        }
    }
}

#Preview {
    VStack {
        Warp.ButtonGroup(buttons: Binding(get: {
            [
                ("Option 1", false),
                ("Option 2", false),
                ("Option 3", false)
            ]
        }, set: { _ in
            
        }), singleSelect: true) { updatedButtons in
            print("Updated button states:", updatedButtons)
        }
        .padding()
        Spacer()
    }
}
