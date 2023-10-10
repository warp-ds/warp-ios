extension Warp {
    public struct Config {
        static var tokenProvider: TokenProvider = {
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

        public static var warpTheme: Theme = .finn
    }

    public enum Theme {
        case finn, tori
    }
}
