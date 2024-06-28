extension Warp {
    public struct Config {
        @available(*, deprecated, message: "Use Warp.Token")
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

        @available(*, deprecated, message: "Use Warp.UIToken")
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
            ColorProvider(token: Warp.Token)
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
