extension Warp {
    public struct Config {
        public static var tokenProvider: TokenProvider = {
            switch warpTheme {
            case .finn:
                return FinnTokenProvider()
            case .tori:
                return ToriTokenProvider()
            case .dba:
                return DBATokenProvider()
            }
        }()
        public static var uiTokenProvider: UITokenProvider = {
            switch warpTheme {
            case .finn:
                return FinnUITokenProvider()
            case .tori:
                return ToriUITokenProvider()
            case .dba:
                return DBAUITokenProvider()
            }
        }()
        
        public static var colorProvider: ColorProvider = {
            ColorProvider(token: tokenProvider)
        }()

        public static var warpTheme: Theme = .finn {
            didSet {
                do {
                    try Warp.Typography.registerFonts()
                } catch {
                    // Catch the error later
                }
            }
        }
    }

    public enum Theme {
        case finn, tori, dba
    }
}
