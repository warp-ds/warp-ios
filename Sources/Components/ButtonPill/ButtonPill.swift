import SwiftUI

extension Warp {
    public struct ButtonPill: View {
        private let type: ButtonPillType
        @State private var state: ButtonPillState = .default
        @Binding private var selected: Bool
        private let colorProvider: ColorProvider = Warp.Color
        
        public init(type: ButtonPillType,
                    selected: Binding<Bool>) {
            self.type = type
            self._selected = selected
        }
        
        public var body: some View {
            ZStack {
                CustomHeartIcon(fillColor: iconBackgroundColor, borderColor: iconColor, lineWidth: 2)
                    .modifier(shadowModifier)
            }
            .frame(width: 44, height: 44)
            .background(backgroundColor)
            .cornerRadius(22)
            .onLongPressGesture(
                minimumDuration: 0,
                pressing: { inProgress in
                    state = inProgress ? .active : .default
                    if !inProgress {
                        selected.toggle()
                    }
                },
                perform: {}
            )
        }
        
        // MARK: - Styling
        private var iconColor: Color {
            switch (type, selected) {
            case (.overlay, _): return colorProvider.token.iconInvertedStatic
            case (.flat, false): return colorProvider.token.icon
            case (.flat, true): return colorProvider.token.iconSelected
            }
        }
        
        private var iconBackgroundColor: Color {
            switch (type, selected) {
            case (.overlay, false): return colorProvider.token.iconStatic.opacity(state == .default ? 0.5 : 0.9)
            case (.flat, false): return colorProvider.token.backgroundTransparent0
            case (_, true): return colorProvider.token.iconSelected
            }
        }
        
        private var backgroundColor: Color {
            switch state {
            case .default: return colorProvider.token.backgroundTransparent0
            case .active: return colorProvider.buttonPillBackgroundActive.opacity(0.3)
            }
        }
        
        // MARK: - Shadow Modifier
        private var shadowModifier: ShadowModifier {
            switch (type, state) {
            case (.flat, _):
                return ShadowModifier(type: .none)
            case (.overlay, .default):
                return ShadowModifier(type: .small)
            case (.overlay, .active):
                return ShadowModifier(type: .medium)
            }
        }
        
        private enum ShadowType {
            case none
            case small
            case medium
        }
        
        private struct ShadowModifier: ViewModifier {
            let type: ShadowType
            
            public func body(content: Content) -> some View {
                switch type {
                case .none:
                    content
                case .small:
                    content.addShadow(.small)
                case .medium:
                    content.addShadow(.medium)
                }
            }
        }
    }
}

struct ButtonPill_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Warp.ButtonPill(type: .overlay, selected: .constant(false))
            Warp.ButtonPill(type: .overlay, selected: .constant(true))
            Warp.ButtonPill(type: .flat, selected: .constant(false))
            Warp.ButtonPill(type: .flat, selected: .constant(true))
        }
        .padding()
    }
}
