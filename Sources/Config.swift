extension Warp {
    public struct Config {
        public static var tokenProvider: TokenProvider = {
            switch warpTheme {
                case .finn:
                    return FinnTokenProvider()
                case .tori:
                    return ToriTokenProvider()
            }
        }()
        public static var uiTokenProvider: UITokenProvider = {
            switch warpTheme {
                case .finn:
                    return FinnUITokenProvider()
                case .tori:
                    return ToriUITokenProvider()
            }
        }()
        
        public static var colorProvider: ColorProvider = {
            ColorProvider(token: tokenProvider)
        }()
        
        public static var uiColorProvider: UIColorProvider = {
            UIColorProvider(token: uiTokenProvider)
        }()

        public static var warpTheme: Theme = .finn
    }

    public enum Theme {
        case finn, tori
    }
}
