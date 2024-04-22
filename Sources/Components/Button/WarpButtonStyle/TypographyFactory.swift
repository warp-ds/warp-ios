import Foundation
import struct SwiftUI.Font
import struct SwiftUI.Text

extension Warp.Button {
    /// Factory responsible for resolving button label's typography needs.
    struct TypographyFactory {
        private let type: Warp.ButtonType

        init(for type: Warp.ButtonType) {
            self.type = type
        }

        /// Font associate with button type.
        var font: Font {
            let font: Font

            if type.isUtilityRelatedButton {
                font = Warp.Typography.detailStrong.font
            } else {
                font = Warp.Typography.title4.font
            }

            return font
        }

        /// Font weight associate with button type.
        var fontWeight: Font.Weight {
            if type.isUtilityRelatedButton {
                return .regular
            }

            return .medium
        }

        /// Button label line limit.
        /// It will be decided based on button type.
        var lineLimit: Int {
            /*type == .critical ? Int.max : */
            1
        }

        /// The type of truncation to apply to a line of text when it’s too long to fit in the available space.
        /// It will be decided based on button type.
        var truncationMode: Text.TruncationMode {
            /*type == .primary ? .tail : */
            .middle
        }
    }
}
