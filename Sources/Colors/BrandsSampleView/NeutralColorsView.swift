import SwiftUI

public struct NeutralColorsView: View {
  public init() {}

  public var body: some View {
    ScrollView(showsIndicators: false) {
      VStack (alignment: .leading) {
        createView(for: "Vend",
          colors: [NeutralColors.white,
                   NeutralColors.black,
                   NeutralColors.transparent])

        createView(for: "Gray",
          colors: [NeutralColors.gray50,
                   NeutralColors.gray100,
                   NeutralColors.gray200,
                   NeutralColors.gray300,
                   NeutralColors.gray400,
                   NeutralColors.gray500,
                   NeutralColors.gray600,
                   NeutralColors.gray700,
                   NeutralColors.gray750,
                   NeutralColors.gray800,
                   NeutralColors.gray850,
                   NeutralColors.gray900,
                   NeutralColors.gray950])

        createView(for: "Blue",
          colors: [NeutralColors.blue50,
                   NeutralColors.blue100,
                   NeutralColors.blue200,
                   NeutralColors.blue300,
                   NeutralColors.blue400,
                   NeutralColors.blue500,
                   NeutralColors.blue600,
                   NeutralColors.blue700,
                   NeutralColors.blue800,
                   NeutralColors.blue900])

        createView(for: "Green",
          colors: [NeutralColors.green50,
                   NeutralColors.green100,
                   NeutralColors.green200,
                   NeutralColors.green300,
                   NeutralColors.green400,
                   NeutralColors.green500,
                   NeutralColors.green600,
                   NeutralColors.green700,
                   NeutralColors.green800,
                   NeutralColors.green900])

        createView(for: "Red",
          colors: [NeutralColors.red50,
                   NeutralColors.red100,
                   NeutralColors.red200,
                   NeutralColors.red300,
                   NeutralColors.red400,
                   NeutralColors.red500,
                   NeutralColors.red600,
                   NeutralColors.red700,
                   NeutralColors.red800,
                   NeutralColors.red900])

        createView(for: "Orange",
          colors: [NeutralColors.orange50,
                   NeutralColors.orange100,
                   NeutralColors.orange200,
                   NeutralColors.orange300,
                   NeutralColors.orange400,
                   NeutralColors.orange500,
                   NeutralColors.orange600,
                   NeutralColors.orange700,
                   NeutralColors.orange800,
                   NeutralColors.orange900])
      }
        .padding(.horizontal)
        .navigationTitle("Colors")
        .navigationBarTitleDisplayMode(.inline)
    }
  }

  private func createView(for colorGroup: String, colors: [Color]) -> some View {
    GroupBox(
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
  NeutralColorsView()
}
