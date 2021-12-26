// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AbstractTestCase",
    products: [
        .library(
            name: "AbstractTestCase",
            targets: ["AbstractTestCase"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "AbstractTestCase",
            dependencies: []),
        .testTarget(
            name: "AbstractTestCaseTests",
            dependencies: ["AbstractTestCase"]),
    ]
)
