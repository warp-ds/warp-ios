// swift-tools-version: 5.8
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
    dependencies: [
        .package(url: "https://github.com/nalexn/ViewInspector", from: "0.10.0"),
    ],
    targets: [
        .target(
            name: "Warp",
            path: "Sources",
            resources: [
                .process("Typography/Fonts"),
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "tests",
            dependencies: [
                "Warp",
                .product(name: "ViewInspector", package: "ViewInspector")
            ]
        )
    ]
)
