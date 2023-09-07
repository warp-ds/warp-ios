public struct Config {
    static var tokenProvider: TokenProvider {
//        JBMono.registerFonts()

        switch warpTheme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        }
    }
    static var colorProvider: ColorProvider {
        ColorProvider(token: tokenProvider)
    }
    public static var warpTheme: WarpTheme = .finn
}

public enum WarpTheme: String, CaseIterable {
    case finn, tori
}
