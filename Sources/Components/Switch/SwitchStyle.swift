import SwiftUI

extension Warp {
    /// A custom toggle style used for the Warp switch.
    ///
    /// The `Warp.SwitchStyle` allows for customizing the appearance of the toggle switch, including the background and circle colors. It supports two states: `.default` and `.disabled`.
    public struct SwitchStyle: ToggleStyle {
        /// The state of the switch, determining its appearance and behavior.
        var state: Warp.SwitchState
        
        /// Whether the switch is currently on or off.
        var isOn: Bool
        
        /// Object responsible for providing colors in different environments and variants.
        var colorProvider: ColorProvider
        
        public func makeBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(backgroundColor)
                        .frame(width: 44, height: 24)
                    Circle()
                        .fill(circleColor)
                        .frame(width: 16, height: 16)
                        .offset(x: configuration.isOn ? 9 : -9)
                        .animation(.easeInOut, value: configuration.isOn)
                }
                .onTapGesture {
                    if state != .disabled {
                        configuration.isOn.toggle()
                    }
                }
            }
        }
        
        /// Determines the background color of the switch based on the current state.
        private var backgroundColor: Color {
            switch state {
            case .default:
                return isOn ? colorProvider.token.backgroundPrimary : colorProvider.token.backgroundSubtle
            case .disabled:
                return colorProvider.token.backgroundDisabledSubtle
            }
        }
        
        /// Determines the color of the circle based on the current state.
        private var circleColor: Color {
            switch state {
            case .default:
                return colorProvider.token.background
            case .disabled:
                return colorProvider.token.backgroundDisabled
            }
        }
    }
}
