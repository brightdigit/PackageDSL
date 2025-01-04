// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PackageDSL",
    platforms: [.macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PackageDSL",
            targets: ["PackageDSL"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-package-manager.git", branch: "swift-5.10-RELEASE"),
      .package(url: "https://github.com/apple/swift-format.git", from: "510.1.0"),
      .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.4.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PackageDSL",
            dependencies: [.product(name: "PackageDescription", package: "swift-package-manager")],  
            swiftSettings: [
              .define("USE_IMPL_ONLY_IMPORTS"),
              .unsafeFlags(["-package-description-version", "999.0"]),
              .unsafeFlags(["-enable-library-evolution"]),
          ]
        ),
        .testTarget(
            name: "PackageDSLTests",
            dependencies: ["PackageDSL"]),
    ]
)
