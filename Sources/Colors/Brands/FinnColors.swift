import SwiftUI

/// Source: https://docs.google.com/spreadsheets/d/1Q-Tr_dwJVfxgh3527IFjXQKqtnPPM42QeIr-M6q-zu8/edit#gid=15834355
struct FinnColors {
    /// FINN color palette
    static let blue50  = Color(hex: "#eff5ff")
    static let blue100 = Color(hex: "#e1edfe")
    static let blue200 = Color(hex: "#c2dafe")
    static let blue300 = Color(hex: "#9ac1fe")
    static let blue400 = Color(hex: "#5c9cff")
    static let blue500 = Color(hex: "#2b7eff")
    static let blue600 = Color(hex: "#0063fb")
    static let blue700 = Color(hex: "#244eb3")
    static let blue800 = Color(hex: "#223474")
    static let blue900 = Color(hex: "#191d34")
    
    static let aqua50  = Color(hex: "#f1f9ff")
    static let aqua100 = Color(hex: "#e0f6ff")
    static let aqua200 = Color(hex: "#b6f0ff")
    static let aqua300 = Color(hex: "#66e0ff")
    static let aqua400 = Color(hex: "#06befb")
    static let aqua500 = Color(hex: "#03a3dd")
    static let aqua600 = Color(hex: "#0386bf")
    static let aqua700 = Color(hex: "#1e648a")
    static let aqua800 = Color(hex: "#1d435a")
    static let aqua900 = Color(hex: "#15242f")
    
    static let green50  = Color(hex: "#ebfff6")
    static let green100 = Color(hex: "#cdfee5")
    static let green200 = Color(hex: "#9efcd1")
    static let green300 = Color(hex: "#67eeb8")
    static let green400 = Color(hex: "#2ee69f")
    static let green500 = Color(hex: "#18c884")
    static let green600 = Color(hex: "#059e6f")
    static let green700 = Color(hex: "#1d7454")
    static let green800 = Color(hex: "#1b4d39")
    static let green900 = Color(hex: "#14291f")
    
    static let yellow50  = Color(hex: "#fff8e6")
    static let yellow100 = Color(hex: "#fff5c8")
    static let yellow200 = Color(hex: "#feef90")
    static let yellow300 = Color(hex: "#fae76b")
    static let yellow400 = Color(hex: "#ffe11f")
    static let yellow500 = Color(hex: "#eeb61b")
    static let yellow600 = Color(hex: "#d5840b")
    static let yellow700 = Color(hex: "#9b621e")
    static let yellow800 = Color(hex: "#654118")
    static let yellow900 = Color(hex: "#352310")
    
    static let red50  = Color(hex: "#fff5f5")
    static let red100 = Color(hex: "#ffefef")
    static let red200 = Color(hex: "#ffd1d1")
    static let red300 = Color(hex: "#ff9999")
    static let red400 = Color(hex: "#ff5844")
    static let red500 = Color(hex: "#fa270f")
    static let red600 = Color(hex: "#d91f0a")
    static let red700 = Color(hex: "#9e2216")
    static let red800 = Color(hex: "#681d11")
    static let red900 = Color(hex: "#38140b")
    
    static let gray50  = Color(hex: "#F6F6F6")
    static let gray100 = Color(hex: "#F0F0F2")
    static let gray200 = Color(hex: "#DEDEE3")
    static let gray300 = Color(hex: "#CACAD1")
    static let gray400 = Color(hex: "#AFAFB8")
    static let gray500 = Color(hex: "#84848F")
    static let gray600 = Color(hex: "#5C5C66")
    static let gray700 = Color(hex: "#47474F")
    static let gray750 = Color(hex: "#333338")
    static let gray800 = Color(hex: "#2B2B30")
    static let gray850 = Color(hex: "#26262B")
    static let gray900 = Color(hex: "#1B1B1F")
    static let gray950 = Color(hex: "#121212")
    
    static let white = Color(hex: "#ffffff")
    static let black = Color(hex: "#000000")
}

struct FinnUIColors {
    /// FINN color palette
    static let blue50  = UIColor(hex: "#eff5ff")
    static let blue100 = UIColor(hex: "#e1edfe")
    static let blue200 = UIColor(hex: "#c2dafe")
    static let blue300 = UIColor(hex: "#9ac1fe")
    static let blue400 = UIColor(hex: "#5c9cff")
    static let blue500 = UIColor(hex: "#2b7eff")
    static let blue600 = UIColor(hex: "#0063fb")
    static let blue700 = UIColor(hex: "#244eb3")
    static let blue800 = UIColor(hex: "#223474")
    static let blue900 = UIColor(hex: "#191d34")
    
    static let aqua50  = UIColor(hex: "#f1f9ff")
    static let aqua100 = UIColor(hex: "#e0f6ff")
    static let aqua200 = UIColor(hex: "#b6f0ff")
    static let aqua300 = UIColor(hex: "#66e0ff")
    static let aqua400 = UIColor(hex: "#06befb")
    static let aqua500 = UIColor(hex: "#03a3dd")
    static let aqua600 = UIColor(hex: "#0386bf")
    static let aqua700 = UIColor(hex: "#1e648a")
    static let aqua800 = UIColor(hex: "#1d435a")
    static let aqua900 = UIColor(hex: "#15242f")
    
    static let green50  = UIColor(hex: "#ebfff6")
    static let green100 = UIColor(hex: "#cdfee5")
    static let green200 = UIColor(hex: "#9efcd1")
    static let green300 = UIColor(hex: "#67eeb8")
    static let green400 = UIColor(hex: "#2ee69f")
    static let green500 = UIColor(hex: "#18c884")
    static let green600 = UIColor(hex: "#059e6f")
    static let green700 = UIColor(hex: "#1d7454")
    static let green800 = UIColor(hex: "#1b4d39")
    static let green900 = UIColor(hex: "#14291f")
    
    static let yellow50  = UIColor(hex: "#fff8e6")
    static let yellow100 = UIColor(hex: "#fff5c8")
    static let yellow200 = UIColor(hex: "#feef90")
    static let yellow300 = UIColor(hex: "#fae76b")
    static let yellow400 = UIColor(hex: "#ffe11f")
    static let yellow500 = UIColor(hex: "#eeb61b")
    static let yellow600 = UIColor(hex: "#d5840b")
    static let yellow700 = UIColor(hex: "#9b621e")
    static let yellow800 = UIColor(hex: "#654118")
    static let yellow900 = UIColor(hex: "#352310")
    
    static let red50  = UIColor(hex: "#fff5f5")
    static let red100 = UIColor(hex: "#ffefef")
    static let red200 = UIColor(hex: "#ffd1d1")
    static let red300 = UIColor(hex: "#ff9999")
    static let red400 = UIColor(hex: "#ff5844")
    static let red500 = UIColor(hex: "#fa270f")
    static let red600 = UIColor(hex: "#d91f0a")
    static let red700 = UIColor(hex: "#9e2216")
    static let red800 = UIColor(hex: "#681d11")
    static let red900 = UIColor(hex: "#38140b")
    
    static let gray50  = UIColor(hex: "#F6F6F6")
    static let gray100 = UIColor(hex: "#F0F0F2")
    static let gray200 = UIColor(hex: "#DEDEE3")
    static let gray300 = UIColor(hex: "#CACAD1")
    static let gray400 = UIColor(hex: "#AFAFB8")
    static let gray500 = UIColor(hex: "#84848F")
    static let gray600 = UIColor(hex: "#5C5C66")
    static let gray700 = UIColor(hex: "#47474F")
    static let gray750 = UIColor(hex: "#333338")
    static let gray800 = UIColor(hex: "#2B2B30")
    static let gray850 = UIColor(hex: "#26262B")
    static let gray900 = UIColor(hex: "#1B1B1F")
    static let gray950 = UIColor(hex: "#121212")
    
    static let white = UIColor(hex: "#ffffff")
    static let black = UIColor(hex: "#000000")
}

public struct FinnColorsView: View {
    public init() {}

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Blue",
                           colors: [FinnColors.blue50,
                                    FinnColors.blue100,
                                    FinnColors.blue200,
                                    FinnColors.blue300,
                                    FinnColors.blue400,
                                    FinnColors.blue500,
                                    FinnColors.blue600,
                                    FinnColors.blue700,
                                    FinnColors.blue800,
                                    FinnColors.blue900])
                
                createView(for: "Aqua",
                           colors: [FinnColors.aqua50,
                                    FinnColors.aqua100,
                                    FinnColors.aqua200,
                                    FinnColors.aqua300,
                                    FinnColors.aqua400,
                                    FinnColors.aqua500,
                                    FinnColors.aqua600,
                                    FinnColors.aqua700,
                                    FinnColors.aqua800,
                                    FinnColors.aqua900])
                
                createView(for: "Green",
                           colors: [FinnColors.green50,
                                    FinnColors.green100,
                                    FinnColors.green200,
                                    FinnColors.green300,
                                    FinnColors.green400,
                                    FinnColors.green500,
                                    FinnColors.green600,
                                    FinnColors.green700,
                                    FinnColors.green800,
                                    FinnColors.green900])
                
                createView(for: "Yellow",
                           colors: [FinnColors.yellow50,
                                    FinnColors.yellow100,
                                    FinnColors.yellow200,
                                    FinnColors.yellow300,
                                    FinnColors.yellow400,
                                    FinnColors.yellow500,
                                    FinnColors.yellow600,
                                    FinnColors.yellow700,
                                    FinnColors.yellow800,
                                    FinnColors.yellow900])
                
                createView(for: "Red",
                           colors: [FinnColors.red50,
                                    FinnColors.red100,
                                    FinnColors.red200,
                                    FinnColors.red300,
                                    FinnColors.red400,
                                    FinnColors.red500,
                                    FinnColors.red600,
                                    FinnColors.red700,
                                    FinnColors.red800,
                                    FinnColors.red900])
                
                createView(for: "Gray",
                           colors: [FinnColors.gray50,
                                    FinnColors.gray100,
                                    FinnColors.gray200,
                                    FinnColors.gray300,
                                    FinnColors.gray400,
                                    FinnColors.gray500,
                                    FinnColors.gray600,
                                    FinnColors.gray700,
                                    FinnColors.gray750,
                                    FinnColors.gray800,
                                    FinnColors.gray850,
                                    FinnColors.gray900,
                                    FinnColors.gray950])
            }
            .padding(.horizontal)
            .navigationTitle("Colors")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func createView(for colorGroup: String, colors: [Color]) -> some View {
        return GroupBox(
            content: {
                HStack(spacing: 1) {
                    ForEach(colors, id: \.self) { color in
                        Rectangle()
                            .aspectRatio(1.0, contentMode: .fit)
                            .foregroundColor(color)
                    }
                }
            }, label: {
                Text(colorGroup)
            }
        )
    }
}

#Preview {
    FinnColorsView()
}
