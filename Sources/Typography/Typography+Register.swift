import Foundation
import UIKit

extension Warp.Typography {
    public static func registerFonts() throws {
        try Warp.Font.allCases.forEach {
            try registerFont(fontName: $0.fileName)
        }
    }

    fileprivate static func registerFont(fontName: String) throws {
        let bundle = Bundle.module
        
        // static font extension
        let fontExtension = "otf"

        // get font url from font name and font extension
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            throw Warp.FontRegistrationError.unableToFindFont(name: fontName)
        }

        // Get core graphic data from url
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            throw Warp.FontRegistrationError.unableToGetDataProvider(url: fontURL)
        }

        guard let font = CGFont(fontDataProvider) else {
            throw Warp.FontRegistrationError.unableToGetFont
        }

        var error: Unmanaged<CFError>?
        let isSuccessful = CTFontManagerRegisterGraphicsFont(font, &error)

        if !isSuccessful {
            throw Warp.FontRegistrationError.unableToRegisterFont(error: error?.takeUnretainedValue())
        }

        // no need to release the error pointer since we took unretained value.
    }
}

extension Warp {
    public enum FontRegistrationError: LocalizedError {
        case unableToFindFont(name: String)

        case unableToGetDataProvider(url: URL)

        case unableToGetFont

        case unableToRegisterFont(error: CFError?)

        var debugDescription: String? {
            switch self {
                case let .unableToFindFont(name):
                    return "Failure to get font with given name: \(name)."

                case let .unableToGetDataProvider(url):
                    return "Failure to get font provider from url: \(url.absoluteString)."

                case .unableToGetFont:
                    return "Failure to get font from provider."

                case let .unableToRegisterFont(error):
                    var _error = "Cannot register font"

                    if let error = error {
                        _error += " with error:\n" + error.localizedDescription
                    }

                    return _error
            }
        }
    }
}
