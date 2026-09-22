// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "warp-ios",
    platforms: [
        .iOS("18.0")
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
        // Upper bound, not `from:`. ViewInspector 0.10.4 declares `.visionOS(.v2)` while still
        // claiming `swift-tools-version:5.9`, and `.v2` needs PackageDescription 6.0 - so its
        // manifest fails to compile for anyone on 5.9 and dependency resolution dies before a
        // single test builds. Nothing here pins the version otherwise: `Package.resolved` is not
        // tracked, so CI resolves fresh on every run and picked 0.10.4 the day it was published.
        // Lift the bound once upstream ships a release that compiles under our tools-version.
        .package(url: "https://github.com/nalexn/ViewInspector", "0.10.0" ..< "0.10.4"),
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
            dependencies: [
                "Warp",
                .product(name: "ViewInspector", package: "ViewInspector")
            ],
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
