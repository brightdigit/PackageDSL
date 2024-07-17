# ``PackageDSL``

Defining Swift Packages using Result Builders.

## Overview

Swift Packages are a great way to deliver the bulk of your app as well as share a piece of functionality or code. However there are times when your code base and therefore your Swift Package could grow especially if your targets are small pieces of functionality.

**PackageDSL** creates an easy to use DSL for dividing, organizing, and creating new Swift Packages.

* Only refer to targets and dependencies once.
* Easily apply Swift Settings and Unsafe Flags throughout a Swift Package.
* Keep your targets organized and easy to reference.

```
import PackageDescription

let package = Package(
  entries: {
    BushelUITests()
    BushelLibraryApp()
    BushelMachineApp()
    BushelSettingsApp()
    BushelApp()
    BushelService()
  },
  testTargets: {
    BushelServiceTests()
    BushelSessionTests()
  },
  swiftSettings: {
    Group("Experimental") {
      AccessLevelOnImport()
      BitwiseCopyable()
      GlobalActorIsolatedTypesUsability()
      IsolatedAny()
      MoveOnlyPartialConsumption()
      NestedProtocols()
      NoncopyableGenerics()
      RegionBasedIsolation()
      TransferringArgsAndResults()
      VariadicGenerics()
    }
    Group("Upcoming") {
      FullTypedThrows()
      InternalImportsByDefault()
    }
    WarnLongFunctionBodies(milliseconds: 100)
    WarnLongExpressionTypeChecking(milliseconds: 100)
  }
)
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
```

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->
