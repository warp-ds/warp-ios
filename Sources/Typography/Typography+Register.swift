import Foundation
import UIKit

extension Warp.Typography {
    /// Registers custom fonts associated with the current theme.
    ///
    /// This method attempts to register each custom font defined in `Warp.Font.fontForTheme`.
    /// If any font registration fails, the error is thrown, and font registration stops.
    ///
    /// - Throws: A `Warp.FontRegistrationError` if the registration of any font fails.
    public static func registerFonts() throws {
        try Warp.Font.fontForTheme.forEach {
            try registerFont(fontName: $0.fileName)
        }
    }
    
    /// Registers a custom font by name.
    ///
    /// This method attempts to register the font file with the given name (assumed to have `.otf` extension).
    /// If the font file cannot be found, loaded, or registered, an appropriate error is thrown.
    ///
    /// - Parameter fontName: The name of the font file (without extension) to register.
    /// - Throws: A `Warp.FontRegistrationError` if any stage of the registration fails.
    private static func registerFont(fontName: String) throws {
        let bundle = Bundle.module
        let fontExtension = "otf"
        
        // Attempt to locate the font file in the bundle
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            throw Warp.FontRegistrationError.unableToFindFont(name: fontName)
        }
        
        // Attempt to load font data from the URL
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            throw Warp.FontRegistrationError.unableToGetDataProvider(url: fontURL)
        }
        
        // Attempt to create a CGFont object from the data provider
        guard let font = CGFont(fontDataProvider) else {
            throw Warp.FontRegistrationError.unableToGetFont
        }
        
        // Attempt to register the font with Core Text
        var error: Unmanaged<CFError>?
        let isSuccessful = CTFontManagerRegisterGraphicsFont(font, &error)
        
        // If registration fails, throw an error
        if !isSuccessful {
            throw Warp.FontRegistrationError.unableToRegisterFont(error: error?.takeUnretainedValue())
        }
    }
}

extension Warp {
    /// Errors that can occur during the custom font registration process.
    public enum FontRegistrationError: LocalizedError {
        /// Indicates that the font file could not be found.
        case unableToFindFont(name: String)
        
        /// Indicates that the font data provider could not be created from the font file URL.
        case unableToGetDataProvider(url: URL)
        
        /// Indicates that the CGFont object could not be created from the data provider.
        case unableToGetFont
        
        /// Indicates that the font could not be registered with Core Text.
        case unableToRegisterFont(error: CFError?)
        
        /// A detailed description of the error for debugging purposes.
        public var errorDescription: String? {
            switch self {
            case let .unableToFindFont(name):
                return "Unable to locate font with name: \(name)."
                
            case let .unableToGetDataProvider(url):
                return "Unable to retrieve data provider for font at URL: \(url.absoluteString)."
                
            case .unableToGetFont:
                return "Unable to create font from data provider."
                
            case let .unableToRegisterFont(error):
                var errorMessage = "Font registration failed."
                if let error = error {
                    errorMessage += " Error details: \(error.localizedDescription)"
                }
                return errorMessage
            }
        }
    }
}
