# PackageDSL

Simplify the management of your Package.swift file with PackageDSL:

```swift
import PackageDescription

let package = Package {
  BushelCommand()
  BushelLibraryApp()
  BushelMachineApp()
  BushelSettingsApp()
  BushelApp()
}
testTargets: {
  BushelCoreTests()
}
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
```

## Table of Contents

   * [Why?](README.md#why?)
   * [What is this?](README.md#what-is-this)
   * [How do you install it?](README.md#how-do-you-install-it)
   * [How does it work?](README.md#how-does-it-work)
      * [Creating a Package](README.md#creating-a-package)
      * [How about remote dependencies?](README.md#how-about-remote-dependencies)
      * [How about test targets?](README.md#how-about-test-targets)
      * [How about language and platforms?](README.md#how-about-language-and-platforms)
   * [FAQ](README.md#faq)
      * [But it doesn't do this?!?! How about this?!?!? I don't know how to do this?!?!](README.md#but-it-doesnt-do-this-how-about-this-i-dont-know-how-to-do-this)
      * [Why would I do this?](README.md#why-would-i-do-this)
   * [Thanks](README.md#thanks)

## Why?

I was having a difficult time managing a large `Package.swift` file. Why go with this instead:

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

1. [Download this repo](https://github.com/brightdigit/PackageDSL/archive/refs/heads/main.zip)
2. Create Package directory inside your Swift Package
3. Copy `Support` folder over
4. Create `Package/Sources` - this will contain each file for your targets, products, test targets, dependencies, etc...
5. Create a file at root of `Package` which will contain [your package](README.md#creating-a-package):
```swift
 Package {
  // add products here
}
testTargets: {
  // add test targets here
}
```
6. Copy the `package.sh` script to concatenate all files in `Package` to your usable `Package.swift`
7. $Profit$

Here's the structure I use for Bushel's Swift Package:

<img width="265" alt="Screenshot 2023-07-25 at 11 46 12 AM" src="https://github.com/brightdigit/PackageDSL/assets/1036388/00c64d7c-114d-49a3-a629-82dd7f436270">

```
├── Package* // new folder you create
│   ├── Sources* // all files listing your targets, dependencies, products, etc...
|   |   ├── BushelApp.swift // definition of `BushelApp` product
│   └── Support* // copied from this repo
├── Package.resolved
├── Package.swift // built by `package.sh`
├── package.sh* // copied from this repo
├── Sources // actual source code of my package targets
│   ├── BushelApp
│   ├── BushelArgs
│   ├── BushelCore
│   ├── BushelData
│   ├── BushelDataCore
│   ├── BushelLibrary
│   ├── BushelLibraryApp
│   ├── BushelLibraryData
│   ├── BushelLibraryMacOS
│   ├── BushelLibraryViews
│   ├── BushelLocalization
│   ├── BushelLogging
│   ├── BushelMacOSCore
│   ├── BushelMachine
│   ├── BushelMachineApp
│   ├── BushelMachineData
│   ├── BushelMachineMacOS
│   ├── BushelMachineViews
│   ├── BushelSettingsApp
│   ├── BushelSettingsViews
│   ├── BushelUT
│   ├── BushelViews
│   ├── BushelViewsCore
│   ├── BushelVirtualization
│   └── bushel
└── Tests // actual source code of my package test targets
    └── BushelCoreTests
* the new stuff from PackageDSL
```

## How does it work?

The `Support` folder contains a group of Swift source files which define an easy DSL which translates the common parts of the `PackageDescription` namespace you use.

### Creating a Package 

A typical Package.swift might look like this:

```swift
// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BushelKit",
  ...
  products: [
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
  ...
  targets: [
    ...
    .testTarget(name: "BushelCoreTests", dependencies: ["BushelCore"])
  ]
)
```

With PackageDSL you can create a Package simply by defining the products of your package:

```swift
import PackageDescription

let package = Package {
  BushelCommand()
  BushelLibraryApp()
  BushelMachineApp()
  BushelSettingsApp()
  BushelApp()
}
testTargets: {
  BushelCoreTests()
}
```

Targets and dependencies are automatically pulled from your products and added the target section of your package. So for instance with `BushelApp`:

```swift
struct BushelApp: Product, Target {
  var dependencies: any Dependencies {
    BushelViews()
    BushelVirtualization()
    BushelMachine()
    BushelLibrary()
    BushelData()
  }
}
```

The dependencies listed such as `BushelViews` is automatically added to the `Package` as:

```swift
  .target(name: "BushelViews", dependencies: ["BushelLibraryViews", "BushelMachineViews", "BushelSettingsViews"]),
```


Also the dependencies from `BushelView` are added as well:

```swift
struct BushelViews: Target {
  var dependencies: any Dependencies {
    BushelLibraryViews()
    BushelMachineViews()
    BushelSettingsViews()
  }
}
```

It's recursive!!!

### How about remote dependencies?

Remote dependencies (i.e. `Package.Dependency`) are denoted by the `PackageDependency` protocol and just take a standard `Package.Dependency` property called `dependency`. Here's an example of how to add the Swift Argument Parser:

```swift
struct ArgumentParser: PackageDependency {
  var dependency: Package.Dependency {
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
  }
}
```

Then just add it as a dependency to your target:

```swift
struct BushelArgs: Target {
  var dependencies: any Dependencies {
    ArgumentParser()
    BushelCore()
  }
}
```

### How about test targets?

You can create a test target with the `TestTarget` protocol:

```swift
struct BushelCoreTests: TestTarget {
  var dependencies: any Dependencies {
    BushelCore()
  }
}
```

Then add it to your list of test targets using the `testTarget` argument:

```swift
let package = Package {
  BushelCommand()
  BushelLibraryApp()
  BushelMachineApp()
  BushelSettingsApp()
  BushelApp()
}
testTargets: {
  BushelCoreTests() // right here
}
```

### How about language and platforms?

Right now there are two modifier methods to do this. `defaultLocalization` which takes in a [`LanguageTag`](https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html#languagetag) and `supportedPlatforms` which can take in a list of platforms or a `PlatformSet`. 
A `PlatformSet` is useful if use a to define a set of platforms for a specific year such as:

```swift
struct WWDC2023: PlatformSet {
  var body: any SupportedPlatforms {
    SupportedPlatform.macOS(.v14)
    SupportedPlatform.iOS(.v17)
    SupportedPlatform.watchOS(.v10)
    SupportedPlatform.tvOS(.v17)
  }
}
```

Rather then define your platforms as:

```swift
let package = Package {
  ...
}
.supportedPlatforms {
  SupportedPlatform.macOS(.v14)
  SupportedPlatform.iOS(.v17)
  SupportedPlatform.watchOS(.v10)
  SupportedPlatform.tvOS(.v17)
}
```

You can simplify it as:

```swift
let package = Package {
  ...
}
.supportedPlatforms {
  WWDC2023()
}
```

## FAQ

### But it doesn't do this?!?! How about this?!?!? I don't know how to do this?!?!

[Create an issue.](https://github.com/brightdigit/PackageDSL/issues/new)

### Why would I do this?

If your package gets big enough, it becomes difficult to manage. This is way to do that. If your package is small enough, I don't recommend it _yet_.

## Thanks

* [@joshdholtz for inspiration with DeckUI](https://github.com/joshdholtz/DeckUI)
