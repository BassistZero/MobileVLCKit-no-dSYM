// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MobileVLCKit",
    platforms: [
        .iOS(.v13)
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
            url: "https://github.com/BassistZero/MobileVLCKit/releases/download/3.6.0/MobileVLCKit.zip",
            checksum: "378e36f417d1461c99a61ff58cd766de7ad5fc8e8d620ef340358e0266628fa1"
        )
    ]
)
