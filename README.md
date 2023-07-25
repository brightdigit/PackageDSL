# PackageDSL

I was having a difficult time managing a large `Package.swift` file:

```swift
// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BushelKit",
  defaultLocalization: "en",
  platforms: [.macOS(.v14), .iOS(.v17), .watchOS(.v10), .tvOS(.v17)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "BushelApp",
      targets: ["BushelApp"]
    ),
    .library(
      name: "BushelSettingsApp",
      targets: ["BushelSettingsApp"]
    ),
    .library(
      name: "BushelLibraryApp",
      targets: ["BushelLibraryApp"]
    ),
    .library(
      name: "BushelMachineApp",
      targets: ["BushelMachineApp"]
    ),
    .executable(name: "bushel", targets: ["bushel"])
  ],
  dependencies: [
    .package(url: "https://github.com/brightdigit/FelinePine.git", from: "0.1.0-alpha.3"),
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
  ],
  targets: [
    .target(name: "BushelCore"),
    .target(name: "BushelLocalization"),
    .target(name: "BushelUT", dependencies: ["BushelCore"]),
    .target(name: "BushelLogging", dependencies: ["FelinePine"]),
    .target(name: "BushelArgs", dependencies: [
      .product(name: "ArgumentParser", package: "swift-argument-parser")
    ]),

    .target(name: "BushelDataCore", dependencies: ["BushelLogging"]),
    .target(name: "BushelViewsCore", dependencies: ["BushelUT", "BushelLogging"]),

    .executableTarget(name: "bushel", dependencies: ["BushelArgs"]),
    .target(name: "BushelApp", dependencies: ["BushelViews", "BushelVirtualization", "BushelLibrary", "BushelData", "BushelMachine"]),
    .target(name: "BushelViews", dependencies: ["BushelLibraryViews", "BushelMachineViews", "BushelSettingsViews"]),
    .target(name: "BushelData", dependencies: ["BushelLibraryData", "BushelMachineData"]),

    .target(name: "BushelSettingsApp", dependencies: ["BushelSettingsViews"]),
    .target(name: "BushelSettingsViews", dependencies: ["BushelData", "BushelLocalization"]),

    .target(name: "BushelLibrary", dependencies: ["BushelLogging", "BushelCore"]),
    .target(name: "BushelLibraryData", dependencies: ["BushelLibrary", "BushelLogging", "BushelDataCore"]),
    .target(name: "BushelLibraryViews", dependencies: ["BushelLibrary", "BushelLibraryData", "BushelLogging", "BushelUT", "BushelViewsCore"]),
    .target(name: "BushelLibraryApp", dependencies: ["BushelLibraryViews", "BushelLibraryMacOS"]),

    .target(name: "BushelMachine", dependencies: ["BushelLogging", "BushelCore"]),
    .target(name: "BushelMachineData", dependencies: ["BushelMachine", "BushelLogging", "BushelDataCore"]),
    .target(name: "BushelMachineViews", dependencies: ["BushelMachine", "BushelMachineData", "BushelLogging", "BushelUT", "BushelLocalization", "BushelViewsCore"]),
    .target(name: "BushelMachineApp", dependencies: ["BushelMachineViews", "BushelMachineMacOS"]),

    .target(name: "BushelVirtualization", dependencies: ["BushelLibraryMacOS", "BushelMachineMacOS"]),

    .target(
      name: "BushelLibraryMacOS",
      dependencies: ["BushelLibrary"]
    ),
    .target(name: "BushelMachineMacOS", dependencies: ["BushelMachine"])
  ]
)
```

There has to be a better way that takes advantage of the DSL capabilities of Swift.

## What is this?

If you have a large enough Swift Package this is ideal for you.

<img width="1258" alt="Screenshot 2023-07-25 at 11 43 38 AM" src="https://github.com/brightdigit/PackageDSL/assets/1036388/a298f6d9-b28f-429c-9835-d5ed5f133a02">

Setup individual targets, products, and dependencies using this DSL and create an easily organized, simplified, and easy to maintain Package for your Swift project.

## How do you install it?

Here's the structure I use for Bushel's Swift Package:

<img width="265" alt="Screenshot 2023-07-25 at 11 46 12 AM" src="https://github.com/brightdigit/PackageDSL/assets/1036388/00c64d7c-114d-49a3-a629-82dd7f436270">

[comment]: <> (Text based tree structure comparing typical vs this one)

1. Create Package directory inside your Swift Package
2. Copy `Support` folder over
3. Create `Package/Sources` - this will contain each file for your targets, products, test targets, dependencies, etc...
4. Create a file at root of `Package` which will contain your package:

5. Copy the `package.sh` script to concatenate all files in `Package` to your usable `Package.swift`
6. $$$

## How does it work?

## FAQ

## Thanks
