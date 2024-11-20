import SwiftUI

public struct BlocketColorsView: View {
    public init() {}
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Blue",
                           colors: [BlocketColors.blue50,
                                    BlocketColors.blue100,
                                    BlocketColors.blue200,
                                    BlocketColors.blue300,
                                    BlocketColors.blue400,
                                    BlocketColors.blue500,
                                    BlocketColors.blue600,
                                    BlocketColors.blue700,
                                    BlocketColors.blue750,
                                    BlocketColors.blue800,
                                    BlocketColors.blue850,
                                    BlocketColors.blue900,
                                    BlocketColors.blue950])
                
                createView(for: "Red",
                           colors: [BlocketColors.red50,
                                    BlocketColors.red100,
                                    BlocketColors.red200,
                                    BlocketColors.red300,
                                    BlocketColors.red400,
                                    BlocketColors.red500,
                                    BlocketColors.red600,
                                    BlocketColors.red700,
                                    BlocketColors.red800,
                                    BlocketColors.red900])
                
                createView(for: "Green",
                           colors: [BlocketColors.green50,
                                    BlocketColors.green100,
                                    BlocketColors.green200,
                                    BlocketColors.green300,
                                    BlocketColors.green400,
                                    BlocketColors.green500,
                                    BlocketColors.green600,
                                    BlocketColors.green700,
                                    BlocketColors.green800,
                                    BlocketColors.green900])
                
                createView(for: "Yellow",
                           colors: [BlocketColors.yellow50,
                                    BlocketColors.yellow100,
                                    BlocketColors.yellow200,
                                    BlocketColors.yellow300,
                                    BlocketColors.yellow400,
                                    BlocketColors.yellow500,
                                    BlocketColors.yellow600,
                                    BlocketColors.yellow700,
                                    BlocketColors.yellow800,
                                    BlocketColors.yellow900])
                
                createView(for: "Coral",
                           colors: [BlocketColors.coral50,
                                    BlocketColors.coral100,
                                    BlocketColors.coral200,
                                    BlocketColors.coral300,
                                    BlocketColors.coral400,
                                    BlocketColors.coral500,
                                    BlocketColors.coral600,
                                    BlocketColors.coral700,
                                    BlocketColors.coral800,
                                    BlocketColors.coral900])
                
                createView(for: "Gray",
                           colors: [BlocketColors.transparent,
                                    BlocketColors.white,
                                    BlocketColors.gray50,
                                    BlocketColors.gray100,
                                    BlocketColors.gray200,
                                    BlocketColors.gray300,
                                    BlocketColors.gray400,
                                    BlocketColors.gray500,
                                    BlocketColors.gray600,
                                    BlocketColors.gray700,
                                    BlocketColors.gray750,
                                    BlocketColors.gray800,
                                    BlocketColors.gray850,
                                    BlocketColors.gray900,
                                    BlocketColors.gray950,
                                    BlocketColors.black])
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
    BlocketColorsView()
}
