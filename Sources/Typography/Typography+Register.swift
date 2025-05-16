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
            try registerFont($0)
        }
    }

    /// Registers a custom font.
    ///
    /// This method attempts to register the given font from the provided filename (assumed to have `.otf` extension).
    /// If the font file cannot be found, loaded, or registered, an appropriate error is thrown.
    ///
    /// - Parameter font: A `Warp.Font` representation of the font to register.
    /// - Throws: A `Warp.FontRegistrationError` if any stage of the registration fails.
    private static func registerFont(_ font: Warp.Font) throws {
        let bundle = Bundle.module
        let fontExtension = "otf"

        // Attempt to locate the font file in the bundle
        guard let fontURL = bundle.url(forResource: font.fileName, withExtension: fontExtension) else {
            throw Warp.FontRegistrationError.unableToFindFont(fileName: font.fileName, fontName: font.name)
        }

        let isFontAlreadyRegistered = UIFont.familyNames.contains(where: { family in
            UIFont.fontNames(forFamilyName: family).contains(font.name)
        })

        // Register the font only if it has not been registered from before
        guard isFontAlreadyRegistered == true else {
            // Attempt to register the font with Core Text
            var error: Unmanaged<CFError>?
            let isSuccessful = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &error)

            // If registration fails, throw an error
            if !isSuccessful {
                throw Warp.FontRegistrationError.unableToRegisterFont(error: error?.takeUnretainedValue())
            }

            return
        }
    }
}

extension Warp {
    /// Errors that can occur during the custom font registration process.
    public enum FontRegistrationError: LocalizedError {
        /// Indicates that the font file could not be found.
        case unableToFindFont(fileName: String, fontName: String)

        /// Indicates that the font data provider could not be created from the font file URL.
        case unableToGetDataProvider(url: URL)

        /// Indicates that the CGFont object could not be created from the data provider.
        case unableToGetFont

        /// Indicates that the font could not be registered with Core Text.
        case unableToRegisterFont(error: CFError?)

        /// A detailed description of the error for debugging purposes.
        public var errorDescription: String? {
            switch self {
            case let .unableToFindFont(fileName, fontName):
                return "Unable to locate font with name '\(fontName)' in file named '\(fileName).otf'."

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
