// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Swiftest",
	products: [
		.library(name: "Swiftest", targets: ["Swiftest"])
	],
	dependencies: [
        .package(name: "SwiftTestUtils", url: "https://github.com/Appsaurus/SwiftTestUtils", from: "1.0.0")
    ],
	targets: [
        .target(name: "Swiftest", dependencies: []),
		.testTarget(name: "SwiftestTests", dependencies: [
            "Swiftest",
            .product(name: "SwiftTestUtils", package: "SwiftTestUtils"),
        ])
	]
)
