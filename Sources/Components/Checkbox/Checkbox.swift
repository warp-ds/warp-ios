import SwiftUI

extension Warp {
    /// A single checkbox view used within `CheckboxGroup`.
    ///
    /// Displays a selectable icon with a label. The checkbox can be in one of three states:
    /// not selected, selected, or partially selected, and it can have different styles.
    ///
    /// - Parameters:
    ///   - isSelected: A `Binding` value indicating whether the checkbox button is selected.
    ///   - label: The text label for the checkbox.
    ///   - style: The style the checkbox can have (default, error, disabled).
    ///   - extraContent: A view that will be displayed beside or below the label.
    ///   - action: A closure that is executed when the checkbox button is tapped.
#if swift(<6.0)
    @preconcurrency @MainActor
#endif
    public struct Checkbox: View {
        /// A `Binding` value indicating whether the checkbox button is selected.
        @Binding var isSelected: Bool
        /// The text label for the checkbox.
        var label: String
        /// The style the checkbox can have (default, error, disabled).
        var style: CheckboxStyle
        /// An optional view that will be displayed beside the label.
        var extraContent: AnyView?
        /// A closure that is executed when the checkbox is tapped.
        var action: () -> Void
        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color
        
        /// Initializes a new `Checkbox`.
        ///
        /// - Parameters:
        ///   - isSelected: A `Binding` value indicating whether the checkbox button is selected.
        ///   - label: The text label for the checkbox.
        ///   - style: The style the checkbox can have (default, error, disabled).
        ///   - extraContent: An optional view that will be displayed beside the label.
        ///   - action: A closure that is executed when the checkbox is tapped.
        public init(isSelected: Binding<Bool>,
                    label: String,
                    style: CheckboxStyle = .default,
                    extraContent: AnyView? = nil,
                    action: @escaping () -> Void) {
            self._isSelected = isSelected
            self.label = label
            self.style = style
            self.extraContent = extraContent
            self.action = action
        }
        
        public var body: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                Image(iconName, bundle: .module)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(tintColor)
                    .frame(width: 20, height: 20)
                    .background(backgroundColor.cornerRadius(4))
                    .animation(.interpolatingSpring())
                
                contentStack
                
                Spacer()
            }
            .onTapGesture {
                if style != .disabled {
                    action()
                }
            }
        }
        
        @ViewBuilder
        private var contentStack: some View {
            HStack(alignment: .top, spacing: Spacing.spacing100) {
                SwiftUI.Text(label)
                    .font(from: .body)
                    .foregroundColor(textColor)
                if let extraContent = extraContent {
                    extraContent
                }
            }
        }
        
        private var iconName: String {
            isSelected ? "checkbox-selected" : "checkbox-notSelected"
        }
        
        private var tintColor: Color {
            switch (isSelected, style) {
            case (true, .default):
                return colorProvider.checkboxBackgroundSelected
            case (true, .error):
                return colorProvider.checkboxNegativeBackgroundSelected
            case (true, .disabled):
                return colorProvider.checkboxBackgroundSelectedDisabled
            case (false, .default):
                return colorProvider.checkboxBorder
            case (false, .error):
                return colorProvider.checkboxNegativeBorder
            case (false, .disabled):
                return colorProvider.checkboxBorderDisabled
            }
        }
        
        private var backgroundColor: Color {
            switch style {
            case .default, .error:
                return colorProvider.checkboxBackground
            case .disabled:
                return colorProvider.checkboxBackgroundDisabled
            }
        }
        
        private var textColor: Color {
            switch style {
            case .default, .error:
                return colorProvider.token.text
            case .disabled:
                return colorProvider.token.textDisabled
            }
        }
    }
}
