public struct Config {
    static var colorProvider: ColorProvider = {
        switch warpTheme {
        case .finn:
            return FinnColorProvider()
        case .tori:
            return ToriColorProvider()
        }
    }()
    public static var warpTheme: WarpTheme = .finn
}

public enum WarpTheme {
    case finn, tori
}
