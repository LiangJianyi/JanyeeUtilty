// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JanyeeUtilty",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "JanyeeUtilty",
            targets: ["JanyeeUtilty"]),
        .library(
            name: "Graph",
            targets: ["Graph"]),
        .library(
            name: "Sequence",
            targets: ["Sequence"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "JanyeeUtilty",
            dependencies: ["Graph"]),
        .target(
            name: "Graph",
            dependencies: []),
        .target(
            name: "Sequence",
            dependencies: []),
        .testTarget(
            name: "JanyeeUtiltyTests",
            dependencies: ["JanyeeUtilty", "Graph"]),
        .testTarget(
            name: "GraphTests",
            dependencies: ["JanyeeUtilty", "Graph"]),
        .testTarget(
            name: "SequenceTests",
            dependencies: ["JanyeeUtilty", "Sequence"]),
    ]
)
