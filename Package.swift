// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "leetcode",
    products: [
        .library(
            name: "leetcode",
            targets: ["leetcode"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "leetcode",
            dependencies: ["common"]),
        .target(
            name: "common",
            dependencies: []),
        .testTarget(
            name: "leetcodeTests",
            dependencies: ["leetcode", "common"]),
    ]
)
