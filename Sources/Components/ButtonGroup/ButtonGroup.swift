import SwiftUI

extension Warp {
    public struct ButtonGroup: View {
        @Binding public var buttons: [(title: String, isSelected: Bool)]
        public let onSelectionChange: (([(String, Bool)]) -> Void)?
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        public init(buttons: Binding<[(title: String, isSelected: Bool)]>, onSelectionChange: (([(String, Bool)]) -> Void)? = nil) {
            self._buttons = buttons
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
                                .frame(width: index < buttons.count - 1 ? 1 : 0) // Only add the divider if it's not the last button
                                .frame(maxHeight: .infinity)
                                .offset(x: 0.5), // Small offset to position the line correctly
                            alignment: .trailing
                        )
                        .onTapGesture {
                            buttons[index].isSelected.toggle()
                            onSelectionChange?(buttons)
                        }
                }
            }
            .background(colorProvider.token.background)
            .overlay(
                RoundedRectangle(cornerRadius: Warp.Border.borderRadius100)
                    .stroke(colorProvider.token.border, lineWidth: 1)
            )
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
            
        })) { updatedButtons in
            print("Updated button states:", updatedButtons)
        }
        .padding()
        Spacer()
    }
}
