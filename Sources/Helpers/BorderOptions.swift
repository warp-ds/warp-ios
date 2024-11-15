import SwiftUI

/// Define a custom border option type to specify the sides
public struct BorderOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    static let top = BorderOptions(rawValue: 1 << 0)
    static let bottom = BorderOptions(rawValue: 1 << 1)
    static let leading = BorderOptions(rawValue: 1 << 2)
    static let trailing = BorderOptions(rawValue: 1 << 3)
    
    static let all: BorderOptions = [.top, .bottom, .leading, .trailing]
}

extension View {
    public func border(_ color: Color = Warp.Color.token.border, width: CGFloat = 1, sides: BorderOptions) -> some View {
        overlay(
            VStack(spacing: 0) {
                if sides.contains(.top) {
                    Rectangle()
                        .fill(color)
                        .frame(height: width)
                }
                
                HStack(spacing: 0) {
                    if sides.contains(.leading) {
                        Rectangle()
                            .fill(color)
                            .frame(width: width)
                    }
                    
                    Spacer()
                    
                    if sides.contains(.trailing) {
                        Rectangle()
                            .fill(color)
                            .frame(width: width)
                    }
                }
                
                if sides.contains(.bottom) {
                    Rectangle()
                        .fill(color)
                        .frame(height: width)
                }
            }
        )
    }
}
