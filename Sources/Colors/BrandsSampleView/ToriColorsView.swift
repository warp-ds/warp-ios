import SwiftUI

public struct ToriColorsView: View {
    public init() {}

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Blueberry",
                           colors: [ToriColors.blueberry50,
                                    ToriColors.blueberry100,
                                    ToriColors.blueberry200,
                                    ToriColors.blueberry300,
                                    ToriColors.blueberry400,
                                    ToriColors.blueberry500,
                                    ToriColors.blueberry600,
                                    ToriColors.blueberry700,
                                    ToriColors.blueberry800,
                                    ToriColors.blueberry900])
                
                createView(for: "Watermelon",
                           colors: [ToriColors.watermelon50,
                                    ToriColors.watermelon100,
                                    ToriColors.watermelon200,
                                    ToriColors.watermelon300,
                                    ToriColors.watermelon400,
                                    ToriColors.watermelon500,
                                    ToriColors.watermelon600,
                                    ToriColors.watermelon700,
                                    ToriColors.watermelon800,
                                    ToriColors.watermelon900])
                
                createView(for: "Blue",
                           colors: [ToriColors.blue50,
                                    ToriColors.blue100,
                                    ToriColors.blue200,
                                    ToriColors.blue300,
                                    ToriColors.blue400,
                                    ToriColors.blue500,
                                    ToriColors.blue600,
                                    ToriColors.blue700,
                                    ToriColors.blue800,
                                    ToriColors.blue900])
                
                createView(for: "Green",
                           colors: [ToriColors.green50,
                                    ToriColors.green100,
                                    ToriColors.green200,
                                    ToriColors.green300,
                                    ToriColors.green400,
                                    ToriColors.green500,
                                    ToriColors.green600,
                                    ToriColors.green700,
                                    ToriColors.green800,
                                    ToriColors.green900])
                
                createView(for: "Yellow",
                           colors: [ToriColors.yellow50,
                                    ToriColors.yellow100,
                                    ToriColors.yellow200,
                                    ToriColors.yellow300,
                                    ToriColors.yellow400,
                                    ToriColors.yellow500,
                                    ToriColors.yellow600,
                                    ToriColors.yellow700,
                                    ToriColors.yellow800,
                                    ToriColors.yellow900])
                
                createView(for: "Red",
                           colors: [ToriColors.red50,
                                    ToriColors.red100,
                                    ToriColors.red200,
                                    ToriColors.red300,
                                    ToriColors.red400,
                                    ToriColors.red500,
                                    ToriColors.red600,
                                    ToriColors.red700,
                                    ToriColors.red800,
                                    ToriColors.red900])
                
                createView(for: "Gray",
                           colors: [ToriColors.transparent,
                                    ToriColors.white,
                                    ToriColors.gray50,
                                    ToriColors.gray100,
                                    ToriColors.gray200,
                                    ToriColors.gray300,
                                    ToriColors.gray400,
                                    ToriColors.gray500,
                                    ToriColors.gray600,
                                    ToriColors.gray700,
                                    ToriColors.gray750,
                                    ToriColors.gray800,
                                    ToriColors.gray850,
                                    ToriColors.gray900,
                                    ToriColors.gray950,
                                    ToriColors.black])
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
    ToriColorsView()
}
