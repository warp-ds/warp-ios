import Foundation
import protocol SwiftUI.View

public struct DefaultRadioStyle: RadioStyle {
    public func makeBody(configuration: Configuration) -> some View {
        if configuration.isSelected {
            configuration.selectedLabel
        } else {
            configuration.deselectedLabel
        }
    }
}
