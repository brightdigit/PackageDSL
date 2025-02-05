# PackageDSL

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
![DocC](https://img.shields.io/badge/DocC-_?style=flat&logo=readthedocs&logoColor=FFFFFF&labelColor=F05138&color=FFFFFF&link=https%3A%2F%2Fswiftpackageindex.com%2Fbrightdigit%2FPackageDSL%2Fmain%2Fdocumentation%2Fpackagedsl)

![GitHub Repo stars](https://img.shields.io/github/stars/brightdigit/PackageDSL?style=flat)
![GitHub](https://img.shields.io/github/license/brightdigit/PackageDSL)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/PackageDSL)
[![GitHub Workflow Status](https://github.com/brightdigit/PackageDSL/actions/workflows/lint.yml/badge.svg)](https://github.com/brightdigit/PackageDSL/actions/workflows/lint.yml)

![Twitter Follow](https://img.shields.io/badge/Follow%20%40leogdion-_?style=flat&logo=X&color=666666)
![Mastodon Follow](https://img.shields.io/mastodon/follow/109263136930561815?domain=c.im&style=flat)
![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCnl3jF6GHAvlj1MZyb6Ka9g?style=flat)

![GitHub Downloads (specific asset, latest release)](https://img.shields.io/github/downloads/brightdigit/PackageDSL/latest/package.sh?style=flat&logo=gnubash&label=Downloads&color=%234EAA25&link=https%3A%2F%2Fgithub.com%2Fbrightdigit%2FPackageDSL%2Freleases%2Fdownload%2Flatest%2Fpackage.sh)


Simplify the management of your Package.swift file with a type-safe, modular DSL:

```swift
import PackageDescription

let package = Package(
  name: "MyApp",
  entries: {
    AppTarget()
    NetworkingModule()
    DatabaseModule()
  },
  dependencies: {
    Alamofire()
    SQLite()
  },
  testTargets: {
    AppTests()
    NetworkingTests()
  },
  swiftSettings: {
    InternalImportsByDefault()
  }
)
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
```

## Why PackageDSL?

- **Modular Organization**: Split your package definition across multiple files for better maintainability
- **Type Safety**: Leverage Swift's type system to catch configuration errors at compile time
- **Better Discoverability**: Clear directory structure makes it easy to find and modify package components
- **Reduced Complexity**: Simplified syntax for defining products, targets, and dependencies
- **Easy Maintenance**: Update individual components without touching the entire Package.swift file

Table of Contents
=================

   * [Real World Example](#real-world-example)
   * [Getting Started](#getting-started)
      * [1. Basic Setup](#1-basic-setup)
      * [2. Define Your Components](#2-define-your-components)
      * [3. Generate Package.swift](#3-generate-packageswift)
   * [Installation](#installation)
   * [Usage](#usage)
      * [Arguments](#arguments)
      * [Options](#options)
      * [Examples](#examples)
   * [FAQ](#faq)
      * [How about test targets?](#how-about-test-targets)
      * [How about custom Swift settings?](#how-about-custom-swift-settings)
      * [How about adding resources?](#how-about-adding-resources)
      * [How do I specify target-specific platforms?](#how-do-i-specify-target-specific-platforms)
      * [What's the performance impact?](#whats-the-performance-impact)
      * [How do I migrate an existing package?](#how-do-i-migrate-an-existing-package)
   * [Thanks](#thanks)
   * [Contributing](#contributing)

## Real World Example

Check out [BushelKit](https://github.com/brightdigit/BushelKit), which uses PackageDSL to manage its complex package structure with multiple products and dependencies. Its `Package/Sources` directory demonstrates how to organize:

- Multiple product targets
- Nested dependencies
- Platform-specific code
- Test targets
- Documentation targets

```
Package
└── Sources
    ├── Dependencies
    │   ├── ArgumentParser.swift
    │   ├── DocC.swift
    │   ├── RadiantKit
    │   │   ├── RadiantDocs.swift
    │   │   ├── RadiantPaging.swift
    │   │   └── RadiantProgress.swift
    │   └── RadiantKit.swift
    ├── Index.swift
    ├── Platforms
    │   └── WWDC2023.swift
    ├── Products
    │   ├── BushelCommand.swift
    │   ├── BushelDocs.swift
    │   └── ... more products ...
    ├── Targets
    │   ├── BushelArgs.swift
    │   └── ... more targets ...
    └── Tests
        ├── BushelFactoryTests.swift
        └── ... more tests ...
```

## Getting Started

### 1. Basic Setup

Create a minimal package structure:

```
MyPackage/
└── Package/
    └── Sources/
        ├── Products/
        │   └── AppTarget.swift
        ├── Dependencies/
        │   └── Alamofire.swift
        └── Index.swift
```

### 2. Define Your Components

`Package/Sources/Products/AppTarget.swift`:
```swift
struct AppTarget: Product, Target {
  var dependencies: any Dependencies {
    Alamofire()
    CoreModule()
  }
}
```

`Package/Sources/Dependencies/Alamofire.swift`:
```swift
struct Alamofire: PackageDependency {
  var dependency: Package.Dependency {
    .package(
      url: "https://github.com/Alamofire/Alamofire.git", 
      from: "5.8.0"
    )
  }
}
```

`Package/Sources/Index.swift`:
```swift
let package = Package(
  entries: {
    AppTarget()
  }
)
```

### 3. Generate Package.swift

```bash
./package.sh . --version 5.9
```

## Installation

1. Download the `package.sh` script from our [latest release](https://github.com/brightdigit/PackageDSL/releases/latest/download/package.sh)

   Or using curl:
   ```bash
   curl -LO https://github.com/brightdigit/PackageDSL/releases/latest/download/package.sh
   ```

2. Make the script executable:
```bash
chmod +x package.sh
```

## Usage

The script accepts the following arguments:

```bash
./package.sh [PACKAGE_DIR] [OPTIONS]
```

### Arguments

- `PACKAGE_DIR`: Path to your package directory (required)

### Options

- `--version <version>`: Specify Swift tools version (default: 6.0)
- `--minimize`: Minimize the output by removing comments and extra whitespace

### Examples

Generate Package.swift for the current directory using Swift 5.9:
```bash
./package.sh . --version 5.9
```

Generate a minimized Package.swift for a specific package:
```bash
./package.sh ~/Projects/MyPackage --version 5.9 --minimize
```

## FAQ

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
### How about custom Swift settings?

Swift settings can be [added to all the targets using `swiftSettings` argument on the `Package` constructor](#packagedsl) or to a specific target by implementing using the `swiftSettings` property:

```swift
struct BushelFactory: Target {
  var dependencies: any Dependencies {
    BushelCore()
    BushelMachine()
    BushelLibrary()
    BushelLogging()
    BushelData()
  }
  
  var swiftSettings: [SwiftSetting] {
    InternalImportsByDefault()
  }
}
```


### How about adding resources?

To add resources simply implement the `resources` property on the `Target`:

```swift
struct BushelLocalization: Target {
  var resources : [Resource] {
    .process("Styling/Colors/Colors.xcassets")
    .process("Styling/Fonts/FontsFiles")
    .process("Images/Images.xcassets")
    .process("Images/whiteLoading.json")
    .process("Images/primaryLoading.json")
  }
}
```


Right now there are two modifier methods to do this. `defaultLocalization` which takes in a [`LanguageTag`](https://docs.swift.org/package-manager/PackageDescription/PackageDescription.html#languagetag) and `supportedPlatforms` which can take in a list of platforms or a `PlatformSet`. 
A `PlatformSet` is useful if use a to define a set of platforms for a specific year such as:

```swift
struct WWDC2023: PlatformSet {
  var body: any SupportedPlatforms {
    .macOS(.v14)
    .iOS(.v17)
    .watchOS(.v10)
    .tvOS(.v17)
  }
}
```

Rather then define your platforms as:

```swift
let package = Package {
  ...
}
.supportedPlatforms {
  .macOS(.v14)
  .iOS(.v17)
  .watchOS(.v10)
  .tvOS(.v17)
}
```

### How do I specify target-specific platforms?

Each target can implement the `platforms` property:

```swift
struct MacOnlyTarget: Target {
  var platforms: [SupportedPlatform] {
    SupportedPlatform.macOS(.v13)
  }
}
```

### What's the performance impact?

The DSL is used only at development time to generate your `Package.swift`. There's no runtime impact on your package or its users.

### How do I migrate an existing package?

1. Create the `Package` directory structure
2. Move each product, target, and dependency into separate files
3. Run the generator script to create your new `Package.swift`
4. Compare the generated file with your original to ensure everything transferred correctly

## Thanks

* [joshdholtz](https://github.com/joshdholtz) for inspiration with [DeckUI](https://github.com/joshdholtz/DeckUI)
