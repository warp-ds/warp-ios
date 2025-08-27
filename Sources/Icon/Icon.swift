import SwiftUI

extension Warp {
    /// Icon set used across Warp components, loaded from the asset catalog in the framework.
    ///
    /// This enum defines all available icons in the Warp design system. It provides both SwiftUI `Image` and UIKit `UIImage` representations,
    /// allowing for easy usage in different UI contexts.
    public enum Icon: String, CaseIterable, View {
        case activeAds
        case ads
        case tractor
        case airCon
        case allWheelDrive
        case animalPaw
        case archway
        case arrowDown
        case arrowLeft
        case arrowRight
        case arrowUp
        case paperclip
        case gearAutomatic
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
        case boat
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
        case carLeft
        case carRight
        case charger
        case charter
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
        case copy
        case colorPalette
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
        case dragDots
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
        case fileAdd
        case filter
        case fireplace
        case fishing
        case dumbbell
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
        case houseFilled
        case houseModern
        case housePerson
        case image
        case info
        case instagram
        case jetski
        case key
        case lamp
        case landscape
        case washingMachine
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
        case gearManual
        case map
        case messages
        case messagesFilled
        case minus
        case mixer
        case money
        case mountain
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
        case planeLand
        case planeTakeOff
        case ticket
        case play
        case playhouse
        case plus
        case rocket
        case productBump
        case productCarousel
        case productHighlightListing
        case productNabolagsprofil
        case megaphone
        case productStarred
        case productTop
        case propeller
        case question
        case refresh
        case road
        case roomService
        case rowingBoat
        case ruler
        case sauna
        case scrollUp
        case search
        case seat
        case send
        case wrench
        case share
        case shipping
        case shoes
        case shoppingCart
        case shower
        case singleCylinder
        case skyscraper
        case smileyGood
        case smileyHappy
        case smileyNeutral
        case smileySad
        case sorting
        case lotusFlower
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
        case x
        case up
        case upload
        case user
        case userGroup
        case users
        case vacuum
        case verification
        case wallet
        case warning
        case warranty
        case waterPitcher
        case weight
        case wheelchair
        case wifi
        case tree
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

        var localization: String {
            switch self {
            case .activeAds: return Warp.Strings.iconActiveAds.localized
            case .ads: return Warp.Strings.iconAds.localized
            case .tractor: return Warp.Strings.taxonomyIconTractor.localized
            case .airCon: return Warp.Strings.iconAirCon.localized
            case .allWheelDrive: return Warp.Strings.iconAllWheelDrive.localized
            case .animalPaw: return Warp.Strings.iconAnimalPaw.localized
            case .archway: return Warp.Strings.iconArchway.localized
            case .arrowDown: return Warp.Strings.iconArrowDown.localized
            case .arrowLeft: return Warp.Strings.iconArrowLeft.localized
            case .arrowRight: return Warp.Strings.iconArrowRight.localized
            case .arrowUp: return Warp.Strings.iconArrowUp.localized
            case .paperclip: return Warp.Strings.iconPaperclip.localized
            case .gearAutomatic: return Warp.Strings.iconGearAutomatic.localized
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
            case .boat: return Warp.Strings.iconBoat.localized
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
            case .carLeft: return Warp.Strings.iconCarLeft.localized
            case .carRight: return Warp.Strings.iconCarRight.localized
            case .charger: return Warp.Strings.iconCharger.localized
            case .charter: return Warp.Strings.iconCharter.localized
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
            case .copy: return Warp.Strings.iconCopy.localized
            case .colorPalette: return Warp.Strings.iconColorPalette.localized
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
            case .dragDots: return Warp.Strings.iconDragDots.localized
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
            case .fileAdd: return Warp.Strings.iconFileAdd.localized
            case .filter: return Warp.Strings.iconFilter.localized
            case .fireplace: return Warp.Strings.iconFireplace.localized
            case .fishing: return Warp.Strings.iconFishing.localized
            case .dumbbell: return Warp.Strings.iconDumbbell.localized
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
            case .houseFilled: return Warp.Strings.iconHouseFilled.localized
            case .houseModern: return Warp.Strings.iconHouseModern.localized
            case .housePerson: return Warp.Strings.iconHousePerson.localized
            case .image: return Warp.Strings.iconImage.localized
            case .info: return Warp.Strings.iconInfo.localized
            case .instagram: return Warp.Strings.iconInstagram.localized
            case .jetski: return Warp.Strings.iconJetski.localized
            case .key: return Warp.Strings.iconKey.localized
            case .lamp: return Warp.Strings.iconLamp.localized
            case .landscape: return Warp.Strings.iconLandscape.localized
            case .washingMachine: return Warp.Strings.iconWashingMachine.localized
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
            case .gearManual: return Warp.Strings.iconGearManual.localized
            case .map: return Warp.Strings.iconMap.localized
            case .messages: return Warp.Strings.iconMessages.localized
            case .messagesFilled: return Warp.Strings.iconMessagesFilled.localized
            case .minus: return Warp.Strings.iconMinus.localized
            case .mixer: return Warp.Strings.iconMixer.localized
            case .money: return Warp.Strings.iconMoney.localized
            case .mountain: return Warp.Strings.iconMountain.localized
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
            case .planeLand: return Warp.Strings.iconPlaneLand.localized
            case .planeTakeOff: return Warp.Strings.iconPlaneTakeOff.localized
            case .ticket: return Warp.Strings.iconTicket.localized
            case .play: return Warp.Strings.iconPlay.localized
            case .playhouse: return Warp.Strings.iconPlayhouse.localized
            case .plus: return Warp.Strings.iconPlus.localized
            case .rocket: return Warp.Strings.iconRocket.localized
            case .productBump: return Warp.Strings.iconProductBump.localized
            case .productCarousel: return Warp.Strings.iconProductCarousel.localized
            case .productHighlightListing: return Warp.Strings.iconProductHighlightListing.localized
            case .productNabolagsprofil: return Warp.Strings.iconProductNabolagsprofil.localized
            case .megaphone: return Warp.Strings.iconMegaphone.localized
            case .productStarred: return Warp.Strings.iconProductStarred.localized
            case .productTop: return Warp.Strings.iconProductTop.localized
            case .propeller: return Warp.Strings.iconPropeller.localized
            case .question: return Warp.Strings.iconQuestion.localized
            case .refresh: return Warp.Strings.iconRefresh.localized
            case .road: return Warp.Strings.iconRoad.localized
            case .roomService: return Warp.Strings.iconRoomService.localized
            case .rowingBoat: return Warp.Strings.iconRowingBoat.localized
            case .ruler: return Warp.Strings.iconRuler.localized
            case .sauna: return Warp.Strings.iconSauna.localized
            case .scrollUp: return Warp.Strings.iconScrollUp.localized
            case .search: return Warp.Strings.iconSearch.localized
            case .seat: return Warp.Strings.iconSeat.localized
            case .send: return Warp.Strings.iconSend.localized
            case .wrench: return Warp.Strings.iconWrench.localized
            case .share: return Warp.Strings.iconShare.localized
            case .shipping: return Warp.Strings.iconShipping.localized
            case .shoes: return Warp.Strings.iconShoes.localized
            case .shoppingCart: return Warp.Strings.iconShoppingCart.localized
            case .shower: return Warp.Strings.iconShower.localized
            case .singleCylinder: return Warp.Strings.iconSingleCylinder.localized
            case .skyscraper: return Warp.Strings.iconSkyscraper.localized
            case .smileyGood: return Warp.Strings.iconSmileyGood.localized
            case .smileyHappy: return Warp.Strings.iconSmileyHappy.localized
            case .smileyNeutral: return Warp.Strings.iconSmileyNeutral.localized
            case .smileySad: return Warp.Strings.iconSmileySad.localized
            case .sorting: return Warp.Strings.iconSorting.localized
            case .lotusFlower: return Warp.Strings.iconLotusFlower.localized
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
            case .x: return Warp.Strings.iconX.localized
            case .up: return Warp.Strings.iconUp.localized
            case .upload: return Warp.Strings.iconUpload.localized
            case .user: return Warp.Strings.iconUser.localized
            case .userGroup: return Warp.Strings.iconUserGroup.localized
            case .users: return Warp.Strings.iconUsers.localized
            case .vacuum: return Warp.Strings.iconVacuum.localized
            case .verification: return Warp.Strings.iconVerification.localized
            case .wallet: return Warp.Strings.iconWallet.localized
            case .warning: return Warp.Strings.iconWarning.localized
            case .warranty: return Warp.Strings.iconWarranty.localized
            case .waterPitcher: return Warp.Strings.iconWaterPitcher.localized
            case .weight: return Warp.Strings.iconWeight.localized
            case .wheelchair: return Warp.Strings.iconWheelchair.localized
            case .wifi: return Warp.Strings.iconWifi.localized
            case .tree: return Warp.Strings.iconTree.localized
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
        case planeTakeOff = "airplane"
        case airplaneBed = "airplane-hotel"
        case cabinHut = "cabin"
        case carPart = "car-part"
        case carRent = "car-rent"
        case chair
        case guitar = "guitar-bat"
        case building = "hotel"
        case iceSkater = "ice-skater"
        case briefcase = "job"
        case carRight = "minivan"
        case motorcycle
        case animalPaw = "paw"
        case phoneCheck = "phone-badge-check"
        case houseModern = "real-estate"
        case boat = "sailboat"
        case shirt
        case phone = "smart-phone"
        case sofa
        case storeFront = "store-front"
        case stroller
        case drill = "tools"
        case tractor
        case vase
        case briefcaseUser
        case calendarPlus
        case confetti
        case draw
        case luggage
        case rotateLeft
        case rotateRight
        case shrink
        case suitcaseTrolley
        case tShirt

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(taxonomyAssetName, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.template) // Ensure template rendering mode for vector images
                .resizable()
                .accessibilityLabel(localization)
        }

        /// Returns a `UIImage` for the corresponding icon, loaded from the asset catalog.
        ///
        /// - Returns: A `UIImage` object corresponding to the icon.
        public var uiImage: UIImage {
            // Load the image from the asset catalog
            guard let image = UIImage(named: taxonomyAssetName, in: .module, compatibleWith: nil) else {
                // Handle the error (e.g., log it) if image loading fails
                return UIImage()
            }
            image.accessibilityLabel = localization
            return image.withRenderingMode(.alwaysTemplate)
        }

        var localization: String {
            switch self {
            case .planeTakeOff: return Warp.Strings.taxonomyIconPlaneTakeOff.localized
            case .airplaneBed: return Warp.Strings.taxonomyIconAirplaneBed.localized
            case .cabinHut: return Warp.Strings.taxonomyIconCabinHut.localized
            case .carPart: return Warp.Strings.taxonomyIconCarPart.localized
            case .carRent: return Warp.Strings.taxonomyIconCarRent.localized
            case .chair: return Warp.Strings.taxonomyIconChair.localized
            case .guitar: return Warp.Strings.taxonomyIconGuitar.localized
            case .building: return Warp.Strings.taxonomyIconBuilding.localized
            case .iceSkater: return Warp.Strings.taxonomyIconIceSkater.localized
            case .briefcase: return Warp.Strings.taxonomyIconBriefcase.localized
            case .carRight: return Warp.Strings.taxonomyIconCarRight.localized
            case .motorcycle: return Warp.Strings.taxonomyIconMotorcycle.localized
            case .animalPaw: return Warp.Strings.taxonomyIconAnimalPaw.localized
            case .phoneCheck: return Warp.Strings.taxonomyIconPhoneCheck.localized
            case .houseModern: return Warp.Strings.taxonomyIconHouseModern.localized
            case .boat: return Warp.Strings.taxonomyIconBoat.localized
            case .shirt: return Warp.Strings.taxonomyIconShirt.localized
            case .phone: return Warp.Strings.taxonomyIconPhone.localized
            case .sofa: return Warp.Strings.taxonomyIconSofa.localized
            case .storeFront: return Warp.Strings.taxonomyIconStoreFront.localized
            case .stroller: return Warp.Strings.taxonomyIconStroller.localized
            case .drill: return Warp.Strings.taxonomyIconDrill.localized
            case .tractor: return Warp.Strings.taxonomyIconTractor.localized
            case .vase: return Warp.Strings.taxonomyIconVase.localized
            case .briefcaseUser: return Warp.Strings.iconBriefcaseUser.localized
            case .calendarPlus: return Warp.Strings.iconCalendarPlus.localized
            case .confetti: return Warp.Strings.iconConfetti.localized
            case .draw: return Warp.Strings.iconDraw.localized
            case .luggage: return Warp.Strings.iconLuggage.localized
            case .rotateLeft: return Warp.Strings.iconRotateLeft.localized
            case .rotateRight: return Warp.Strings.iconRotateRight.localized
            case .shrink: return Warp.Strings.iconShrink.localized
            case .suitcaseTrolley: return Warp.Strings.iconSuitcaseTrolley.localized
            case .tShirt: return Warp.Strings.iconTShirt.localized
            }
        }

        /// Maps the icon case to the corresponding asset name in the asset catalog.
        /// This is to avoid dash case issues with enum raw values.
        private var taxonomyAssetName: String {
            switch self {
            case .planeTakeOff: return "PlaneTakeOff"
            case .airplaneBed: return "AirplaneBed"
            case .cabinHut: return "CabinHut"
            case .carPart: return "CarPart"
            case .carRent: return "CarRent"
            case .chair: return "Chair"
            case .guitar: return "Guitar"
            case .building: return "Building"
            case .iceSkater: return "IceSkater"
            case .briefcase: return "Briefcase"
            case .carRight: return "CarRight"
            case .motorcycle: return "Motorcycle"
            case .animalPaw: return "AnimalPaw"
            case .phoneCheck: return "PhoneCheck"
            case .houseModern: return "HouseModern"
            case .boat: return "Boat"
            case .shirt: return "Shirt"
            case .phone: return "Phone"
            case .sofa: return "Sofa"
            case .storeFront: return "StoreFront"
            case .stroller: return "Stroller"
            case .drill: return "Drill"
            case .tractor: return "Tractor"
            case .vase: return "Vase"
            case .briefcaseUser: return "BriefcaseUser"
            case .calendarPlus: return "CalendarPlus"
            case .confetti: return "Confetti"
            case .draw: return "Draw"
            case .luggage: return "Luggage"
            case .rotateLeft: return "RotateLeft"
            case .rotateRight: return "RotateRight"
            case .shrink: return "Shrink"
            case .suitcaseTrolley: return "SuitcaseTrolley"
            case .tShirt: return "TShirt"
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
        case mittAnbud = "mitt-anbud"
        case nettbil
        case oikotie
        case remppatori
        case qasa

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

        var localization: String {
            switch self {
            case .autovex: return Warp.Strings.brandIconAutovex.localized
            case .mittAnbud: return Warp.Strings.brandIconMittAnbud.localized
            case .nettbil: return Warp.Strings.brandIconNettbil.localized
            case .oikotie: return Warp.Strings.brandIconOikotie.localized
            case .remppatori: return Warp.Strings.brandIconRemppatori.localized
            case .qasa: return Warp.Strings.brandIconQasa.localized
            }
        }
    }
}

extension Warp {
    /// Icon set used for brand logos, loaded from the asset catalog in the framework.
    ///
    /// Provides both SwiftUI `Image` and UIKit `UIImage` representations for each icon.
    public enum BrandLogo: CaseIterable, View, Hashable {
        case bilbasen(LogoSize)
        case blocket(LogoSize)
        case dba(LogoSize)
        case finn(LogoSize)
        case oikotie(LogoSize)
        case schibsted(LogoSize)
        case tori(LogoSize)

        /// Enum representing the size of a `LogoView`.
        public enum LogoSize {
            case small
            case `default`
        }

        /// The body for the `View` conformance, rendering the corresponding SwiftUI `Image`.
        public var body: some View {
            SwiftUI.Image(assetName, bundle: .module) // Load the image from the asset catalog
                .renderingMode(.original) // Ensure original rendering mode for vector images
                .accessibilityLabel(localization)
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
            return image.withRenderingMode(.alwaysOriginal)
        }

        /// The name of the asset associated with the brand logo.
        public var assetName: String {
            switch self {
            case .bilbasen(let size):
                size == .default ? "bilbasen" : "bilbasenSmall"
            case .blocket(let size):
                size == .default ? "blocket" : "blocketSmall"
            case .dba(let size):
                size == .default ? "dba" : "dbaSmall"
            case .finn(let size):
                size == .default ? "finn" : "finnSmall"
            case .oikotie(let size):
                size == .default ? "oikotie" : "oikotieSmall"
            case .schibsted(let size):
                size == .default ? "schibsted" : "schibstedSmall"
            case .tori(let size):
                size == .default ? "tori" : "toriSmall"
            }
        }

        var localization: String {
            switch self {
            case .bilbasen: return Warp.Strings.brandLogoBilbasen.localized
            case .blocket: return Warp.Strings.brandLogoBlocket.localized
            case .dba: return Warp.Strings.brandLogoDba.localized
            case .finn: return Warp.Strings.brandLogoFinn.localized
            case .oikotie: return Warp.Strings.brandLogoOikotie.localized
            case .schibsted: return Warp.Strings.brandLogoSchibsted.localized
            case .tori: return Warp.Strings.brandLogoTori.localized
            }
        }

        public static var allCases = [Warp.BrandLogo.bilbasen(.default),
                                      Warp.BrandLogo.bilbasen(.small),
                                      Warp.BrandLogo.blocket(.default),
                                      Warp.BrandLogo.blocket(.small),
                                      Warp.BrandLogo.dba(.default),
                                      Warp.BrandLogo.dba(.small),
                                      Warp.BrandLogo.finn(.default),
                                      Warp.BrandLogo.finn(.small),
                                      Warp.BrandLogo.oikotie(.default),
                                      Warp.BrandLogo.oikotie(.small),
                                      Warp.BrandLogo.schibsted(.default),
                                      Warp.BrandLogo.schibsted(.small),
                                      Warp.BrandLogo.tori(.default),
                                      Warp.BrandLogo.tori(.small)]
    }
}
