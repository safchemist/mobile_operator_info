// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mobile_operator_info",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        // If the plugin name contains "_", replace with "-" for the library name.
        .library(name: "mobile-operator-info", targets: ["mobile_operator_info"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "mobile_operator_info",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
