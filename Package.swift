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
        // 0.10.5 or newer. ViewInspector 0.10.4 declared `.visionOS(.v2)` while still claiming
        // `swift-tools-version:5.9`, and `.v2` needs PackageDescription 6.0, so its manifest failed
        // to compile on 5.9 and dependency resolution died before a single test built. 0.10.5
        // declares `.visionOS(.v1)` again. Older releases cannot inspect the group accessibility
        // labels on iOS 27 (RadioGroup and CheckboxGroup title tests), so the floor is 0.10.5.
        // CI builds from the committed `Package.resolved`, so update that pin together with this bound.
        .package(url: "https://github.com/nalexn/ViewInspector", "0.10.5" ..< "0.11.0"),
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
