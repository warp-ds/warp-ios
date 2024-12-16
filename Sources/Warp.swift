import Foundation

/// The `Warp` namespace containing the design system's themes, tokens, and color providers.
public enum Warp {
    
    // MARK: - Brand Enum

    /// Enumeration representing different brands supported by the Warp design system.
    public enum Brand: CustomStringConvertible, CaseIterable {
        /// Represents the `Finn` brand theme.
        case finn
        /// Represents the `Tori` brand theme.
        case tori
        /// Represents the `DBA` brand theme.
        case dba
        /// Represents the `Blocket` brand theme.
        case blocket

        public var description: String {
            switch self {
            case .finn:
                return "FINN"
            case .tori:
                return "Tori"
            case .dba:
                return "DBA"
            case .blocket:
                return "Blocket"
            }
        }
    }
    
    // MARK: - Theme Property

    /// The current theme of the application. Setting this will also attempt to register the appropriate fonts for the theme.
    ///
    /// - Note: This property uses a `didSet` observer to attempt font registration via `Warp.Typography.registerFonts()`
    /// Whenever the theme changes. Any errors during font registration are silently caught and should be handled
    /// (e.g., logged) as appropriate in the error handling block.
    public static var Theme: Brand = .finn {
        didSet {
            do {
                // Attempt to register the fonts for the new theme
                try Warp.Typography.registerFonts()
                LanguageManager.shared.setLanguage()
            } catch {
                // Handle the error (e.g., log it) if font registration fails
            }
        }
    }
    
    // MARK: - Token Providers

    /// Provides token values based on the current theme.
    ///
    /// This computed property returns an instance of a token provider specific to the currently set theme.
    /// The token provider defines color tokens used throughout the application.
    public static var Token: TokenProvider = {
        switch Theme {
        case .finn:
            return FinnTokenProvider()
        case .tori:
            return ToriTokenProvider()
        case .dba:
            return DbaTokenProvider()
        case .blocket:
            return BlocketTokenProvider()
        }
    }()
    
    /// Provides UIToken values based on the current theme.
    ///
    /// This computed property returns an instance of a UIToken provider specific to the currently set theme.
    /// The token provider defines UIColor tokens used throughout the application.
    public static var UIToken: UITokenProvider = {
        switch Theme {
        case .finn:
            return FinnUITokenProvider()
        case .tori:
            return ToriUITokenProvider()
        case .dba:
            return DbaUITokenProvider()
        case .blocket:
            return BlocketUITokenProvider()
        }
    }()
    
    // MARK: - Color Providers

    /// Provides color values based on the current theme tokens.
    ///
    /// This computed property returns an instance of a `ColorProvider` initialized with the current theme tokens.
    /// It facilitates easy access to brand-specific colors that are used throughout the design system.
    public static var Color: ColorProvider = {
        ColorProvider(token: Warp.Token)
    }()
    
    /// Provides `UIColor` values based on the current theme UITokens.
    ///
    /// This computed property returns an instance of a `UIColorProvider` initialized with the current theme UITokens.
    /// It facilitates easy access to brand-specific UIColors that are used throughout the design system.
    public static var UIColor: UIColorProvider = {
        UIColorProvider(token: Warp.UIToken)
    }()

    // MARK: - Dataviz Token Providers

    /// Provides color values for Dataviz tokens.
    ///
    /// This computed property returns an instance of a `DatavizTokenProvider`.
    /// It facilitates easy access to dataviz colors that are used throughout the design system.
    public static var DatavizToken = {
        DatavizTokenProvider()
    }()

    /// Provides `UIColor` values for Dataviz tokens.
    ///
    /// This computed property returns an instance of a `DatavizUITokenProvider`.
    /// It facilitates easy access to dataviz colors that are used throughout the design system.
    public static var DatavizUIToken = {
        DatavizUITokenProvider()
    }()
}
