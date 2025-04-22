// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileVLCKit",
    platform: [
        .iOS(13)
    ]
    products: [
        .library(
            name: "MobileVLCKit",
            targets: ["MobileVLCKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "MobileVLCKit",
            path: "Sources/MobileVLCKit.xcframework"
        )
    ]
)
