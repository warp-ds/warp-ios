import SwiftUI

public struct VendColorsView: View {
    public init() {}

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Vend",
                        colors: [VendColors.white,
                                 VendColors.black,
                                 VendColors.transparent])

                createView(for: "Gray",
                        colors: [VendColors.gray50,
                                 VendColors.gray100,
                                 VendColors.gray200,
                                 VendColors.gray300,
                                 VendColors.gray400,
                                 VendColors.gray500,
                                 VendColors.gray600,
                                 VendColors.gray700,
                                 VendColors.gray750,
                                 VendColors.gray800,
                                 VendColors.gray850,
                                 VendColors.gray900,
                                 VendColors.gray950])

                createView(for: "Brown",
                        colors: [VendColors.brown100,
                                 VendColors.brown200,
                                 VendColors.brown300,
                                 VendColors.brown400,
                                 VendColors.brown500,
                                 VendColors.brown600,
                                 VendColors.brown700,
                                 VendColors.brown750,
                                 VendColors.brown800,
                                 VendColors.brown850,
                                 VendColors.brown900,
                                 VendColors.brown950])

                createView(for: "Blue",
                        colors: [VendColors.blue50,
                                 VendColors.blue100,
                                 VendColors.blue200,
                                 VendColors.blue300,
                                 VendColors.blue400,
                                 VendColors.blue500,
                                 VendColors.blue600,
                                 VendColors.blue700,
                                 VendColors.blue800,
                                 VendColors.blue900])

                createView(for: "Green",
                        colors: [VendColors.green50,
                                 VendColors.green100,
                                 VendColors.green200,
                                 VendColors.green300,
                                 VendColors.green400,
                                 VendColors.green500,
                                 VendColors.green600,
                                 VendColors.green700,
                                 VendColors.green800,
                                 VendColors.green900])

                createView(for: "Red",
                        colors: [VendColors.red50,
                                 VendColors.red100,
                                 VendColors.red200,
                                 VendColors.red300,
                                 VendColors.red400,
                                 VendColors.red500,
                                 VendColors.red600,
                                 VendColors.red700,
                                 VendColors.red800,
                                 VendColors.red900])

                createView(for: "Orange",
                        colors: [VendColors.orange50,
                                 VendColors.orange100,
                                 VendColors.orange200,
                                 VendColors.orange300,
                                 VendColors.orange400,
                                 VendColors.orange500,
                                 VendColors.orange600,
                                 VendColors.orange700,
                                 VendColors.orange800,
                                 VendColors.orange900])

                createView(for: "Forest",
                        colors: [VendColors.forest50,
                                 VendColors.forest100,
                                 VendColors.forest200,
                                 VendColors.forest300,
                                 VendColors.forest400,
                                 VendColors.forest500,
                                 VendColors.forest600,
                                 VendColors.forest700,
                                 VendColors.forest800,
                                 VendColors.forest900])

                createView(for: "Pink",
                        colors: [VendColors.pink50,
                                 VendColors.pink100,
                                 VendColors.pink200,
                                 VendColors.pink300,
                                 VendColors.pink400,
                                 VendColors.pink500,
                                 VendColors.pink600,
                                 VendColors.pink700,
                                 VendColors.pink800,
                                 VendColors.pink900])

                createView(for: "Purple",
                        colors: [VendColors.purple50,
                                 VendColors.purple100,
                                 VendColors.purple200,
                                 VendColors.purple300,
                                 VendColors.purple400,
                                 VendColors.purple500,
                                 VendColors.purple600,
                                 VendColors.purple700,
                                 VendColors.purple800,
                                 VendColors.purple900])
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
    VendColorsView()
}
