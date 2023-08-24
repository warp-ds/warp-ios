import SwiftUI

struct FinnColorProvider: ColorProvider {
    public var primaryButtonForegroundColor: Color { FinnColors.white }
    public var primaryButtonBackgroundColor: Color { FinnColors.blue600 }
    public var primaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var secondaryButtonForegroundColor: Color { FinnColors.blue600 }
    public var secondaryButtonBackgroundColor: Color { FinnColors.white }
    public var secondaryButtonBorderColor: Color { FinnColors.blueGray300 }
    public var secondaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var secondaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    public var secondaryButtonDisabledBorderColor: Color { FinnColors.blueGray300 }
    
    public var tertiaryButtonForegroundColor: Color { FinnColors.blue600 }
    public var tertiaryButtonBackgroundColor: Color { FinnColors.white }
    public var tertiaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var tertiaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var criticalButtonForegroundColor: Color { FinnColors.white }
    public var criticalButtonBackgroundColor: Color { FinnColors.red600 }
    public var criticalButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var criticalTertiaryButtonForegroundColor: Color { FinnColors.red600 }
    public var criticalTertiaryButtonBackgroundColor: Color { FinnColors.white }
    public var criticalTertiaryButtonDisabledForegroundColor: Color { FinnColors.white }
    public var criticalTertiaryButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    
    public var utilityButtonForegroundColor: Color { FinnColors.gray700 }
    public var utilityButtonBackgroundColor: Color { FinnColors.white }
    public var utilityButtonBorderColor: Color { FinnColors.blueGray300 }
    public var utilityButtonDisabledForegroundColor: Color { FinnColors.white }
    public var utilityButtonDisabledBackgroundColor: Color { FinnColors.blueGray300 }
    public var utilityButtonDisabledBorderColor: Color { FinnColors.blueGray300 }
    
    public var inputOptionalHeaderForegroundColor: Color { FinnColors.gray500 }
    public var inputOptionalHelpTextForegroundColor: Color { FinnColors.gray700 }
    public var inputOptionalHelpTextErrorForegroundColor: Color { FinnColors.red600 }
    public var inputBorderColor: Color { FinnColors.gray300 }
    public var inputActiveBorderColor: Color { FinnColors.blue600 }
    public var inputErrorBorderColor: Color { FinnColors.red600 }
    public var inputReadOnlyBorderColor: Color { FinnColors.white }
    public var inputDisabledBackgroundColor: Color { FinnColors.gray200 }
}
