import SwiftUI

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
                           colors: [FinnColors.transparent,
                                    FinnColors.white,
                                    FinnColors.gray50,
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
                                    FinnColors.gray950,
                                    FinnColors.black])
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
