// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "warp-ios",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "warp-ios",
            targets: ["warp-ios"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "warp-ios",
            path: "Sources"),
        .testTarget(
            name: "Warp-iosTests",
            dependencies: ["warp-ios"]),
    ]
)
