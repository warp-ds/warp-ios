// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "warp-ios",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Warp",
            targets: ["Warp"]
        ),
    ],
    targets: [
        .target(
            name: "Warp",
            path: "Sources",
            resources: [
                .process("Typography/Fonts"),
                .process("Resources")
            ]
        //    swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .testTarget(
            name: "tests",
            dependencies: ["Warp"]
        )
    ]
)
