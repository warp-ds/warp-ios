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
            name: "Warp",
            targets: ["Warp"]
        ),
    ],
    targets: [
        .target(
            name: "Warp",
            path: "Sources",
            resources: [.process("Typography/Fonts")]
        ),
        .testTarget(
            name: "tests",
            dependencies: ["Warp"]
        )
    ]
)
