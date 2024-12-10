import SwiftUI

extension Warp {
    /// Icon set used across Warp components, loaded from the asset catalog in the framework.
    ///
    /// This enum defines all available icons in the Warp design system. It provides both SwiftUI `Image` and UIKit `UIImage` representations,
    /// allowing for easy usage in different UI contexts.
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
        case awardMedal
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
        case dotsVertical
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
        case landscape
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
        case sparkles
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
        case trendDown
        case trendFlat
        case trendUp
        case tv
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
        case waterPitcher
        case wheelchair
        case wifi
        case woods
        case youtube

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        ///
        /// - Returns: A resizable `SwiftUI.Image` instance representing the icon, with a template rendering mode.
        public var body: some View {
            image
                .accessibilityLabel(localization)
        }

        /// Returns a SwiftUI `Image` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A resizable `SwiftUI.Image` instance representing the icon, with a template rendering mode.
        public var image: Image {
            SwiftUI.Image(assetName, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.template) // Ensure template rendering mode for vector images
                .resizable()
        }

        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage {
            // Load the image from the asset catalog
            guard let image = UIImage(named: assetName, in: .module, compatibleWith: nil) else {
                // Handle the error (e.g., log it) if image loading fails
                return UIImage()
            }
            image.accessibilityLabel = localization
            return image.withRenderingMode(.alwaysTemplate)
        }

        /// Maps the icon case to the corresponding asset name in the asset catalog.
        ///
        /// This converts the enum case name (in camelCase) to the format used by asset names in the asset catalog.
        /// - Returns: The name of the asset in the asset catalog as `String`.
        private var assetName: String {
            return rawValue.prefix(1).capitalized + rawValue.dropFirst() // CapitalizedCamelCase asset name
        }

        private var localization: String {
            switch self {
            case .activeAds: return Warp.Strings.iconActiveAds.localized
            case .ads: return Warp.Strings.iconAds.localized
            case .airCon: return Warp.Strings.iconAirCon.localized
            case .allWheelDrive: return Warp.Strings.iconAllWheelDrive.localized
            case .animalPaw: return Warp.Strings.iconAnimalPaw.localized
            case .archway: return Warp.Strings.iconArchway.localized
            case .arrowDown: return Warp.Strings.iconArrowDown.localized
            case .arrowLeft: return Warp.Strings.iconArrowLeft.localized
            case .arrowRight: return Warp.Strings.iconArrowRight.localized
            case .arrowUp: return Warp.Strings.iconArrowUp.localized
            case .attachment: return Warp.Strings.iconAttachment.localized
            case .automatic: return Warp.Strings.iconAutomatic.localized
            case .awardMedal: return Warp.Strings.iconAwardMedal.localized
            case .backWheelDrive: return Warp.Strings.iconBackWheelDrive.localized
            case .bag: return Warp.Strings.iconBag.localized
            case .bank: return Warp.Strings.iconBank.localized
            case .bankIdNo: return Warp.Strings.iconBankIdNo.localized
            case .batteryEmpty: return Warp.Strings.iconBatteryEmpty.localized
            case .batteryFull: return Warp.Strings.iconBatteryFull.localized
            case .batteryHalfFull: return Warp.Strings.iconBatteryHalfFull.localized
            case .beach: return Warp.Strings.iconBeach.localized
            case .bell: return Warp.Strings.iconBell.localized
            case .bellFilled: return Warp.Strings.iconBellFilled.localized
            case .bin: return Warp.Strings.iconBin.localized
            case .block: return Warp.Strings.iconBlock.localized
            case .boatLength: return Warp.Strings.iconBoatLength.localized
            case .bolt: return Warp.Strings.iconBolt.localized
            case .bookmark: return Warp.Strings.iconBookmark.localized
            case .browser: return Warp.Strings.iconBrowser.localized
            case .browserVerified: return Warp.Strings.iconBrowserVerified.localized
            case .building: return Warp.Strings.iconBuilding.localized
            case .buildingPlot: return Warp.Strings.iconBuildingPlot.localized
            case .bulb: return Warp.Strings.iconBulb.localized
            case .burger: return Warp.Strings.iconBurger.localized
            case .bus: return Warp.Strings.iconBus.localized
            case .cabinHut: return Warp.Strings.iconCabinHut.localized
            case .calculator: return Warp.Strings.iconCalculator.localized
            case .calendar: return Warp.Strings.iconCalendar.localized
            case .camera: return Warp.Strings.iconCamera.localized
            case .cancel: return Warp.Strings.iconCancel.localized
            case .car: return Warp.Strings.iconCar.localized
            case .carKey: return Warp.Strings.iconCarKey.localized
            case .carService: return Warp.Strings.iconCarService.localized
            case .charger: return Warp.Strings.iconCharger.localized
            case .charter: return Warp.Strings.iconCharter.localized
            case .chatRequest: return Warp.Strings.iconChatRequest.localized
            case .chatSupport: return Warp.Strings.iconChatSupport.localized
            case .check: return Warp.Strings.iconCheck.localized
            case .checklist: return Warp.Strings.iconChecklist.localized
            case .checkShield: return Warp.Strings.iconCheckShield.localized
            case .chevronDoubleLeft: return Warp.Strings.iconChevronDoubleLeft.localized
            case .chevronDoubleRight: return Warp.Strings.iconChevronDoubleRight.localized
            case .chevronDown: return Warp.Strings.iconChevronDown.localized
            case .chevronLeft: return Warp.Strings.iconChevronLeft.localized
            case .chevronRight: return Warp.Strings.iconChevronRight.localized
            case .chevronUp: return Warp.Strings.iconChevronUp.localized
            case .circlePlus: return Warp.Strings.iconCirclePlus.localized
            case .circlePlusFilled: return Warp.Strings.iconCirclePlusFilled.localized
            case .circleUser: return Warp.Strings.iconCircleUser.localized
            case .circleUserFilled: return Warp.Strings.iconCircleUserFilled.localized
            case .clock: return Warp.Strings.iconClock.localized
            case .close: return Warp.Strings.iconClose.localized
            case .cog: return Warp.Strings.iconCog.localized
            case .colorPalette: return Warp.Strings.iconColorPalette.localized
            case .cottagePlot: return Warp.Strings.iconCottagePlot.localized
            case .creditCard: return Warp.Strings.iconCreditCard.localized
            case .cursor: return Warp.Strings.iconCursor.localized
            case .delivery: return Warp.Strings.iconDelivery.localized
            case .diner: return Warp.Strings.iconDiner.localized
            case .discount: return Warp.Strings.iconDiscount.localized
            case .dislike: return Warp.Strings.iconDislike.localized
            case .door: return Warp.Strings.iconDoor.localized
            case .dots: return Warp.Strings.iconDots.localized
            case .dotsVertical: return Warp.Strings.iconDotsVertical.localized
            case .doubleBed: return Warp.Strings.iconDoubleBed.localized
            case .download: return Warp.Strings.iconDownload.localized
            case .drawer: return Warp.Strings.iconDrawer.localized
            case .drink: return Warp.Strings.iconDrink.localized
            case .edit: return Warp.Strings.iconEdit.localized
            case .energy: return Warp.Strings.iconEnergy.localized
            case .engine: return Warp.Strings.iconEngine.localized
            case .engineBelt: return Warp.Strings.iconEngineBelt.localized
            case .error: return Warp.Strings.iconError.localized
            case .exchange: return Warp.Strings.iconExchange.localized
            case .expand: return Warp.Strings.iconExpand.localized
            case .eyeOff: return Warp.Strings.iconEyeOff.localized
            case .eyeOn: return Warp.Strings.iconEyeOn.localized
            case .facebook: return Warp.Strings.iconFacebook.localized
            case .farm: return Warp.Strings.iconFarm.localized
            case .feedback: return Warp.Strings.iconFeedback.localized
            case .fileAdd: return Warp.Strings.iconFileAdd.localized
            case .filter: return Warp.Strings.iconFilter.localized
            case .fireplace: return Warp.Strings.iconFireplace.localized
            case .fishing: return Warp.Strings.iconFishing.localized
            case .fitness: return Warp.Strings.iconFitness.localized
            case .frontWheelDrive: return Warp.Strings.iconFrontWheelDrive.localized
            case .gasDiesel: return Warp.Strings.iconGasDiesel.localized
            case .gasFuel: return Warp.Strings.iconGasFuel.localized
            case .gasHybrid: return Warp.Strings.iconGasHybrid.localized
            case .graphLine: return Warp.Strings.iconGraphLine.localized
            case .graphPie: return Warp.Strings.iconGraphPie.localized
            case .grid: return Warp.Strings.iconGrid.localized
            case .grill: return Warp.Strings.iconGrill.localized
            case .headset: return Warp.Strings.iconHeadset.localized
            case .heart: return Warp.Strings.iconHeart.localized
            case .heartRate: return Warp.Strings.iconHeartRate.localized
            case .hiking: return Warp.Strings.iconHiking.localized
            case .history: return Warp.Strings.iconHistory.localized
            case .house: return Warp.Strings.iconHouse.localized
            case .houseBed: return Warp.Strings.iconHouseBed.localized
            case .houseCabin: return Warp.Strings.iconHouseCabin.localized
            case .houseFilled: return Warp.Strings.iconHouseFilled.localized
            case .houseModern: return Warp.Strings.iconHouseModern.localized
            case .housePerson: return Warp.Strings.iconHousePerson.localized
            case .image: return Warp.Strings.iconImage.localized
            case .info: return Warp.Strings.iconInfo.localized
            case .instagram: return Warp.Strings.iconInstagram.localized
            case .keys: return Warp.Strings.iconKeys.localized
            case .krone: return Warp.Strings.iconKrone.localized
            case .lamp: return Warp.Strings.iconLamp.localized
            case .landscape: return Warp.Strings.iconLandscape.localized
            case .laundry: return Warp.Strings.iconLaundry.localized
            case .layers: return Warp.Strings.iconLayers.localized
            case .leaf: return Warp.Strings.iconLeaf.localized
            case .lift: return Warp.Strings.iconLift.localized
            case .like: return Warp.Strings.iconLike.localized
            case .link: return Warp.Strings.iconLink.localized
            case .linkExternal: return Warp.Strings.iconLinkExternal.localized
            case .listSort: return Warp.Strings.iconListSort.localized
            case .lockShield: return Warp.Strings.iconLockShield.localized
            case .logout: return Warp.Strings.iconLogout.localized
            case .mail: return Warp.Strings.iconMail.localized
            case .mailbox: return Warp.Strings.iconMailbox.localized
            case .manual: return Warp.Strings.iconManual.localized
            case .map: return Warp.Strings.iconMap.localized
            case .measure: return Warp.Strings.iconMeasure.localized
            case .message: return Warp.Strings.iconMessage.localized
            case .messages: return Warp.Strings.iconMessages.localized
            case .messagesFilled: return Warp.Strings.iconMessagesFilled.localized
            case .minus: return Warp.Strings.iconMinus.localized
            case .mixer: return Warp.Strings.iconMixer.localized
            case .money: return Warp.Strings.iconMoney.localized
            case .mountain: return Warp.Strings.iconMountain.localized
            case .newAd: return Warp.Strings.iconNewAd.localized
            case .norwegianMotor: return Warp.Strings.iconNorwegianMotor.localized
            case .noSmoking: return Warp.Strings.iconNoSmoking.localized
            case .officeDesk: return Warp.Strings.iconOfficeDesk.localized
            case .organize: return Warp.Strings.iconOrganize.localized
            case .parking: return Warp.Strings.iconParking.localized
            case .phone: return Warp.Strings.iconPhone.localized
            case .phoneScratched: return Warp.Strings.iconPhoneScratched.localized
            case .phoneUsed: return Warp.Strings.iconPhoneUsed.localized
            case .pictureStack: return Warp.Strings.iconPictureStack.localized
            case .pinMarker: return Warp.Strings.iconPinMarker.localized
            case .pinRound: return Warp.Strings.iconPinRound.localized
            case .planeTicket: return Warp.Strings.iconPlaneTicket.localized
            case .play: return Warp.Strings.iconPlay.localized
            case .playhouse: return Warp.Strings.iconPlayhouse.localized
            case .plots: return Warp.Strings.iconPlots.localized
            case .plus: return Warp.Strings.iconPlus.localized
            case .productBlink: return Warp.Strings.iconProductBlink.localized
            case .productBump: return Warp.Strings.iconProductBump.localized
            case .productCarousel: return Warp.Strings.iconProductCarousel.localized
            case .productHighlightListing: return Warp.Strings.iconProductHighlightListing.localized
            case .productNabolagsprofil: return Warp.Strings.iconProductNabolagsprofil.localized
            case .productNoAds: return Warp.Strings.iconProductNoAds.localized
            case .productStarred: return Warp.Strings.iconProductStarred.localized
            case .productTop: return Warp.Strings.iconProductTop.localized
            case .propeller: return Warp.Strings.iconPropeller.localized
            case .question: return Warp.Strings.iconQuestion.localized
            case .refresh: return Warp.Strings.iconRefresh.localized
            case .roomService: return Warp.Strings.iconRoomService.localized
            case .sailing: return Warp.Strings.iconSailing.localized
            case .sauna: return Warp.Strings.iconSauna.localized
            case .scrollUp: return Warp.Strings.iconScrollUp.localized
            case .search: return Warp.Strings.iconSearch.localized
            case .searchFavorites: return Warp.Strings.iconSearchFavorites.localized
            case .seat: return Warp.Strings.iconSeat.localized
            case .send: return Warp.Strings.iconSend.localized
            case .service: return Warp.Strings.iconService.localized
            case .share: return Warp.Strings.iconShare.localized
            case .shipping: return Warp.Strings.iconShipping.localized
            case .shoes: return Warp.Strings.iconShoes.localized
            case .shoppingCart: return Warp.Strings.iconShoppingCart.localized
            case .shower: return Warp.Strings.iconShower.localized
            case .skyscraper: return Warp.Strings.iconSkyscraper.localized
            case .smileyGood: return Warp.Strings.iconSmileyGood.localized
            case .smileyHappy: return Warp.Strings.iconSmileyHappy.localized
            case .smileyNeutral: return Warp.Strings.iconSmileyNeutral.localized
            case .smileySad: return Warp.Strings.iconSmileySad.localized
            case .sorting: return Warp.Strings.iconSorting.localized
            case .spa: return Warp.Strings.iconSpa.localized
            case .sparkles: return Warp.Strings.iconSparkles.localized
            case .speedometer: return Warp.Strings.iconSpeedometer.localized
            case .stairs: return Warp.Strings.iconStairs.localized
            case .starCheck: return Warp.Strings.iconStarCheck.localized
            case .starEmpty: return Warp.Strings.iconStarEmpty.localized
            case .starFull: return Warp.Strings.iconStarFull.localized
            case .starHalf: return Warp.Strings.iconStarHalf.localized
            case .store: return Warp.Strings.iconStore.localized
            case .stove: return Warp.Strings.iconStove.localized
            case .success: return Warp.Strings.iconSuccess.localized
            case .suitcase: return Warp.Strings.iconSuitcase.localized
            case .support: return Warp.Strings.iconSupport.localized
            case .swimming: return Warp.Strings.iconSwimming.localized
            case .tag: return Warp.Strings.iconTag.localized
            case .taskList: return Warp.Strings.iconTaskList.localized
            case .textBold: return Warp.Strings.iconTextBold.localized
            case .textItalic: return Warp.Strings.iconTextItalic.localized
            case .textStrikethrough: return Warp.Strings.iconTextStrikethrough.localized
            case .textUnderline: return Warp.Strings.iconTextUnderline.localized
            case .theater: return Warp.Strings.iconTheater.localized
            case .threeSixty: return Warp.Strings.iconThreeSixty.localized
            case .townHouse: return Warp.Strings.iconTownHouse.localized
            case .trendDown: return Warp.Strings.iconTrendDown.localized
            case .trendFlat: return Warp.Strings.iconTrendFlat.localized
            case .trendUp: return Warp.Strings.iconTrendUp.localized
            case .tv: return Warp.Strings.iconTv.localized
            case .twitter: return Warp.Strings.iconTwitter.localized
            case .up: return Warp.Strings.iconUp.localized
            case .upload: return Warp.Strings.iconUpload.localized
            case .user: return Warp.Strings.iconUser.localized
            case .userGroup: return Warp.Strings.iconUserGroup.localized
            case .users: return Warp.Strings.iconUsers.localized
            case .userWoman: return Warp.Strings.iconUserWoman.localized
            case .vacuum: return Warp.Strings.iconVacuum.localized
            case .verification: return Warp.Strings.iconVerification.localized
            case .wallet: return Warp.Strings.iconWallet.localized
            case .warning: return Warp.Strings.iconWarning.localized
            case .warranty: return Warp.Strings.iconWarranty.localized
            case .waterPitcher: return Warp.Strings.iconWaterPitcher.localized
            case .wheelchair: return Warp.Strings.iconWheelchair.localized
            case .wifi: return Warp.Strings.iconWifi.localized
            case .woods: return Warp.Strings.iconWoods.localized
            case .youtube: return Warp.Strings.iconYoutube.localized
            }
        }
    }
}

extension Warp {
    /// Icon set used for markets, loaded from the asset catalog in the framework.
    ///
    /// Provides both SwiftUI `Image` and UIKit `UIImage` representations for each icon.
    public enum TaxonomyIcon: String, CaseIterable, View {
        case airplane
        case airplaneHotel = "airplane-hotel"
        case babyonesie = "baby-onesie"
        case bulldozer
        case cabin
        case camping
        case carFront = "car-front"
        case carPart = "car-part"
        case carRent = "car-rent"
        case carSubscription = "car-subscription"
        case cart
        case chainsaw
        case chair
        case dating
        case economy
        case football
        case geometricShapes = "geometric-shapes"
        case guitarBat = "guitar-bat"
        case hotel
        case iceSkater = "ice-skater"
        case job
        case minivan
        case motorcycle
        case paintRoller = "paint-roller"
        case paw
        case phoneBadgeCheck = "phone-badge-check"
        case realEstate = "real-estate"
        case sailboat
        case shirt
        case smartPhone = "smart-phone"
        case sofa
        case storeFront = "store-front"
        case stroller
        case sweater
        case tools
        case tractor
        case van
        case vase

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(rawValue, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.template) // Ensure template rendering mode for vector images
                .resizable()
                .accessibilityLabel(localization)
        }

        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage {
            // Load the image from the asset catalog
            guard let image = UIImage(named: rawValue, in: .module, compatibleWith: nil) else {
                // Handle the error (e.g., log it) if image loading fails
                return UIImage()
            }
            image.accessibilityLabel = localization
            return image.withRenderingMode(.alwaysTemplate)
        }

        private var localization: String {
            switch self {
            case .airplane: return Warp.Strings.taxonomyIconAirplane.localized
            case .airplaneHotel: return Warp.Strings.taxonomyIconAirplaneHotel.localized
            case .babyonesie: return Warp.Strings.taxonomyIconBabyonesie.localized
            case .bulldozer: return Warp.Strings.taxonomyIconBulldozer.localized
            case .cabin: return Warp.Strings.taxonomyIconCabin.localized
            case .camping: return Warp.Strings.taxonomyIconCamping.localized
            case .carFront: return Warp.Strings.taxonomyIconCarFront.localized
            case .carPart: return Warp.Strings.taxonomyIconCarPart.localized
            case .carRent: return Warp.Strings.taxonomyIconCarRent.localized
            case .carSubscription: return Warp.Strings.taxonomyIconCarSubscription.localized
            case .cart: return Warp.Strings.taxonomyIconCart.localized
            case .chainsaw: return Warp.Strings.taxonomyIconChainsaw.localized
            case .chair: return Warp.Strings.taxonomyIconChair.localized
            case .dating: return Warp.Strings.taxonomyIconDating.localized
            case .economy: return Warp.Strings.taxonomyIconEconomy.localized
            case .football: return Warp.Strings.taxonomyIconFootball.localized
            case .geometricShapes: return Warp.Strings.taxonomyIconGeometricShapes.localized
            case .guitarBat: return Warp.Strings.taxonomyIconGuitarBat.localized
            case .hotel: return Warp.Strings.taxonomyIconHotel.localized
            case .iceSkater: return Warp.Strings.taxonomyIconIceSkater.localized
            case .job: return Warp.Strings.taxonomyIconJob.localized
            case .minivan: return Warp.Strings.taxonomyIconMinivan.localized
            case .motorcycle: return Warp.Strings.taxonomyIconMotorcycle.localized
            case .paintRoller: return Warp.Strings.taxonomyIconPaintRoller.localized
            case .paw: return Warp.Strings.taxonomyIconPaw.localized
            case .phoneBadgeCheck: return Warp.Strings.taxonomyIconPhoneBadgeCheck.localized
            case .realEstate: return Warp.Strings.taxonomyIconRealEstate.localized
            case .sailboat: return Warp.Strings.taxonomyIconSailboat.localized
            case .shirt: return Warp.Strings.taxonomyIconShirt.localized
            case .smartPhone: return Warp.Strings.taxonomyIconSmartPhone.localized
            case .sofa: return Warp.Strings.taxonomyIconSofa.localized
            case .storeFront: return Warp.Strings.taxonomyIconStoreFront.localized
            case .stroller: return Warp.Strings.taxonomyIconStroller.localized
            case .sweater: return Warp.Strings.taxonomyIconSweater.localized
            case .tools: return Warp.Strings.taxonomyIconTools.localized
            case .tractor: return Warp.Strings.taxonomyIconTractor.localized
            case .van: return Warp.Strings.taxonomyIconVan.localized
            case .vase: return Warp.Strings.taxonomyIconVase.localized
            }
        }
    }
}

extension Warp {
    /// Icon set used for brands, loaded from the asset catalog in the framework.
    ///
    /// Provides both SwiftUI `Image` and UIKit `UIImage` representations for each icon.
    public enum BrandIcon: String, CaseIterable, View {
        case autovex
        case honk
        case mittAnbud = "mitt-anbud"
        case nettbil
        case oikotie
        case remppatori

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(rawValue, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.original) // Ensure original rendering mode for vector images
                .resizable()
                .accessibilityLabel(localization)
        }

        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage {
            // Load the image from the asset catalog
            guard let image = UIImage(named: rawValue, in: .module, compatibleWith: nil) else {
                // Handle the error (e.g., log it) if image loading fails
                return UIImage()
            }
            image.accessibilityLabel = localization
            return image.withRenderingMode(.alwaysOriginal)
        }

        private var localization: String {
            switch self {
            case .autovex: return Warp.Strings.brandIconAutovex.localized
            case .honk: return Warp.Strings.brandIconHonk.localized
            case .mittAnbud: return Warp.Strings.brandIconMittAnbud.localized
            case .nettbil: return Warp.Strings.brandIconNettbil.localized
            case .oikotie: return Warp.Strings.brandIconOikotie.localized
            case .remppatori: return Warp.Strings.brandIconRemppatori.localized
            }
        }
    }
}

extension Warp {
    /// Icon set used for brand logos, loaded from the asset catalog in the framework.
    ///
    /// Provides both SwiftUI `Image` and UIKit `UIImage` representations for each icon.
    public enum BrandLogo: String, CaseIterable, View {
        case bilbasen
        case bilbasenSmall
        case blocket
        case blocketSmall
        case dba
        case dbaSmall
        case finn
        case finnSmall
        case finnTagline
        case oikotie
        case oikotieSmall
        case schibsted
        case schibstedSmall
        case tori
        case toriSmall

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(rawValue, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.original) // Ensure original rendering mode for vector images
                .accessibilityLabel(localization)
        }

        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage {
            // Load the image from the asset catalog
            guard let image = UIImage(named: rawValue, in: .module, compatibleWith: nil) else {
                // Handle the error (e.g., log it) if image loading fails
                return UIImage()
            }
            image.accessibilityLabel = localization
            return image.withRenderingMode(.alwaysOriginal)
        }

        private var localization: String {
            switch self {
            case .bilbasen: return Warp.Strings.brandLogoBilbasen.localized
            case .bilbasenSmall: return Warp.Strings.brandLogoBilbasen.localized
            case .blocket: return Warp.Strings.brandLogoBlocket.localized
            case .blocketSmall: return Warp.Strings.brandLogoBlocket.localized
            case .dba: return Warp.Strings.brandLogoDba.localized
            case .dbaSmall: return Warp.Strings.brandLogoDba.localized
            case .finn: return Warp.Strings.brandLogoFinn.localized
            case .finnSmall: return Warp.Strings.brandLogoFinn.localized
            case .finnTagline: return Warp.Strings.brandLogoFinn.localized
            case .oikotie: return Warp.Strings.brandLogoOikotie.localized
            case .oikotieSmall: return Warp.Strings.brandLogoOikotie.localized
            case .schibsted: return Warp.Strings.brandLogoSchibsted.localized
            case .schibstedSmall: return Warp.Strings.brandLogoSchibsted.localized
            case .tori: return Warp.Strings.brandLogoTori.localized
            case .toriSmall: return Warp.Strings.brandLogoTori.localized
            }
        }
    }
}
