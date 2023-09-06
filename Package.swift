// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "warp-ios",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "warp-ios",
            targets: ["warp-ios"]
        ),
    ],
    targets: [
        .target(
            name: "warp-ios",
            path: "Sources"
        ),
        .testTarget(
            name: "warp-iosTests",
            dependencies: ["warp-ios"]
        )
    ]
)
