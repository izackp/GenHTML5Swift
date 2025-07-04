// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gen_html",
    platforms: [
        .macOS(.v13), //v10_15
        .iOS(.v13)],
    products: [
        .executable(name: "gen_html", targets: ["genHTML5"]),
        .library(name: "HTMLStandard", type: .static, targets: ["HTMLStandard"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(name: "genHTML5",
                dependencies: [
                    .product(name: "ArgumentParser", package: "swift-argument-parser"),
                    .target(name: "HTMLStandard")
                ]),
        .target(name: "HTMLStandard")
    ]
)
