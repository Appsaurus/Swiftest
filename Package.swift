// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Swiftest",
	products: [
		.library(name: "Swiftest", targets: ["Swiftest"])
	],
	dependencies: [
        .package(url: "https://github.com/Appsaurus/SwiftTestUtils", from: "1.0.0")
    ],
	targets: [
        .target(name: "Swiftest", dependencies: []),
		.testTarget(name: "SwiftestTests", dependencies: ["Swiftest", "SwiftTestUtils"])
	]
)
