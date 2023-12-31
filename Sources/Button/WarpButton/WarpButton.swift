import Foundation
import SwiftUI

extension Warp {
    /// A control that initiates an action with `Warp` designed label.
    public struct Button: View {
        /// Button title.
        private let title: String

        /// Leading icon for button.
        private let icon: Image?

        /// Button action.
        private let action: () -> Void

        /// Button type.
        private let type: Warp.ButtonType

        /// Button size.
        private let size: Warp.ButtonSize

        /// Flag indicating that interactions are enabled.
        private let isEnabled: Bool

        /// Flag indicating whether this view should fill the parent view horizontally.
        private let fullWidth: Bool

        /// Object that will provide needed colors.
        private let colorProvider: ColorProvider

        public init(
            title: String,
            icon: Image?,
            action: @escaping () -> Void,
            type: Warp.ButtonType,
            size: Warp.ButtonSize,
            isEnabled: Bool,
            fullWidth: Bool,
            colorProvider: ColorProvider
        ) {
            self.title = title
            self.icon = icon
            self.action = action
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
            self.fullWidth = fullWidth
            self.colorProvider = colorProvider
        }

        public var body: some View {
            SwiftUI.Button(
                action: action,
                label: {
                    buttonView
                }
            )
            .disabled(!isEnabled)
            .buttonStyle(
                .warp(
                    type: type,
                    size: size,
                    colorProvider: colorProvider,
                    isEnabled: isEnabled
                )
            )
        }

        private var buttonView: some View {
            HStack {
                createFillerViewIfNeeded()

                createIconIfPossible()

                if !title.isEmpty {
                    titleView
                }

                createFillerViewIfNeeded()
            }
        }

        @ViewBuilder
        private func createIconIfPossible() -> some View {
            if let icon = icon {
                icon
                    .resizable()
                    .frame(width: 16, height: 16)
                    .clipped()
                    .padding(.trailing, 4)
            }
        }

        private var titleView: some View {
            Text(title)
        }

        @ViewBuilder
        private func createFillerViewIfNeeded() -> some View {
            if fullWidth {
                Spacer()
            }
        }
    }
}

/// Helper constructors introduced to extend image capabilities.
extension Warp.Button {
    public init(
        type: Warp.ButtonType,
        title: String,
        image: Warp.Button.Icon?,
        action: @escaping () -> Void,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool,
        colorProvider: ColorProvider
    ) {
        self.type = type
        self.title = title

        if let image = image {
            if let description = image.description {
                icon = Image(image.name, label: Text(description))
            } else {
                icon = Image(image.name)
            }
        } else {
            icon = nil
        }

        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
        self.colorProvider = colorProvider
    }

    public init(
        type: Warp.ButtonType,
        title: String,
        imageSystemName: String?,
        action: @escaping () -> Void,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool,
        colorProvider: ColorProvider
    ) {
        self.type = type
        self.title = title

        if let imageSystemName = imageSystemName {
            icon = Image(systemName: imageSystemName)
        } else {
            icon = nil
        }

        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
        self.colorProvider = colorProvider
    }
}

extension Warp.Button {
    /// Factory method.
    public static func create(
        for buttonType: Warp.ButtonType,
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        colorProvider: ColorProvider = Warp.Config.colorProvider
    ) -> Warp.Button {
        switch buttonType {
            case .primary:
                return createPrimary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .secondary:
                return createSecondary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .tertiary:
                return createTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .critical:
                return createCritical(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .criticalTertiary:
                return createCriticalTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .utility:
                return createUtility(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .utilityTertiary:
                return createUtilityTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )

            case .utilityOverlay:
                return createUtilityOverlay(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    colorProvider: colorProvider
                )
        }
    }
}

extension Warp.ButtonType {
    fileprivate static var allCases: [Warp.ButtonType] = [
        .primary,
        .secondary,
        .tertiary,
        .critical,
        .criticalTertiary,
        .utility,
        .utilityTertiary,
        .utilityOverlay
    ]
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
                    Warp.Button.create(
                        for: buttonType,
                        title: "\(capitalizedName) button",
                        action: {}
                    )

                    // Disabled
                    Warp.Button.create(
                        for: buttonType,
                        title: "Disabled \(name) button",
                        action: {},
                        isEnabled: false
                    )
                }
            }, label: {
                Text(capitalizedName)
            }
        )
    }
}
