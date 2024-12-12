import SwiftUI

public struct DatavizColorsView: View {
    public init() {}

    public var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                createView(for: "Blue",
                           colors: [DatavizColors.blue50,
                                    DatavizColors.blue100,
                                    DatavizColors.blue200,
                                    DatavizColors.blue300,
                                    DatavizColors.blue400,
                                    DatavizColors.blue500,
                                    DatavizColors.blue600,
                                    DatavizColors.blue650,
                                    DatavizColors.blue700,
                                    DatavizColors.blue800,
                                    DatavizColors.blue900])

                createView(for: "Indigo",
                           colors: [DatavizColors.indigo50,
                                    DatavizColors.indigo100,
                                    DatavizColors.indigo200,
                                    DatavizColors.indigo300,
                                    DatavizColors.indigo400,
                                    DatavizColors.indigo500,
                                    DatavizColors.indigo600,
                                    DatavizColors.indigo650,
                                    DatavizColors.indigo700,
                                    DatavizColors.indigo800,
                                    DatavizColors.indigo900])

                createView(for: "Red",
                           colors: [DatavizColors.red50,
                                    DatavizColors.red100,
                                    DatavizColors.red200,
                                    DatavizColors.red300,
                                    DatavizColors.red400,
                                    DatavizColors.red500,
                                    DatavizColors.red600,
                                    DatavizColors.red650,
                                    DatavizColors.red700,
                                    DatavizColors.red800,
                                    DatavizColors.red900])

                createView(for: "Orange",
                           colors: [DatavizColors.orange50,
                                    DatavizColors.orange100,
                                    DatavizColors.orange200,
                                    DatavizColors.orange300,
                                    DatavizColors.orange400,
                                    DatavizColors.orange500,
                                    DatavizColors.orange600,
                                    DatavizColors.orange650,
                                    DatavizColors.orange700,
                                    DatavizColors.orange800,
                                    DatavizColors.orange900])

                createView(for: "Yellow",
                           colors: [DatavizColors.yellow50,
                                    DatavizColors.yellow100,
                                    DatavizColors.yellow200,
                                    DatavizColors.yellow300,
                                    DatavizColors.yellow400,
                                    DatavizColors.yellow500,
                                    DatavizColors.yellow600,
                                    DatavizColors.yellow650,
                                    DatavizColors.yellow700,
                                    DatavizColors.yellow800,
                                    DatavizColors.yellow900])

                createView(for: "Green",
                           colors: [DatavizColors.green50,
                                    DatavizColors.green100,
                                    DatavizColors.green200,
                                    DatavizColors.green300,
                                    DatavizColors.green400,
                                    DatavizColors.green500,
                                    DatavizColors.green600,
                                    DatavizColors.green650,
                                    DatavizColors.green700,
                                    DatavizColors.green800,
                                    DatavizColors.green900])

                createView(for: "Teal",
                           colors: [DatavizColors.teal50,
                                    DatavizColors.teal100,
                                    DatavizColors.teal200,
                                    DatavizColors.teal300,
                                    DatavizColors.teal400,
                                    DatavizColors.teal500,
                                    DatavizColors.teal600,
                                    DatavizColors.teal650,
                                    DatavizColors.teal700,
                                    DatavizColors.teal800,
                                    DatavizColors.teal900])

                createView(for: "Pink",
                           colors: [DatavizColors.pink50,
                                    DatavizColors.pink100,
                                    DatavizColors.pink200,
                                    DatavizColors.pink300,
                                    DatavizColors.pink400,
                                    DatavizColors.pink500,
                                    DatavizColors.pink600,
                                    DatavizColors.pink650,
                                    DatavizColors.pink700,
                                    DatavizColors.pink800,
                                    DatavizColors.pink900])

                createView(for: "Gray",
                           colors: [DatavizColors.gray50,
                                    DatavizColors.gray100,
                                    DatavizColors.gray200,
                                    DatavizColors.gray300,
                                    DatavizColors.gray400,
                                    DatavizColors.gray500,
                                    DatavizColors.gray600,
                                    DatavizColors.gray650,
                                    DatavizColors.gray700,
                                    DatavizColors.gray800,
                                    DatavizColors.gray900])
            }
            .padding(.horizontal)
            .navigationTitle("DatavizColors")
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
