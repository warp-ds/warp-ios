import Foundation
import SwiftUI

extension Warp {
    /// A control that initiates an action with `Warp` designed label.
    public struct Button: View {
        /// Button title.
        private let title: String
        
        /// Leading icon for button.
        private let leadingIcon: Image?
        
        /// Trailing icon for button.
        private let trailingIcon: Image?

        /// Button action.
        private let action: @MainActor @Sendable () -> Void

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
        private let colorProvider: ColorProvider

        public init(
            title: String,
            leadingIcon: Image?,
            trailingIcon: Image?,
            action: @escaping @MainActor @Sendable () -> Void,
            type: Warp.ButtonType,
            size: Warp.ButtonSize,
            isEnabled: Bool,
            fullWidth: Bool,
            isLoading: Bool,
            colorProvider: ColorProvider
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
            self.colorProvider = colorProvider
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
        private func createIconIfPossible(from icon: Image?) -> some View {
            if let icon = icon {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .padding(.trailing, 4)
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

/// Helper constructors introduced to extend image capabilities.
extension Warp.Button {
    public init(
        type: Warp.ButtonType,
        title: String,
        leadingImage: Warp.Button.Icon?,
        trailingImage: Warp.Button.Icon?,
        action: @escaping @MainActor @Sendable () -> Void,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool,
        isLoading: Bool,
        colorProvider: ColorProvider
    ) {
        self.type = type
        self.title = title

        if let image = leadingImage {
            if let description = image.description {
                leadingIcon = Image(image.name, label: Text(description))
            } else {
                leadingIcon = Image(image.name)
            }
        } else {
            leadingIcon = nil
        }
        
        if let image = trailingImage {
            if let description = image.description {
                trailingIcon = Image(image.name, label: Text(description))
            } else {
                trailingIcon = Image(image.name)
            }
        } else {
            trailingIcon = nil
        }

        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
        self.isLoading = isLoading
        self.colorProvider = colorProvider
    }

    public init(
        type: Warp.ButtonType,
        title: String,
        leadingImageSystemName: String?,
        trailingImageSystemName: String?,
        action: @escaping @MainActor @Sendable () -> Void,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool,
        isLoading: Bool,
        colorProvider: ColorProvider
    ) {
        self.type = type
        self.title = title

        if let imageSystemName = leadingImageSystemName {
            leadingIcon = Image(systemName: imageSystemName)
        } else {
            leadingIcon = nil
        }
        
        if let imageSystemName = trailingImageSystemName {
            trailingIcon = Image(systemName: imageSystemName)
        } else {
            trailingIcon = nil
        }

        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
        self.isLoading = isLoading
        self.colorProvider = colorProvider
    }
}

extension Warp.Button {
    /// Factory method.
    public static func create(
        for buttonType: Warp.ButtonType,
        title: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: @escaping @MainActor @Sendable () -> Void,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false,
        isLoading: Bool = false,
        colorProvider: ColorProvider = Warp.Color
    ) -> Warp.Button {
        switch buttonType {
            case .primary:
                return createPrimary(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .secondary:
                return createSecondary(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .tertiary:
                return createTertiary(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .critical:
                return createCritical(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .criticalTertiary:
                return createCriticalTertiary(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .utility:
                return createUtility(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .utilityTertiary:
                return createUtilityTertiary(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )

            case .utilityOverlay:
                return createUtilityOverlay(
                    title: title,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth,
                    isLoading: isLoading,
                    colorProvider: colorProvider
                )
        }
    }
}

extension Warp.ButtonType {
    fileprivate static let allCases: [Warp.ButtonType] = [
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
