// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RemoteConfigKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "RemoteConfigKit",
            targets: ["RemoteConfigKit"]
        ),
    ],
    dependencies: [
        // No required dependencies - Firebase is optional
    ],
    targets: [
        .target(
            name: "RemoteConfigKit",
            dependencies: [
                // No dependencies - Firebase support is conditional via #if canImport
            ]
        ),
    ]
) 