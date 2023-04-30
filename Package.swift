// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "leetcode",
    products: [
        .library(
            name: "leetcode",
            targets: ["leetcode"]),
    ],
    targets: [
        .target(
            name: "leetcode",
            dependencies: []),
        .testTarget(
            name: "leetcodeTests",
            dependencies: ["leetcode"]),
    ]
)
