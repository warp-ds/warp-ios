import SwiftUI

extension Warp {
    /// A switch component used to toggle between two possible states.
    ///
    /// The `Warp.Switch` component allows for switching between "on" and "off". It supports two states: `.default` and `.disabled`.
    ///
    /// **Usage:**
    /// ```swift
    /// Warp.Switch(
    ///     isOn: .constant(true),
    ///     state: .default
    /// )
    /// ```
    ///
    /// - Parameters:
    ///   - isOn: Binding to a Boolean value indicating whether the switch is on or off.
    ///   - state: The state of the switch. Options are `.default` and `.disabled`.
    public struct Switch: View {
        
        // MARK: - Properties
        
        /// Object responsible for providing colors in different environments and variants.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Binding to a Boolean value indicating whether the switch is on or off.
        @Binding private var isOn: Bool
        
        /// The state of the switch.
        private let state: Warp.SwitchState
        
        // MARK: - Initialization
        
        /// Creates a new `Switch` instance.
        ///
        /// - Parameters:
        ///   - isOn: Binding to a Boolean value indicating whether the switch is on or off.
        ///   - state: The state of the switch. Defaults to `.default`.
        public init(
            isOn: Binding<Bool>,
            state: Warp.SwitchState = .default
        ) {
            self._isOn = isOn
            self.state = state
        }
        
        // MARK: - Body
        
        public var body: some View {
            Toggle(isOn: $isOn) {
                EmptyView()
            }
            .toggleStyle(SwitchStyle(state: state, isOn: isOn, colorProvider: colorProvider))
            .disabled(state == .disabled)
            .labelsHidden()
            .frame(width: 44, height: 24)
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        Warp.Switch(isOn: .constant(true), state: .default)
        Warp.Switch(isOn: .constant(false), state: .default)
        Warp.Switch(isOn: .constant(true), state: .disabled)
        Warp.Switch(isOn: .constant(false), state: .disabled)
    }
    .padding()
}
