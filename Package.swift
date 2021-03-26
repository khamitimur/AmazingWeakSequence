// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AmazingWeakSequence",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
    ],
    products: [
        .library(
            name: "AmazingWeakSequence",
            targets: ["AmazingWeakSequence"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "AmazingWeakSequence",
            dependencies: []),
        .testTarget(
            name: "AmazingWeakSequenceTests",
            dependencies: ["AmazingWeakSequence"]),
    ]
)
