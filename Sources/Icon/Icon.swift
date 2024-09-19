import SwiftUI

extension Warp {
    /// Icon set used across Warp components, loaded from the asset catalog in the framework.
    ///
    /// Provides both SwiftUI `Image` and UIKit `UIImage` representations for each icon.
    public enum Icon: String, CaseIterable, View {
        case activeAds
        case ads
        case airCon
        case allWheelDrive
        case animalPaw
        case archway
        case arrowDown
        case arrowLeft
        case arrowRight
        case arrowUp
        case attachment
        case automatic
        case backWheelDrive
        case bag
        case bank
        case bankIdNo
        case batteryEmpty
        case batteryFull
        case batteryHalfFull
        case beach
        case bell
        case bellFilled
        case bin
        case block
        case boatLength
        case bolt
        case bookmark
        case browser
        case browserVerified
        case building
        case buildingPlot
        case bulb
        case burger
        case bus
        case cabinHut
        case calculator
        case calendar
        case camera
        case cancel
        case car
        case carKey
        case carService
        case charger
        case charter
        case chatRequest
        case chatSupport
        case check
        case checklist
        case checkShield
        case chevronDoubleLeft
        case chevronDoubleRight
        case chevronDown
        case chevronLeft
        case chevronRight
        case chevronUp
        case circlePlus
        case circlePlusFilled
        case circleUser
        case circleUserFilled
        case clock
        case close
        case cog
        case colorPalette
        case cottagePlot
        case creditCard
        case cursor
        case delivery
        case diner
        case discount
        case dislike
        case door
        case dots
        case doubleBed
        case download
        case drawer
        case drink
        case edit
        case energy
        case engine
        case engineBelt
        case error
        case exchange
        case expand
        case eyeOff
        case eyeOn
        case facebook
        case farm
        case feedback
        case fileAdd
        case filter
        case fireplace
        case fishing
        case fitness
        case frontWheelDrive
        case gasDiesel
        case gasFuel
        case gasHybrid
        case graphLine
        case graphPie
        case grid
        case grill
        case headset
        case heart
        case heartRate
        case hiking
        case history
        case house
        case houseBed
        case houseCabin
        case houseFilled
        case houseModern
        case housePerson
        case image
        case info
        case instagram
        case keys
        case krone
        case lamp
        case laundry
        case layers
        case leaf
        case lift
        case like
        case link
        case linkExternal
        case listSort
        case lockShield
        case logout
        case mail
        case mailbox
        case manual
        case map
        case measure
        case message
        case messages
        case messagesFilled
        case minus
        case mixer
        case money
        case mountain
        case newAd
        case norwegianMotor
        case noSmoking
        case officeDesk
        case organize
        case parking
        case phone
        case phoneScratched
        case phoneUsed
        case pictureStack
        case pinMarker
        case pinRound
        case planeTicket
        case play
        case playhouse
        case plots
        case plus
        case productBlink
        case productBump
        case productCarousel
        case productHighlightListing
        case productNabolagsprofil
        case productNoAds
        case productStarred
        case productTop
        case propeller
        case question
        case refresh
        case roomService
        case sailing
        case sauna
        case scrollUp
        case search
        case searchFavorites
        case seat
        case send
        case service
        case share
        case shipping
        case shoes
        case shoppingCart
        case shower
        case skyscraper
        case smileyGood
        case smileyHappy
        case smileyNeutral
        case smileySad
        case sorting
        case spa
        case speedometer
        case stairs
        case starCheck
        case starEmpty
        case starFull
        case starHalf
        case store
        case stove
        case success
        case suitcase
        case support
        case swimming
        case tag
        case taskList
        case textBold
        case textItalic
        case textStrikethrough
        case textUnderline
        case theater
        case threeSixty
        case townHouse
        case tV
        case twitter
        case up
        case upload
        case user
        case userGroup
        case users
        case userWoman
        case vacuum
        case verification
        case wallet
        case warning
        case warranty
        case wheelchair
        case wifi
        case woods
        case youtube
        
        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(assetName, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.template) // Ensure template rendering mode for vector images
                .resizable()
        }
        
        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage? {
            UIImage(named: assetName, in: .module, compatibleWith: nil) // Load the image from the asset catalog
        }
        
        /// Maps the icon case to the corresponding asset name in the asset catalog.
        ///
        /// - Returns: The name of the asset in the asset catalog as `String`.
        private var assetName: String {
            return rawValue.prefix(1).capitalized + rawValue.dropFirst() // CapitalizedCamelCase asset name
        }
    }
}
