// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileVLCKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MobileVLCKit",
            targets: ["MobileVLCKit"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "MobileVLCKit",
            url: "https://github.com/BassistZero/MobileVLCKit-no-dSYM/releases/download/3.6.0/MobileVLCKit.zip",
            checksum: "9059e8aaeb59c9e10a5aa830d157e7e60629095f8b9c49b6d4d7f418cf7d5616"
        )
    ]
)
