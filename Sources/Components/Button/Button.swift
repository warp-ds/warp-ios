import Foundation
import SwiftUI

extension Warp {
    /// A control that initiates an action with `Warp` designed label.
    public struct Button: View, Hashable {
        /// Button title.
        private let title: String

        /// Leading icon for button.
        private let leadingIcon: Warp.Icon?
        
        /// Trailing icon for button.
        private let trailingIcon: Warp.Icon?

        /// Button action.
        let action: () -> Void

        /// Button type.
        private let type: Warp.ButtonType

        /// Button size.
        private let size: Warp.ButtonSize

        /// Flag indicating that interactions are enabled.
        private let isEnabled: Bool

        /// Flag indicating whether this view should fill the parent view horizontally.
        private let fullWidth: Bool
        
        /// Flag indicating whether this view is loading.
        private let isLoading: Bool

        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider = Warp.Color

        public static func == (lhs: Button, rhs: Button) -> Bool {
            lhs.title == rhs.title &&
            lhs.type == rhs.type &&
            lhs.size == rhs.size
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(title)
            hasher.combine(type)
            hasher.combine(size)
        }

        public init(
            title: String,
            leadingIcon: Warp.Icon? = nil,
            trailingIcon: Warp.Icon? = nil,
            action: @escaping () -> Void,
            type: Warp.ButtonType = .primary,
            size: Warp.ButtonSize = .big,
            isEnabled: Bool = true,
            fullWidth: Bool = false,
            isLoading: Bool = false
        ) {
            self.title = title
            self.leadingIcon = leadingIcon
            self.trailingIcon = trailingIcon
            self.action = action
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
            self.fullWidth = fullWidth
            self.isLoading = isLoading
        }

        public var body: some View {
            SwiftUI.Button(
                action: action,
                label: {
                    buttonView
                }
            )
            .disabled(!isEnabled || isLoading)
            .buttonStyle(
                .warp(
                    type: type,
                    size: size,
                    colorProvider: colorProvider,
                    isEnabled: isEnabled,
                    isLoading: isLoading
                )
            )
        }

        private var buttonView: some View {
            HStack {
                createFillerViewIfNeeded()

                createIconIfPossible(from: leadingIcon)

                if !title.isEmpty {
                    titleView
                }

                createIconIfPossible(from: trailingIcon)

                createFillerViewIfNeeded()
            }
        }

        @ViewBuilder
        private func createIconIfPossible(from icon: Warp.Icon?) -> some View {
            if let icon = icon {
                icon.image
                    .frame(width: 16, height: 16)
            }
        }

        private var titleView: some View {
            SwiftUI.Text(title)
        }

        @ViewBuilder
        private func createFillerViewIfNeeded() -> some View {
            if fullWidth {
                Spacer()
            }
        }
    }
}

private struct WarpButtonPreview: PreviewProvider {
    static var previews: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                ForEach(Warp.ButtonType.allCases, id: \.self) { buttonType in
                    createView(for: buttonType)
                }
            }
            .padding(.horizontal)
        }
    }

    private static func createView(for buttonType: Warp.ButtonType) -> some View {
        let name = String(describing: buttonType)
        let capitalizedName = name.capitalized

        return GroupBox(
            content: {
                VStack {
                    // Normal
                    Warp.Button(
                        title: "\(capitalizedName) button",
                        action: {},
                        type: buttonType
                    )

                    // Disabled
                    Warp.Button(
                        title: "Disabled \(name) button",
                        action: {},
                        type: buttonType,
                        isEnabled: false
                    )
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}
