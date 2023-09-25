import Foundation
import SwiftUI

extension Warp {
    /// <#Description#>
    public struct Button: View {
        /// <#Description#>
        private let title: String

        /// <#Description#>
        private let icon: Image?

        /// <#Description#>
        private let action: () -> Void = {}

        /// <#Description#>
        private let type: Warp.ButtonType

        /// <#Description#>
        private let size: Warp.ButtonSize

        /// <#Description#>
        private let isEnabled: Bool

        /// <#Description#>
        private let fullWidth: Bool

        /// <#Description#>
        private let colorProvider = Config.colorProvider

        public init(
            title: String,
            icon: Image?,
            action: () -> Void,
            type: Warp.ButtonType,
            size: Warp.ButtonSize,
            isEnabled: Bool,
            fullWidth: Bool
        ) {
            self.title = title
            self.icon = icon
            self.type = type
            self.size = size
            self.isEnabled = isEnabled
            self.fullWidth = fullWidth
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

                titleView

                createFillerViewIfNeeded()
            }
        }

        @ViewBuilder
        private func createIconIfPossible() -> some View {
            if let icon = icon {
                icon
                    .padding(-2)
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
        title: String,
        imageName: String?,
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool
    ) {
        self.title = title

        if let imageName = imageName {
            icon = Image(imageName)
        } else {
            icon = nil
        }

        self.type = type
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
    }

    public init(
        title: String,
        imageSystemName: String?,
        type: Warp.ButtonType,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool
    ) {
        self.title = title

        if let imageSystemName = imageSystemName {
            icon = Image(systemName: imageSystemName)
        } else {
            icon = nil
        }

        self.type = type
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
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
        fullWidth: Bool = false
    ) -> Warp.Button {
        switch buttonType {
            case .primary:
                return createPrimary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .secondary:
                return createSecondary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .tertiary:
                return createTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .critical:
                return createCritical(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .criticalTertiary:
                return createCriticalTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .utility:
                return createUtility(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .utilityTertiary:
                return createUtilityTertiary(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
                )

            case .utilityOverlay:
                return createUtilityOverlay(
                    title: title,
                    icon: icon,
                    action: action,
                    size: size,
                    isEnabled: isEnabled,
                    fullWidth: fullWidth
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
