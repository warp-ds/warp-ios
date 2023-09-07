// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Warp-ios",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Warp-ios",
            targets: ["Warp-ios"]),
    ],
    dependencies: [
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer", exact: Version("1.4.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Warp-ios",
            dependencies: [
                .product(name: "Shimmer", package: "SwiftUI-Shimmer")
            ],
            resources: [.process("Typography/Fonts")]
        ),
        .testTarget(
            name: "Warp-iosTests",
            dependencies: ["Warp-ios"]),
    ]
)
