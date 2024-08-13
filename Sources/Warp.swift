import Foundation

/// Namespace.
public enum Warp {
    public enum Brand {
        case finn, tori, dba
    }
    
    public static var Theme: Brand = .finn {
        didSet {
            do {
                try Warp.Typography.registerFonts()
            } catch {
                // Catch the error later
            }
        }
    }

    public static var Token: TokenProvider = {
        switch Theme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        case .dba:
            return DBATokenProvider()
        }
    }()

    public static var UIToken: UITokenProvider = {
        switch Theme {
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
