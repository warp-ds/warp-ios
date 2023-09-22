import Foundation
import SwiftUI

extension Warp {
    public struct Button: View {
        /// <#Description#>
        private let title: String

        /// <#Description#>
        private let icon: String?

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
            icon: String? = nil,
            action: () -> Void = {},
            type: Warp.ButtonType,
            size: Warp.ButtonSize = .big,
            isEnabled: Bool = true,
            fullWidth: Bool = false
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
                WarpButtonStyle(
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
                Image(systemName: icon)
//                    .font(type.fontSize)
                    .padding(-2)
            }
        }

        private var titleView: some View {
            Text(title)
//                .font(fontSize)
//                .fontWeight(fontWeight)
//                .minimumScaleFactor(0.1)
//                .lineLimit(lineLimit)
//                .truncationMode(truncationMode)
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
            Group {
                Warp.Button.createPrimary(title: "Primary button", action: {})

                Warp.Button.createDisabledPrimary(title: "Disabled primary button")
            }

            Group {
                Warp.Button.createSecondary(title: "Secondary button", action: {})

                Warp.Button.createDisabledSecondary(title: "Disabled secondary button")
            }

            Group {
                Warp.Button.createTertiary(title: "Tertiary button", action: {})

                Warp.Button.createDisabledTertiary(title: "Disabled tertiary button")
            }

            Group {
                Warp.Button.createCritical(title: "Critical button", action: {})

                Warp.Button.createDisabledCritical(title: "Disabled critical button")
            }

            Group {
                Warp.Button.createCriticalTertiary(title: "Critical tertiary button", action: {})

                Warp.Button.createDisabledCriticalTertiary(title: "Disabled critical tertiary button")
            }

            Group {
                Warp.Button.createUtility(title: "Utility button", action: {})

                Warp.Button.createDisabledUtility(title: "Disabled utility button")
            }

            Group {
                Warp.Button.createUtilityTertiary(title: "Utility tertiary button", action: {})

                Warp.Button.createDisabledUtilityTertiaryType(title: "Disabled utility tertiary button")
            }

            Group {
                Warp.Button.createUtilityOverlay(title: "Utility overlay button", action: {})

                Warp.Button.createDisabledUtilityOverlay(title: "Disabled utility overlay button")
            }
        }
    }
}
