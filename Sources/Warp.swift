import Foundation

/// Namespace.
public enum Warp {
    public static var Token: TokenProvider = {
        switch Config.warpTheme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        case .dba:
            return DBATokenProvider()
        }
    }()

    public static var UIToken: UITokenProvider = {
        switch Config.warpTheme {
        case .finn:
            return FinnUITokenProvider()
        case .tori:
            return ToriUITokenProvider()
        case .dba:
            return DBAUITokenProvider()
        }
    }()
    
    public static var Color: ColorProvider = {
        ColorProvider(token: Warp.Token)
    }()
    
    public static var UIColor: UIColorProvider = {
        UIColorProvider(token: Warp.UIToken)
    }()
}
