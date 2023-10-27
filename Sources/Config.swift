public struct Config {
    public static var tokenProvider: TokenProvider = {
        switch warpTheme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        }
    }()
    public static var colorProvider: ColorProvider = {
        ColorProvider(token: tokenProvider)
    }()
    public static var warpTheme: WarpTheme = .finn
}

public enum WarpTheme {
    case finn, tori
}
