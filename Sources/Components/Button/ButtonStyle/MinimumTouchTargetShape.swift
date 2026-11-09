import Foundation
import SwiftUI

extension Warp.Button {
    /// Hit-testing shape that makes a button tappable over at least 44 x 44 pt, the minimum touch
    /// target in Apple's Human Interface Guidelines, without changing its layout size.
    ///
    /// The visual size stays the layout size: the shape only grows the tappable area outside the
    /// button's frame, so nothing around the button moves. It is centred on the button and extends
    /// each side by `max(0, (44 - side) / 2)`, measured on the rendered size. A 32 pt tall small or
    /// utility button gets 6 pt above and below, an icon-only button narrower than 44 pt also grows
    /// sideways, and a button that is already 44 pt or larger (`.big`, or any size enlarged by
    /// Dynamic Type) keeps exactly its own frame.
    ///
    /// Where two extended areas overlap, the view drawn on top (in a stack, the later one) gets the
    /// tap. The area cannot reach outside a `List` row, or outside a `UIHostingController` view sized
    /// to the button: UIKit only delivers a touch to the view it lands in.
    struct MinimumTouchTargetShape: Shape {
        /// Minimum width and height of the tappable area.
        static let minimumSize: CGFloat = 44

        func path(in rect: CGRect) -> Path {
            Path(Self.touchTarget(for: rect))
        }

        /// The tappable rectangle for a button laid out in `rect`.
        static func touchTarget(for rect: CGRect) -> CGRect {
            let horizontalExtension = max(0, (minimumSize - rect.width) / 2)
            let verticalExtension = max(0, (minimumSize - rect.height) / 2)

            return rect.insetBy(dx: -horizontalExtension, dy: -verticalExtension)
        }
    }
}
