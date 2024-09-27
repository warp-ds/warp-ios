import Foundation

/// Warp namespace containing the design system's themes, tokens, and color providers.
@preconcurrency @MainActor
public enum Warp {
    /// Enumeration representing different brands supported by Warp.
    public enum Brand {
        case finn, tori, dba, blocket
    }
    
    /// The current theme of the application. Setting this will also attempt to register the appropriate fonts.
    public static var Theme: Brand = .finn {
        didSet {
            do {
                // Attempt to register the fonts for the new theme
                try Warp.Typography.registerFonts()
            } catch {
                // Handle the error (e.g., log it) if font registration fails
            }
        }
    }
    
    /// Provides token values based on the current theme.
    ///
    /// This computed property returns an instance of a token provider specific to the current theme.
    public static var Token: TokenProvider = {
        switch Theme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        case .dba:
            return DBATokenProvider()
        case .blocket:
            return BlocketTokenProvider()
        }
    }()
    
    /// Provides UIToken values based on the current theme.
    ///
    /// This computed property returns an instance of a UIToken provider specific to the current theme.
    public static var UIToken: UITokenProvider = {
        switch Theme {
        case .finn:
            return FinnUITokenProvider()
        case .tori:
            return ToriUITokenProvider()
        case .dba:
            return DBAUITokenProvider()
        case .blocket:
            return BlocketUITokenProvider()
        }
    }()
    
    /// Provides color values based on the current theme tokens.
    ///
    /// This computed property returns an instance of a color provider initialized with the current theme tokens.
    public static var Color: ColorProvider = {
        ColorProvider(token: Warp.Token)
    }()
    
    /// Provides UIColor values based on the current theme UITokens.
    ///
    /// This computed property returns an instance of a UIColor provider initialized with the current theme UITokens.
    public static var UIColor: UIColorProvider = {
        UIColorProvider(token: Warp.UIToken)
    }()
}
