import SwiftUI

public struct OikotieColorsView: View {
    public init() {}
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Blue",
                           colors: [OikotieColors.blue50,
                                    OikotieColors.blue100,
                                    OikotieColors.blue200,
                                    OikotieColors.blue300,
                                    OikotieColors.blue400,
                                    OikotieColors.blue500,
                                    OikotieColors.blue600,
                                    OikotieColors.blue700,
                                    OikotieColors.blue750,
                                    OikotieColors.blue800,
                                    OikotieColors.blue850,
                                    OikotieColors.blue900,
                                    OikotieColors.blue950])
                
                createView(for: "Green",
                           colors: [OikotieColors.green50,
                                    OikotieColors.green100,
                                    OikotieColors.green200,
                                    OikotieColors.green300,
                                    OikotieColors.green400,
                                    OikotieColors.green500,
                                    OikotieColors.green600,
                                    OikotieColors.green650,
                                    OikotieColors.green700,
                                    OikotieColors.green750,
                                    OikotieColors.green800,
                                    OikotieColors.green850,
                                    OikotieColors.green900,
                                    OikotieColors.green950])
                
                createView(for: "Orange",
                           colors: [OikotieColors.orange50,
                                    OikotieColors.orange100,
                                    OikotieColors.orange200,
                                    OikotieColors.orange300,
                                    OikotieColors.orange400,
                                    OikotieColors.orange500,
                                    OikotieColors.orange600,
                                    OikotieColors.orange700,
                                    OikotieColors.orange800,
                                    OikotieColors.orange900])
                
                createView(for: "Red",
                           colors: [OikotieColors.red50,
                                    OikotieColors.red100,
                                    OikotieColors.red200,
                                    OikotieColors.red300,
                                    OikotieColors.red400,
                                    OikotieColors.red500,
                                    OikotieColors.red600,
                                    OikotieColors.red700,
                                    OikotieColors.red800,
                                    OikotieColors.red900])
                
                createView(for: "Gray",
                           colors: [OikotieColors.transparent,
                                    OikotieColors.white,
                                    OikotieColors.gray50,
                                    OikotieColors.gray100,
                                    OikotieColors.gray200,
                                    OikotieColors.gray300,
                                    OikotieColors.gray400,
                                    OikotieColors.gray500,
                                    OikotieColors.gray600,
                                    OikotieColors.gray700,
                                    OikotieColors.gray750,
                                    OikotieColors.gray800,
                                    OikotieColors.gray850,
                                    OikotieColors.gray900,
                                    OikotieColors.gray950,
                                    OikotieColors.black])
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
    OikotieColorsView()
}
