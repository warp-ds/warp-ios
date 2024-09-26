import Foundation
import struct SwiftUI.Font
import struct SwiftUI.Text

@MainActor extension Warp.Button {
    /// Factory responsible for resolving button label's typography needs.
    @MainActor
    struct TypographyFactory {
        private let type: Warp.ButtonType
        private let size: Warp.ButtonSize
        
        init(for type: Warp.ButtonType,
             size: Warp.ButtonSize) {
            self.type = type
            self.size = size
        }
        
        /// Font associate with button type.
        var font: Font {
            let font: Font
            
            if type.isUtilityRelatedButton || size == .small {
                font = Warp.Typography.detailStrong.font
            } else {
                font = Warp.Typography.title4.font
            }

            return font
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
