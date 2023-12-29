// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ComposerKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "ComposerKit",
            targets: ["ComposerKit"]),
    ],
    dependencies: [
        .package(url: "git@github.com:JosephPAntonetti/Pickers.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "ComposerKit",
        dependencies: [
            .product(name: "Pickers", package: "Pickers")
        ])
    ]
)
