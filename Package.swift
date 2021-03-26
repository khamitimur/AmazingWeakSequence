// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AmazingWeakSequence",
    platforms: [
        .iOS(.v11)
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
