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
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.0.0"),
        .package(url: "https://github.com/alexey1312/SnapshotTestingHEIC.git", from: "1.0.0"),
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
            name: "WarpTests",
            dependencies: ["Warp"],
            path: "Tests/WarpTests"
        ),
        .testTarget(
            name: "WarpSnapshotTests",
            dependencies: [
                "Warp",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
                .product(name: "SnapshotTestingHEIC", package: "SnapshotTestingHEIC"),
            ],
            path: "Tests/WarpSnapshotTests"
        )
    ]
)
