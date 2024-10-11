import SwiftUI

public struct DbaColorsView: View {
    public init() {}
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Jeanblue",
                           colors: [DbaColors.jeanblue50,
                                    DbaColors.jeanblue100,
                                    DbaColors.jeanblue200,
                                    DbaColors.jeanblue300,
                                    DbaColors.jeanblue400,
                                    DbaColors.jeanblue500,
                                    DbaColors.jeanblue600,
                                    DbaColors.jeanblue700,
                                    DbaColors.jeanblue800,
                                    DbaColors.jeanblue900])
                
                createView(for: "Phthaloblue",
                           colors: [DbaColors.phthaloblue50,
                                    DbaColors.phthaloblue100,
                                    DbaColors.phthaloblue200,
                                    DbaColors.phthaloblue300,
                                    DbaColors.phthaloblue400,
                                    DbaColors.phthaloblue500,
                                    DbaColors.phthaloblue600,
                                    DbaColors.phthaloblue700,
                                    DbaColors.phthaloblue800,
                                    DbaColors.phthaloblue900])
                
                createView(for: "Green",
                           colors: [DbaColors.green50,
                                    DbaColors.green100,
                                    DbaColors.green200,
                                    DbaColors.green300,
                                    DbaColors.green400,
                                    DbaColors.green500,
                                    DbaColors.green600,
                                    DbaColors.green700,
                                    DbaColors.green800,
                                    DbaColors.green900])
                
                createView(for: "Yellow",
                           colors: [DbaColors.yellow50,
                                    DbaColors.yellow100,
                                    DbaColors.yellow200,
                                    DbaColors.yellow300,
                                    DbaColors.yellow400,
                                    DbaColors.yellow500,
                                    DbaColors.yellow600,
                                    DbaColors.yellow700,
                                    DbaColors.yellow800,
                                    DbaColors.yellow900])
                
                createView(for: "Red",
                           colors: [DbaColors.red50,
                                    DbaColors.red100,
                                    DbaColors.red200,
                                    DbaColors.red300,
                                    DbaColors.red400,
                                    DbaColors.red500,
                                    DbaColors.red600,
                                    DbaColors.red700,
                                    DbaColors.red800,
                                    DbaColors.red900])
                
                createView(for: "Gray",
                           colors: [DbaColors.transparent,
                                    DbaColors.white,
                                    DbaColors.gray50,
                                    DbaColors.gray100,
                                    DbaColors.gray200,
                                    DbaColors.gray300,
                                    DbaColors.gray400,
                                    DbaColors.gray500,
                                    DbaColors.gray600,
                                    DbaColors.gray700,
                                    DbaColors.gray750,
                                    DbaColors.gray800,
                                    DbaColors.gray850,
                                    DbaColors.gray900,
                                    DbaColors.gray950,
                                    DbaColors.black])
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
    DbaColorsView()
}
